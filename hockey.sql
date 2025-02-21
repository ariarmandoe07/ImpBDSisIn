CREATE TABLE playoffround (
    
    id int (16) NOT NULL,
    team1Id int (13) NOT NULL,
    team2Id int (16) NOT NULL,
    startTime date NOT NULL,
    endTime date NOT NULL,
    roundNum int (16) NOT NULL,
    PRIMARY KEY (id, startTime)
);

CREATE TABLE hockeygame (
    id int (16) NOT NULL,
    roundld int (16) NOT NULL,
    startTime date NOT NULL,
    description text,
    team1Id int (16) NOT NULL,
    team2Id int (16) NOT NULL,
    PRIMARY KEY (id, startTime)
);
