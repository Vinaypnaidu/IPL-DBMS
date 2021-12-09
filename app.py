import os
from flask import Flask, flash, request, redirect, url_for, render_template
from flask.helpers import make_response
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

app = Flask(__name__)

# Check for environment variable
if not os.getenv("DATABASE_URL"):
    raise RuntimeError("DATABASE_URL is not set")

app.config.from_object(os.environ['APP_SETTINGS'])


# Set up database
engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))

class Team:
    def __init__(self, id_team, id_owner, tcap, twk, tname):
        self.id_team = id_team
        self.id_owner = id_owner
        self.tcap = tcap
        self.twk = twk
        self.tname = tname

@app.route("/")
def hello():
    return render_template('layout.html')

@app.route("/getallteams")
def getallteams():
    teams = db.execute("SELECT * FROM team").fetchall()
    return render_template('teams.html', teams = teams)


@app.route("/getallstats-batsman")
def getallstatsbatsman():
    stats = db.execute("SELECT Pname, sum(runs) FROM Individual_Score as ind, Player where ind.playerid = Player.playerid and Prole = 'Batsman'  group by player.playerid order by sum(runs) desc").fetchall()
    stats = [(item[0], str(item[1])) for item in stats]
    bestbatsman = stats[0]
    return render_template('stats.html', stats = stats, bestbatsman = bestbatsman)

@app.route("/getallstats-bowlers")
def getallstatsbowlers():
    stats = db.execute("SELECT Pname, sum(wickets) FROM Individual_Score as ind, Player where ind.playerid = Player.playerid and Prole = 'Bowler'  group by player.playerid order by sum(wickets) desc").fetchall()
    bestbowler = stats[0]
    return render_template('stats.html', stats = stats, bestbowler = bestbowler)

@app.route("/getallmatches")
def getallmatches():
    matches = db.execute("select mdate, vname, string_agg(tname, ','), won_by from match, venue, plays, team where match.venueid = venue.venueid and match.matchid = plays.matchid and plays.teamid = team.teamid group by mdate,vname,won_by ").fetchall()
    matches = [(str(item[0]), (item[1]),item[2],item[3]) for item in matches]
    return render_template('matches.html', matches = matches)

@app.route("/getallvenues")
def getallvenues():
    venues = db.execute("SELECT vname, count(*) from venue, match where match.venueid = venue.venueid group by vname").fetchall()
    return render_template('venues.html', venues = venues)

@app.route("/getallumpires")
def getallumpires():
    umpires = db.execute("select uname, count(matchid) from umpire, umpires where umpire.umpireid = umpires.umpireid group by uname").fetchall()
    return render_template('umpires.html', umpires = umpires)


@app.route("/signin", methods=['GET', 'POST'])
def signin():
    
    if request.method == "POST":

        name = request.form.get("username")
        password_var = request.form.get("password")

        dbpassword = db.execute("select opass from owners where ouser = '{}'".format(name)).fetchone()
        if dbpassword != None:
            dbpassword = dbpassword[0]

        else:
            messages = "Invalid username or password"
            return render_template('signin.html', messages = messages)


        if dbpassword == password_var:
            if name == "smanager":
                messages = "Logged in as Stats Manager."
                return render_template('statsmanager.html', messages = messages)
            if name == "amanager":
                messages = "Logged in as Auction Manager."
                
                bids = db.execute("select oname, pname, bid_placed from bids, owners, player where owners.ownerid=bids.ownerid and player.playerid=bids.playerid")
                bids = [(item[0], item[1], str(item[2])) for item in bids]
                return render_template('auctionmanager.html', messages = messages, bids = bids)
            messages = "Logged In as {}".format(name)
            unsoldplayers = db.execute("select * from player where psold=false").fetchall()
            unsoldplayers = [(item[0], item[1], item[2], item[3], item[4], str(item[5]), item[6]) for item in unsoldplayers]
            return render_template("auction.html", messages = messages, unsoldplayers = unsoldplayers, owner = name )
        
        else:
            messages = "Couldn't Sign In, Please try again..."
            return render_template('signin.html', messages = messages)

        

    if request.method == "GET":
        messages = "Please sign in"
        return render_template('signin.html', messages = messages)

@app.route("/addmatch", methods=['POST'])
def addmatch():
    if request.method == "POST":
        won_by = request.form.get("wonby")
        umpiredby = request.form.get("umpiredby")
        mdate = request.form.get("mdate")
        #print(mdate)
        venue = str(request.form.get("venue"))
        mrevenue = int(request.form.get("revenue"))
        teamone = request.form.get("teamone")
        teamtwo = request.form.get("teamtwo")

        player1team1 = request.form.get("player1team1")
        player1runs1 = int(request.form.get("player1runs1"))
        player1wickets1 = int(request.form.get("player1wickets1"))
        player1ballsplayed1 = int(request.form.get("player1ballsplayed1"))
        player1ballsbowled1 = int(request.form.get("player1ballsbowled1"))

        player2team1 = request.form.get("player2team1")
        player2runs1 = int(request.form.get("player2runs1"))
        player2wickets1 = int(request.form.get("player2wickets1"))
        player2ballsplayed1 = int(request.form.get("player2ballsplayed1"))
        player2ballsbowled1 = int(request.form.get("player2ballsbowled1"))

        player1team2 = request.form.get("player1team2")
        player1runs2 = int(request.form.get("player1runs2"))
        player1wickets2 = int(request.form.get("player1wickets2"))
        player1ballsplayed2 = int(request.form.get("player1ballsplayed2"))
        player1ballsbowled2 = int(request.form.get("player1ballsbowled2"))

        player2team2 = request.form.get("player2team2")
        player2runs2 = int(request.form.get("player2runs2"))
        player2wickets2 = int(request.form.get("player2wickets2"))
        player2ballsplayed2 = int(request.form.get("player2ballsplayed2"))
        player2ballsbowled2 = int(request.form.get("player2ballsbowled2"))

        venueid = db.execute("SELECT venueid from venue where vname = '{}'".format(venue)).fetchone()    
        venueid = int(venueid[0])
        try:
            db.execute("INSERT INTO match (venueid, mdate, mrevenue, won_by) VALUES (:venueid, :mdate, :mrevenue, :won_by)",{"venueid":venueid, "mdate":mdate, "mrevenue":mrevenue, "won_by":won_by})
            db.commit()
            matchid = db.execute("SELECT matchid FROM match where mdate = '{}'".format(mdate)).fetchone()
            matchid = int(matchid[0])

        except Exception as e:
            messages = e
            return render_template('statsmanager.html', messages = messages)

        team1id = db.execute("SELECT teamid from team where tname = '{}'".format(teamone)).fetchone()  
        team1id = int(team1id[0]) 
        team2id = db.execute("SELECT teamid from team where tname = '{}'".format(teamtwo)).fetchone()     
        team2id = int(team2id[0])

        try:
            db.execute("INSERT INTO plays (teamid, matchid) VALUES (:teamid, :matchid)",{"teamid":team1id, "matchid":matchid})
            db.execute("INSERT INTO plays (teamid, matchid) VALUES (:teamid, :matchid)",{"teamid":team2id, "matchid":matchid}) 
            db.commit()

        except:
            messages = "Could not insert into plays table"
            return render_template('statsmanager.html', messages = messages)

        umpireid = db.execute("SELECT umpireid from umpire where uname = '{}'".format(umpiredby)).fetchone()  
        umpireid = int(umpireid[0])  

        try:
            db.execute("INSERT INTO umpires (umpireid, matchid) VALUES (:umpireid, :matchid)",{"umpireid":umpireid, "matchid":matchid})
            db.commit()

        except:
            messages = "Could not insert into umpires table"
            return render_template('statsmanager.html', messages = messages)

        player1team1id = db.execute("SELECT playerid from player where pname = '{}'".format(player1team1)).fetchone() 
        player1team1id = int(player1team1id[0])    
        player1team2id = db.execute("SELECT playerid from player where pname = '{}'".format(player1team2)).fetchone()  
        player1team2id = int(player1team2id[0])   
        player2team1id = db.execute("SELECT playerid from player where pname = '{}'".format(player2team1)).fetchone()   
        player2team1id = int(player2team1id[0])  
        player2team2id = db.execute("SELECT playerid from player where pname = '{}'".format(player2team2)).fetchone()   
        player2team2id = int(player2team2id[0])  

        try:
            db.execute("INSERT INTO individual_score (playerid, matchid, runs, wickets, balls_played, balls_bowled ) VALUES (:playerid, :matchid, :runs, :wickets, :balls_played, :balls_bowled )",{"playerid":player1team1id, "matchid":matchid, "runs":player1runs1, "wickets":player1wickets1, "balls_played":player1ballsplayed1, "balls_bowled":player1ballsbowled1})
            db.execute("INSERT INTO individual_score (playerid, matchid, runs, wickets, balls_played, balls_bowled ) VALUES (:playerid, :matchid, :runs, :wickets, :balls_played, :balls_bowled )",{"playerid":player1team2id, "matchid":matchid, "runs":player1runs2, "wickets":player1wickets2, "balls_played":player1ballsplayed2, "balls_bowled":player1ballsbowled2})
            db.execute("INSERT INTO individual_score (playerid, matchid, runs, wickets, balls_played, balls_bowled ) VALUES (:playerid, :matchid, :runs, :wickets, :balls_played, :balls_bowled )",{"playerid":player2team1id, "matchid":matchid, "runs":player2runs1, "wickets":player2wickets1, "balls_played":player2ballsplayed1, "balls_bowled":player2ballsbowled1})
            db.execute("INSERT INTO individual_score (playerid, matchid, runs, wickets, balls_played, balls_bowled ) VALUES (:playerid, :matchid, :runs, :wickets, :balls_played, :balls_bowled )",{"playerid":player2team2id, "matchid":matchid, "runs":player2runs2, "wickets":player2wickets2, "balls_played":player2ballsplayed2, "balls_bowled":player2ballsbowled2})
            db.commit()

        except Exception as e:
            messages = e
            return render_template('statsmanager.html', messages = messages)

        messages = "Match successfully added"
        return render_template('statsmanager.html', messages = messages)

@app.route("/placebid", methods=['POST'])
def placebid():
    if request.method == "POST":
        playername = request.form.get("player").strip()
        bidamount = float(request.form.get("bidamount"))
        newuser = request.form.get("newuser")
        newpassword = request.form.get("newpassword")

        dbpassword = db.execute("select opass from owners where ouser = '{}'".format(newuser)).fetchone()
        if dbpassword != None:
            dbpassword = dbpassword[0]
        else:
            messages = "Invalid username or password"
            return render_template('signin.html', messages = messages)

        if dbpassword == newpassword:
            ownerid = db.execute("SELECT ownerid from owners where ouser = '{}'".format(newuser)).fetchone()[0] 
            playerid = db.execute("SELECT playerid from player where pname = '{}'".format(playername)).fetchone()[0] 
            db.execute("INSERT INTO bids (ownerid, playerid, bid_placed) VALUES (:ownerid, :playerid, :bid_placed)",{"ownerid":ownerid, "playerid":playerid, "bid_placed":bidamount })
            db.commit()
            messages = "Bid succesfully placed."
            unsoldplayers = db.execute("select player.*, max(bid_placed) from player left join bids on player.playerid = bids.playerid where psold=false group by player.playerid").fetchall()
            unsoldplayers = [(item[0], item[1], item[2], item[3], item[4], str(item[5]), item[6], str(item[7])) for item in unsoldplayers]
            return render_template('auction.html', messages = messages, unsoldplayers = unsoldplayers)
        else:
            messages = "Invalid username or password"
            return render_template('signin.html', messages = messages)

@app.route("/resolvebid")
def resolvebids():
    ret = db.execute("with a as (select playerid,max(bid_placed) as b from bids group by playerid) select ownerid, a.playerid, b from bids,a where bids.playerid=a.playerid and bid_placed=b")
    lis = []
    for i in ret:
        teamid = db.execute("select teamid from owners,team where owners.ownerid = team.ownerid and owners.ownerid = {}".format(i[0])).fetchone()[0]
        teamname = db.execute("select tname from team where teamid  = {}".format(teamid)).fetchone()[0] 
        playername = db.execute("select pname from player where playerid  = {}".format(i[1])).fetchone()[0] 
        lis.append((teamname, playername, str(i[2])))
        print("doin some append")
        db.execute("update player set teamid = {}, psold = true where playerid = {}".format(teamid,i[1]))
        db.commit()
        
    db.execute("delete from bids")
    db.commit()
    messages = "All the bids resolved"
    return render_template('resolved.html', lis = lis, messages = messages)


if __name__ == '__main__':
    app.run()