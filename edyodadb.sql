--
-- File generated with SQLiteStudio v3.2.1 on Mon Jan 6 01:44:03 2020
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: CareRequest
CREATE TABLE CareRequest (Careid INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, Eid integer NOT NULL ON CONFLICT FAIL, Yid integer NOT NULL, Status varchar (20) NOT NULL, FOREIGN KEY (Eid) REFERENCES Elders (id), FOREIGN KEY (Yid) REFERENCES Young (id));
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (1, 1, 1, 'Accepted');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (2, 2, 1, 'Accepted');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (3, 3, 1, 'Accepted');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (4, 4, 1, 'Accepted');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (5, 5, 1, 'Declined');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (6, 2, 2, 'Declined');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (7, 3, 2, 'Declined');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (8, 4, 2, 'Declined');
INSERT INTO CareRequest (Careid, Eid, Yid, Status) VALUES (9, 5, 2, 'Accepted');

-- Table: ElderReview
CREATE TABLE ElderReview (Rid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, Eid INTEGER NOT NULL, Rating INTEGER CHECK (Rating >= 0 and Rating <= 5) DEFAULT (5), Review TEXT, ReviewedBy INTEGER NOT NULL, FOREIGN KEY (Eid) REFERENCES Elders (id), FOREIGN KEY (ReviewedBy) REFERENCES Young (id));
INSERT INTO ElderReview (Rid, Eid, Rating, Review, ReviewedBy) VALUES (1, 1, 5, 'Very helpful and great humor', 1);
INSERT INTO ElderReview (Rid, Eid, Rating, Review, ReviewedBy) VALUES (2, 2, 4, 'cool fellow', 1);
INSERT INTO ElderReview (Rid, Eid, Rating, Review, ReviewedBy) VALUES (3, 3, 5, 'amazing', 1);
INSERT INTO ElderReview (Rid, Eid, Rating, Review, ReviewedBy) VALUES (4, 4, 4, 'funny', 1);

-- Table: Elders
CREATE TABLE Elders (id integer PRIMARY KEY AUTOINCREMENT UNIQUE, Name varchar (50), Age integer, Funds integer DEFAULT 0, Contact varchar (50), Previous varchar (50) DEFAULT NULL, Rating integer DEFAULT NULL, Uname varchar (50) UNIQUE, pwd Text, Available varchar (3) DEFAULT "NO");
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (1, 'Aditya', 66, 0, '9340096618', '1', 5, 'aditya', 'aditya', 'NO');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (2, 'Ayush', 80, 6000, '100000', '1', 4, 'ayush', 'ayush', 'No');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (3, 'Draco', 70, 8900, '200000', '1', 5, 'draco', 'draco', 'No');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (4, 'Sai', 50, 5600, '300000', '1', 4, 'sai', 'sai', 'No');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (5, 'Meet', 60, 7000, '400000', '2', NULL, 'meet', 'meet', 'No');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (6, 'Vidhu', 96, 0, '500000', NULL, NULL, 'vidhu', 'vidhu', 'NO');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (7, 'Prakhar', 86, 0, '600000', NULL, NULL, 'prakhar', 'prakhar', 'NO');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (8, 'Gullu', 76, 0, '700000', NULL, NULL, 'gullu', 'gullu', 'NO');
INSERT INTO Elders (id, Name, Age, Funds, Contact, Previous, Rating, Uname, pwd, Available) VALUES (9, 'Trippy', 66, 0, '800000', NULL, NULL, 'trippy', 'trippy', 'NO');

-- Table: Young
CREATE TABLE Young (id integer PRIMARY KEY AUTOINCREMENT UNIQUE, Name varchar (50), Age integer, Contact varchar (50), ElderCount Integer, PreviousElder integer DEFAULT NULL, Rating integer DEFAULT NULL, Uname varchar (50) UNIQUE, pwd Text, FOREIGN KEY (PreviousElder) REFERENCES Elders (id));
INSERT INTO Young (id, Name, Age, Contact, ElderCount, PreviousElder, Rating, Uname, pwd) VALUES (1, 'bruce', 20, '9597562801', 4, 3, 3, 'bruce', 'bruce');
INSERT INTO Young (id, Name, Age, Contact, ElderCount, PreviousElder, Rating, Uname, pwd) VALUES (2, 'tony', 28, '918271', 1, 5, NULL, 'tony', 'tony');

-- Table: YoungReview
CREATE TABLE YoungReview (Rid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, Yid INTEGER NOT NULL, ReviewedBy INTEGER NOT NULL, Rating INTEGER CHECK (Rating >= 0 and Rating <= 5), Review TEXT, FOREIGN KEY (Rid) REFERENCES Young (id), FOREIGN KEY (ReviewedBy) REFERENCES Elders (id));
INSERT INTO YoungReview (Rid, Yid, ReviewedBy, Rating, Review) VALUES (1, 1, 1, 4, 'He is a great guy just need to give us more time');
INSERT INTO YoungReview (Rid, Yid, ReviewedBy, Rating, Review) VALUES (3, 1, 2, 2, 'not good');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
