\c IPL

/* Owner Table Values */
INSERT INTO OWNERS
VALUES(1, 'Preity Zinta', 7500, 'pzinta', 'pk1234'),
      (2, 'Parth Jindal', 4500, 'pjindal', 'dc1234'),
      (3, 'Manoj Badale', 5000, 'mbadale', 'rr1234'),
      (4, 'Vijay Mallya', 9999, 'vmallya', 'rcb1234'),
      (5, 'Shah Rukh Khan', 8500, 'srk', 'kkr1234'),
      (6, 'Kalanithi Maran', 8000, 'kmaran', 'srh1234'),
      (7, 'N Srinivasan', 8250, 'nsrini', 'csk1234'),
      (8, 'Mukesh Ambani', 10000, 'mambani', 'mi1234'),
      (9, 'Stats Manager', 0, 'smanager', 'smanager'),
      (10, 'Auction Manager', 0, 'amanager', 'amanager');

/* Umpire Table Values */
INSERT INTO UMPIRE
VALUES(1, 'Sundaram Ravi'),
      (2, 'Anil Chaudhary'),
      (3, 'Kumar Dharmasena'),
      (4, 'Chettithody Shamshuddin'),
      (5, 'Nitin Menon'),
      (6, 'Marais Erasmus'),
      (7, 'C. K. Nandan'),
      (8, 'Chris Gaffaney'),
      (9, 'Simon Taufel'),
      (10, 'Vineet Kulkarni');

/* Team Table Values */
INSERT INTO TEAM
VALUES(1, 7, 'Chennai Super Kings', NULL, NULL),
      (2, 2, 'Delhi Capitals', NULL, NULL),
      (3, 5, 'Kolkata Knight Riders', NULL, NULL),
      (4, 8, 'Mumbai Indians', NULL, NULL),
      (5, 1, 'Punjab Kings', NULL, NULL),
      (6, 3, 'Rajasthan Royals', NULL, NULL),
      (7, 5, 'Royal Challengers Bangalore', NULL, NULL),
      (8, 6, 'Sunrisers Hyderabad', NULL, NULL);

/* Support Staff Table Values */
INSERT INTO SUPPORT_STAFF
VALUES(1, 1, 'Tommy Simsek', 'Physiotherapist'),
      (2, 1, 'R Russell', 'Manager'),
      (3, 1, 'Lakshmi Narayan', 'Analyst'),
      (4, 2, 'Patrick Farhart', 'Physiotherapist'),
      (5, 2, 'Soumyadeep Pyne', 'Manager'),
      (6, 2, 'Sriram Somayajula', 'Analyst'),
      (7, 3, 'Kamlesh Jain', 'Physiotherapist'),
      (8, 3, 'Wayne Bentley', 'Manager'),
      (9, 3, 'AR Srikkanth', 'Analyst'),
      (10, 4, 'Nitin Patel', 'Physiotherapist'),
      (11, 4, 'Zaheer Khan', 'Manager'),
      (12, 4, 'L Varun', 'Analyst'),
      (13, 5, 'Andrew Leipus', 'Physiotherapist'),
      (14, 5, 'Avinash Vaidya', 'Manager'),
      (15, 5, 'Andy Flower', 'Analyst'),
      (16, 6, 'John Gloster', 'Physiotherapist'),
      (17, 6, 'Romi Bhinder', 'Manager'),
      (18, 6, 'Panish Shetty', 'Analyst'),
      (19, 7, 'Evan Speechly', 'Physiotherapist'),
      (20, 7, 'Soumyadeep Pyne', 'Manager'),
      (21, 7, 'Prassana', 'Analyst'),
      (22, 8, 'Theo Kapakoulakis', 'Physiotherapist'),
      (23, 8, 'Srinath Bhashyam', 'Manager'),
      (24, 8, 'Shrinivas Chandrasekaran', 'Analyst');

/* Coach Table Values */
INSERT INTO COACH
VALUES(1, 1, 'Simon Katich', 'Head'),
      (3, 1, 'Adam Griffith', 'Bowling'),
      (2, 1, 'Sridharan Sriram', 'Batting'),
      (4, 1, 'Trent Woodhill', 'Fielding'),
      (5, 2, 'Ricky Ponting', 'Head'),
      (6, 2, 'Mohammad Kaif', 'Batting'),
      (7, 2, 'Samuel Badree', 'Bowling'),
      (8, 2, 'Mohammad Kaif', 'Fielding'),
      (9, 3, 'Brendon McCullum', 'Head'),
      (10, 3, 'Brendon McCullum', 'Batting'),
      (11, 3, 'Kyle Mills', 'Bowling'),
      (12, 3, 'James Foster', 'Fielding'),
      (13, 4, 'Mahela Jayawardene', 'Head'),
      (14, 4, 'Robin Singh', 'Batting'),
      (15, 4, 'Shane Bond', 'Bowling'),
      (16, 4, 'James Pamment', 'Fielding'),
      (17, 5, 'Anil Kumble', 'Head'),
      (18, 5, 'Wasim Jaffer', 'Batting'),
      (19, 5, 'Damien Wright', 'Bowling'),
      (20, 5, 'Jonty Rhodes', 'Fielding'),
      (21, 6, 'Andrew McDonald', 'Head'),
      (22, 6, 'Amol Muzumdar', 'Batting'),
      (23, 6, 'Sairaj Bahutule', 'Bowling'),
      (24, 6, 'Dishant Yagnik', 'Fielding'),
      (25, 7, 'Stephen Fleming', 'Head'),
      (26, 7, 'Mike Hussey', 'Batting'),
      (27, 7, 'Lakshmipathy Balaji', 'Bowling'),
      (28, 7, 'Rajiv Kumar', 'Fielding'),
      (29, 8, 'Trevor Bayliss', 'Head'),
      (30, 8, 'VVS Laxman', 'Batting'),
      (31, 8, 'Muttiah Muralitharan', 'Bowling'),
      (32, 8, 'Biju George', 'Fielding');

/* Player Table Values */
INSERT INTO PLAYER
VALUES(1, 1, 'MS Dhoni', 40, 'Batsman', 2500, TRUE),
      (2, 1, 'Ruturaj Gaikwad', 24, 'Batsman', 50, TRUE),
      (3, 1, 'Faf du Plessis', 37, 'Batsman', 700, TRUE),
      (4, 1, 'Ravindra Jadeja', 32, 'All Rounder', 1200, TRUE),
      (5, 1, 'Shardul Thakur', 29, 'Bowler', 700, TRUE),
      (6, NULL, 'Ambati Rayudu', 36, 'Batsman', 500, FALSE),
      (7, NULL, 'Moeen Ali', 33, 'All Rounder', 800, FALSE),
      (8, 2, 'Rishabh Pant', 24, 'Batsman', 1000, TRUE),
      (9, 2, 'Kagiso Rabada', 26, 'Bowler', 700, TRUE),
      (10, 2, 'Marcus Stoinis', 32, 'All Rounder', 650, TRUE),
      (11, 2, 'Shreyas Iyer', 26, 'Batsman', 750, TRUE),
      (12, 2, 'Steve Smith', 32, 'Batsman', 950, TRUE),
      (13, NULL, 'Ravichandran Ashwin', 35, 'All Rounder', 500, FALSE),
      (14, NULL, 'Shikhar Dhawan', 35, 'Batsman', 550, FALSE),
      (15, 3, 'Eoin Morgan', 35, 'Batsman', 850, TRUE),
      (16, 3, 'Sunil Narine', 33, 'All Rounder', 200, TRUE),
      (17, 3, 'Dinesh Karthik', 32, 'Batsman', 700, TRUE),
      (18, 3, 'Venkatesh Iyer', 27, 'Batsman', 100, TRUE),
      (19, 3, 'Pat Cummins', 28, 'Bowler', 1000, TRUE),
      (20, NULL, 'Andre Russell', 36, 'All Rounder', 800, FALSE),
      (21, NULL, 'Lockie Ferguson', 30, 'Bowler', 500, FALSE),
      (22, 4, 'Rohit Sharma', 34, 'Batsman', 2000, TRUE),
      (23, 4, 'Quinton de Kock', 27, 'Batsman', 1200, TRUE),
      (24, 4, 'Trent Boult', 30, 'Bowler', 1700, TRUE),
      (25, 4, 'Kieron Pollard', 38, 'All Rounder', 800, TRUE),
      (26, 4, 'Suryakumar Yadav', 26, 'Batsman', 600, TRUE),
      (27, NULL, 'Arjun Tendulkar', 22, 'All Rounder', 30, FALSE),
      (28, NULL, 'Chris Lynn', 34, 'Batsman', 1000, FALSE),
      (29, 5, 'KL Rahul', 29 , 'Batsman', 1500, TRUE),
      (30, 5, 'Arshdeep Singh', 25, 'Bowler', 100, TRUE),
      (31, 5, 'Chris Gayle', 42, 'Batsman', 1600, TRUE),
      (32, 5, 'Mohammad Shami', 35, 'Bowler', 1000, TRUE),
      (33, 5, 'Mayank Agarwal', 26, 'Batsman', 500, TRUE),
      (34, NULL, 'Shahrukh Khan', 30, 'Batsman', 80, FALSE),
      (35, NULL, 'Chris Jordon', 33, 'Bowler', 300, FALSE),
      (36, 6, 'Sanju Samson', 27 , 'Batsman', 1300, TRUE),
      (37, 6, 'Chris Morris', 29 , 'All Rounder', 1500, TRUE),
      (38, 6, 'Rahul Tewatia', 23 , 'Bowler', 100, TRUE),
      (39, 6, 'Yashasvi Jaiswal', 26 , 'Batsman', 100, TRUE),
      (40, 6, 'Chetan Sakaria', 30 , 'Bowler', 80, TRUE),
      (41, NULL, 'Jos Buttler', 32 , 'Batsman', 1200, FALSE),
      (42, NULL, 'Shivam Dube', 35 , 'Batsman', 200, FALSE),
      (43, 7, 'Virat Kohli', 32, 'Batsman', 2200, TRUE),
      (44, 7, 'Glenn Maxwell', 32, 'All Rounder', 1500, TRUE),
      (45, 7, 'AB de Villiers', 37, 'Batsman', 1800, TRUE),
      (46, 7, 'Mohammed Siraj', 27, 'Bowler', 100, TRUE),
      (47, 7, 'Yuzvendra Chahal', 31, 'Bowler', 800, TRUE),
      (48, NULL, 'Daniel Christian', 38, 'All Rounder', 300, FALSE),
      (49, NULL, 'Shahbaz Ahmed', 26, 'All Rounder', 50, FALSE),
      (50, 8, 'Kane Williomson', 32 , 'Batsman', 1900, TRUE),
      (51, 8, 'Rashid Khan', 21 , 'Bowler', 1200, TRUE),
      (52, 8, 'David Warner', 35 , 'Batsman', 1600, TRUE),
      (53, 8, 'Bhuvneshwar Kumar', 27 , 'Bowler', 1200, TRUE),
      (54, 8, 'Johnny Bairstow', 28 , 'Batsman', 1000, TRUE),
      (55, NULL, 'Khaleel Ahmed', 34 , 'Bowler', 200, FALSE),
      (56, NULL, 'Kedar Jadhav', 28 , 'Batsman', 500, FALSE);

/* Update Captains */
UPDATE TEAM
SET TCap = 1
WHERE TeamID = 1;
UPDATE TEAM
SET TCap = 8
WHERE TeamID = 2;
UPDATE TEAM
SET TCap = 15
WHERE TeamID = 3;
UPDATE TEAM
SET TCap = 22
WHERE TeamID = 4;
UPDATE TEAM
SET TCap = 29
WHERE TeamID = 5;
UPDATE TEAM
SET TCap = 36
WHERE TeamID = 6;
UPDATE TEAM
SET TCap = 43
WHERE TeamID = 7;
UPDATE TEAM
SET TCap = 50
WHERE TeamID = 8;

/* Update Wicket Keepers */
UPDATE TEAM
SET TWK = 1
WHERE TeamID = 1;
UPDATE TEAM
SET TWK = 8
WHERE TeamID = 2;
UPDATE TEAM
SET TWK = 17
WHERE TeamID = 3;
UPDATE TEAM
SET TWK = 23
WHERE TeamID = 4;
UPDATE TEAM
SET TWK = 29
WHERE TeamID = 5;
UPDATE TEAM
SET TWK = 36
WHERE TeamID = 6;
UPDATE TEAM
SET TWK = 45
WHERE TeamID = 7;
UPDATE TEAM
SET TWK = 54
WHERE TeamID = 8;

/* Venue Table Values */
INSERT INTO VENUE
VALUES(1, 'Narendra Modi Stadium'),
      (2, 'M.Chinnaswamy Stadium'),
      (3, 'Arun Jaitley Stadium'),
      (4, 'Rajiv Gandhi Int. Stadium'),
      (5, 'Holkar Stadium'),
      (6, 'Sawai Mansingh Stadium'),
      (7, 'Eden Gardens'),
      (8, 'IS Bindra Stadium'),
      (9, 'Wankhede Stadium'),
      (10, 'Maharashtra CA Int. Stadium'),
      (11, 'M.A.Chidambaram Stadium');

/* Match Table Values */
INSERT INTO MATCH (VenueID, MDate, MRevenue, Won_By)
VALUES(3, '2021-04-21', 1550, 'Chennai Super Kings'),
      (9, '2021-04-22', 1400, 'Mumbai Indians'),
      (1, '2021-04-23', 1400, 'Rajasthan Royals'),
      (4, '2021-04-24', 1550, 'Royal Challengers Bangalore'),
      (2, '2021-04-25', 1600, 'Royal Challengers Bangalore');


INSERT INTO Umpires
VALUES(1, 1),(3, 2),(5, 3),(7, 4),(9, 5);

/* Match Table Values */
INSERT INTO Plays
VALUES(1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(1,5),(7,5);

INSERT INTO Individual_Score
VALUES(1, 1, 52, 0, 40, 0),/*csk*/
      (2, 1, 24, 0, 20, 0),
      (3, 1, 34, 0, 20, 0),
      (4, 1, 45, 1, 18, 18),
      (5, 1, 5, 2, 3, 24),
      (8, 1, 55, 0, 38, 0),/*dc*/
      (9, 1, 0, 3, 0, 24),
      (10, 1, 25, 1, 20, 18),
      (11, 1, 36, 0, 18, 0),
      (12, 1, 10, 0, 9, 0),

      (15, 2, 15, 0, 15, 0),/*kkr*/
      (16, 2, 26, 1, 10, 24),
      (17, 2, 56, 0, 45, 0),
      (18, 2, 21, 0, 20, 0),
      (19, 2, 0, 4, 0, 24),
      (22, 2, 60, 0, 52, 0),/*mi*/
      (23, 2, 35, 0, 30, 0),
      (24, 2, 0, 2, 0, 24),
      (25, 2, 50, 1, 35, 12),
      (26, 2, 35, 0, 26, 0),

      (29, 3, 45, 0, 39, 0),/*pk*/
      (30, 3, 0, 2, 0, 24),
      (31, 3, 56, 0, 36, 0),
      (32, 3, 0, 2, 0, 24),
      (33, 3, 22, 0, 18, 0),
      (36, 3, 85, 0, 44, 0),/*rr*/
      (37, 3, 25, 1, 18, 24),
      (38, 3, 0, 2, 0, 24),
      (39, 3, 35, 0, 22, 0),
      (40, 3, 0, 1, 0, 18),

      (43, 4, 66, 0, 44, 0),/*rcb*/
      (44, 4, 51, 1, 25, 30),
      (45, 4, 56, 0, 35, 0),
      (46, 4, 2, 2, 3, 24),
      (47, 4, 0, 3, 0, 24),
      (50, 4, 51, 0, 39, 0),/*sh*/
      (51, 4, 5, 4, 2, 24),
      (52, 4, 35, 0, 30, 0),
      (53, 4, 1, 1, 1, 18),
      (54, 4, 10, 0, 10, 0),

      (43, 5, 101, 0, 52, 0),/*rcb*/
      (44, 5, 50, 1, 18, 18),
      (45, 5, 75, 0, 35, 0),
      (46, 5, 5, 1, 3, 24),
      (47, 5, 1, 2, 1, 24),
      (1, 5, 32, 0, 20, 0),/*csk*/
      (2, 5, 44, 0, 36, 0),
      (3, 5, 11, 0, 12, 0),
      (4, 5, 51, 0, 42, 0),
      (6, 5, 0, 3, 0, 36);