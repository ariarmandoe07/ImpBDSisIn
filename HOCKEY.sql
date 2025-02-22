CREATE TABLE playoffround (
    
    id int (5) NOT NULL,
    team1Id int (5) NOT NULL,
    team2Id int (6) NOT NULL,
    startTime datetime NOT NULL,
    endTime date NOT NULL,
    roundNum int (8) NOT NULL,
    PRIMARY KEY (id, startTime)
);

CREATE TABLE hockeygame (
    id int (8) NOT NULL,
    roundld int (8) NOT NULL,
    startTime datetime NOT NULL,
    description text,
    team1Id int (8) NOT NULL,
    team2Id int (8) NOT NULL,
    PRIMARY KEY (id, startTime)
);

CREATE TABLE gamescores (
    id int (6) NOT NULL,
    team1Id int (10) NOT NULL,
    team2Id int (10) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE hockeyteam (
    id int (9) NOT NULL,
    name varchar (10) NOT NULL,
    logo text DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE hockeyteamplayer (
    id int (7) NOT NULL,
    hockeyTeamId int (10) NOT NULL,
    firstName varchar (30) NOT NULL,
    lastName varchar (25) NOT NULL,
    jerseyNum int (10) NOT NULL,
    PRIMARY KEY (id)

);

CREATE TABLE user (
    id int (9) NOT NULL,
    username varchar (30) NOT NULL,
    password varchar (35) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE userinfo (
    id int (5) NOT NULL,
    firstName varchar (20) NOT NULL,
    lastName varchar (25) NOT NULL,
    email varchar (25) NOT NULL,
    round1Points int (4) NOT NULL,
    round2Points int (4) NOT NULL,
    round3Points int (4) NOT NULL,
    round4Points int (4) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE userscorepicks (
    id int (9) NOT NULL,
    hockeyGameId int (9) NOT NULL,
    team1IdScore int (2) NOT NULL,
    team2IdScore int (2) NOT NULL,
    userId int (16) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE userstatspicks (
    id int (16) NOT NULL,
    round1 int (16) NOT NULL,
    goalLeaderId varchar (16) NOT NULL,
    assistLeaderId varchar (16) NOT NULL,
    penaltyLeaderId varchar (16) NOT NULL,
    plusMinusId int (16) NOT NULL,
    faceOffsWonLeaderId int (2) NOT NULL,
    sogLeaderId int (2) NOT NULL,
    numShutouts int (2) NOT NULL,
    userId int (16) NOT NULL,
    PRIMARY KEY (id)

);

CREATE TABLE roundstats (
    id int (16) NOT NULL,
    numShutouts int (10) NOT NULL,
    goalLeaderId varchar (56) NOT NULL,
    assistLeaderId varchar (56) NOT NULL,
    penaltyLeaderId varchar(46) NOT NULL,
    plusMinusId int (16) NOT NULL,
    faceOffsWonLeaderId int (2) NOT NULL,
    sogLeaderId int (2) NOT NULL,
    PRIMARY KEY (id)
);
