DROP DATABASE "IPL";
CREATE DATABASE "IPL";

\c IPL

CREATE TABLE OWNERS(
    OwnerID bigint NOT NULL,
    OName varchar(50) NOT NULL,
    OPurse numeric NOT NULL,
    OUser varchar(25) NOT NULL UNIQUE,
    OPass varchar(20) NOT NULL,
    PRIMARY KEY (OwnerID)
);

CREATE TABLE UMPIRE(
    UmpireID bigint NOT NULL,
    UName varchar(50) NOT NULL,
    PRIMARY KEY (UmpireID)
);

CREATE TABLE TEAM(
    TeamID bigint NOT NULL,
    OwnerID bigint NOT NULL,
    TName varchar(50) NOT NULL,
    TCap bigint,
    TWK bigint,
    PRIMARY KEY (TeamID),
    FOREIGN KEY (OwnerID) REFERENCES OWNERS(OwnerID)
);
	
CREATE TABLE SUPPORT_STAFF(
    StaffID bigint NOT NULL,
    TeamID bigint NOT NULL,
    SName varchar(50) NOT NULL,
    SRole varchar(50) CHECK (SRole IN ('Manager','Physiotherapist','Analyst')),
    PRIMARY KEY (StaffID),
    FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);

CREATE TABLE COACH(
    CoachID bigint NOT NULL,
    TeamID bigint NOT NULL,
    CName varchar(50) NOT NULL,
    CType varchar(50) CHECK (CType IN ('Head','Batting','Bowling','Fielding')),
    PRIMARY KEY (CoachID),
    FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);

CREATE TABLE PLAYER(
    PlayerID bigint NOT NULL,
    TeamID bigint,
    PName varchar(50) NOT NULL,
    P_Age int NOT NULL,
    PRole varchar(50) NOT NULL CHECK (PRole IN ('Batsman','Bowler','All Rounder')),
    PCost numeric NOT NULL DEFAULT 20,
    PSold boolean NOT NULL DEFAULT FALSE,
    PRIMARY KEY (PlayerID),
    FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);

CREATE TABLE Bids(
    OwnerID bigint NOT NULL,
    PlayerID bigint NOT NULL,
    Bid_Placed numeric,
    FOREIGN KEY (OwnerID) REFERENCES OWNERS(OwnerID),
    FOREIGN KEY (PlayerID) REFERENCES PLAYER(PlayerID)
);

CREATE TABLE VENUE(
    VenueID bigint NOT NULL,
    VName varchar(50) NOT NULL,
    PRIMARY KEY (VenueID)
);

CREATE TABLE MATCH(
    MatchID serial NOT NULL,
    VenueID bigint NOT NULL,
    MDate date NOT NULL UNIQUE,
    MRevenue numeric NOT NULL,
    Won_By varchar(50),
    PRIMARY KEY (MatchID),
    FOREIGN KEY (VenueID) REFERENCES VENUE(VenueID)
);

CREATE TABLE Umpires(
    UmpireID bigint NOT NULL,
    MatchID bigint NOT NULL,
    PRIMARY KEY (UmpireID, MatchID),
    FOREIGN KEY (UmpireID) REFERENCES UMPIRE(UmpireID),
    FOREIGN KEY (MatchID) REFERENCES MATCH(MatchID)
);

CREATE TABLE Plays(
    TeamID bigint NOT NULL,
    MatchID bigint NOT NULL,
    PRIMARY KEY (TeamID, MatchID),
    FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID),
    FOREIGN KEY (MatchID) REFERENCES MATCH(MatchID)
);

CREATE TABLE Individual_Score(
    PlayerID bigint NOT NULL,
    MatchID bigint NOT NULL,
    Runs bigint,
    Wickets bigint,
    Balls_Played bigint,
    Balls_Bowled bigint,
    PRIMARY KEY (PlayerID, MatchID),
    FOREIGN KEY (PlayerID) REFERENCES PLAYER(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES MATCH(MatchID)
);

ALTER TABLE TEAM ADD CONSTRAINT team_tcap_fkey FOREIGN KEY (TCap) REFERENCES PLAYER(PlayerID);
ALTER TABLE TEAM ADD CONSTRAINT team_twk_fkey FOREIGN KEY (TWK) REFERENCES PLAYER(PlayerID);

