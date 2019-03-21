--Dalton James Redman
--Project 2

--Turns on Spooling and echoing
spool Project2_djr.txt
set echo on

CREATE TABLE Rating_djr(
	RatingID	char(6)		NOT NULL	PRIMARY KEY,
	RatingDesc	varchar(36)
);

CREATE TABLE Genre_djr(
	GenreID		char(2)		NOT NULL	PRIMARY KEY,
	GenreDesc	varchar(36)
);

CREATE TABLE Customer_djr(
	CustID		number(4) 	NOT NULL	PRIMARY KEY,
	CustFName	char(16),
	CustLName	char(16),
	CustPhone	char(10)
);

CREATE TABLE Clerk_djr(
	ClerkID		number(4) 	NOT NULL	PRIMARY KEY,
	ClerkFName	char(16),
	ClerkLName	char(16)
);

CREATE TABLE Fee_djr(
	FeeCode		char(1) 	NOT NULL 	PRIMARY KEY,
	FeeAmt		number(3,2)
);

CREATE TABLE Format_djr(
	FormatCode	char(1)     NOT NULL	PRIMARY KEY,
	FormatDesc	char(20)
);

CREATE TABLE Rental_djr(
	RentailID 	number(4)	NOT NULL	 PRIMARY KEY,
	RentailDate date,
	CustID		number(4)	NOT NULL,
	ClerkID		number(4)	NOT NULL,
	CONSTRAINT con_Cust FOREIGN KEY (CustID) REFERENCES Customer_djr(CustID),
	CONSTRAINT con_Clerk FOREIGN KEY (ClerkID) REFERENCES Clerk_djr(ClerkID)
);

CREATE TABLE Title_djr(
	TitleID		number(4)	NOT NULL	 PRIMARY KEY,
	Title		varchar(36),
	RatingID	char(6)		NOT NULL,
	GenreID		char(2)		NOT NULL,
	CONSTRAINT con_Rating FOREIGN KEY (RatingID) REFERENCES Rating_djr(RatingID),
	CONSTRAINT con_Genre FOREIGN KEY (GenreID) REFERENCES Genre_djr(GenreID)
);

CREATE TABLE Disk_djr(
	DiskID		number(4)	NOT NULL	PRIMARY KEY,
	TitleID		number(4)	NOT NULL,
	FormatCode	char(1)		NOT NULL,
	CONSTRAINT con_Format FOREIGN KEY (FormatCode) REFERENCES Format_djr(FormatCode),
	CONSTRAINT con_Title FOREIGN KEY (TitleID) REFERENCES Title_djr(TitleID)
);

CREATE TABLE RentalDetail_djr(
	RentailID 	number(4) 	NOT NULL,
	DiskID		number(4) 	NOT NULL,
	FeeCode		char(1) 	NOT NULL,
	PRIMARY KEY (RentailID, DiskID),
	CONSTRAINT con_Fee FOREIGN KEY (FeeCode) REFERENCES Fee_djr(FeeCode),
	CONSTRAINT con_Disk FOREIGN KEY (DiskID) REFERENCES Disk_djr(DiskID),
	CONSTRAINT con_Rental FOREIGN KEY (RentailID) REFERENCES Rental_djr(RentailID)
);

/* Insert command for Rating table*/
INSERT INTO Rating_djr(RatingID,RatingDesc)	VALUES ('R','Restricted Under 17');
INSERT INTO Rating_djr(RatingID,RatingDesc)	VALUES ('PG-13','Inappropriate Under 13');
INSERT INTO Rating_djr(RatingID,RatingDesc)	VALUES ('PG','Parental Guidance');
		
/*Inserts data into Genre_djr table */
INSERT INTO Genre_djr(GenreID,GenreDesc) VALUES	('AC','Action');
INSERT INTO Genre_djr(GenreID,GenreDesc) VALUES	('HR','Horror');
INSERT INTO Genre_djr(GenreID,GenreDesc) VALUES	('CL','Classics');
INSERT INTO Genre_djr(GenreID,GenreDesc) VALUES	('FM','Family');
		
/*Inserts data into Customer_djr table */
INSERT INTO Customer_djr(CustID,CustFName,CustLName,CustPhone) VALUES (23,'Jean','Mackey','9725551143');
INSERT INTO Customer_djr(CustID,CustFName,CustLName,CustPhone) VALUES (102,'Jack','Hughes','2145552014');
INSERT INTO Customer_djr(CustID,CustFName,CustLName,CustPhone) VALUES (154,'Alicia','Moore','8175551919');
INSERT INTO Customer_djr(CustID,CustFName,CustLName,CustPhone) VALUES (83,'Carrie','Brown',null);
INSERT INTO Customer_djr(CustID,CustFName,CustLName,CustPhone) VALUES (53,'Ashleigh','Hayes','9725550628');
INSERT INTO Customer_djr(CustID,CustFName,CustLName,CustPhone) VALUES (68,'Anthony','Smith',null);
INSERT INTO Customer_djr(CustID,CustFName,CustLName,CustPhone) VALUES (72,'Shane','Wesley','8175550112');

/*Inserts data into Clerk_djr table */	
INSERT INTO Clerk_djr(ClerkID,ClerkFName, ClerkLName) VALUES (15,'Mary','Jones');
INSERT INTO Clerk_djr(ClerkID,ClerkFName, ClerkLName) VALUES (21,'Mark','White');
INSERT INTO Clerk_djr(ClerkID,ClerkFName, ClerkLName) VALUES (30,'Renee','Smith');
INSERT INTO Clerk_djr(ClerkID,ClerkFName, ClerkLName) VALUES (12,'Tim','Shore');
INSERT INTO Clerk_djr(ClerkID,ClerkFName, ClerkLName) VALUES (42,'Nicole','Walker');

/*Inserts data into Clerk_djr table */			
INSERT INTO Fee_djr(FeeCode,FeeAmt)	VALUES ('A',3.00);
INSERT INTO Fee_djr(FeeCode,FeeAmt)	VALUES ('B',2.00);

/*Inserts data into Format_djr table */		
INSERT INTO Format_djr(FormatCode,FormatDesc) VALUES ('D','DVD');
INSERT INTO Format_djr(FormatCode,FormatDesc) VALUES ('B','BLU-RAY');

/*Inserts data into Rental_djr table */		
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(1, '02-sep-2017', 23, 15);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(2, '02-sep-2017', 102, 15);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(3, '02-sep-2017', 154, 21);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(4, '03-sep-2017', 83, 30);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(5, '03-sep-2017', 23, 15);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(6, '04-sep-2017', 83, 12);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(7, '04-sep-2017', 154, 15);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(8, '05-sep-2017', 53, 12);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(9, '05-sep-2017', 68, 15);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(10, '05-sep-2017', 23, 21);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(11, '05-sep-2017', 72, 42);

/*Inserts data into Title_djr table */
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (92, 'Hacksaw Ridge', 'R', 'AC');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (76, 'Avengers: Infinity War', 'PG-13','AC');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (119, 'Insurgent', 'PG-13', 'AC');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (12, 'Casa Blanca', 'PG', 'CL');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (29, 'Despicable Me 2', 'PG', 'FM');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (42, 'Frozen', 'PG', 'FM');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (58, 'The Specialist', 'R', 'AC');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (230, 'Lone Survivor', 'R', 'AC');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (245, 'Moana', 'PG', 'FM');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (159, 'Boss Baby', 'PG', 'FM');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (240, 'It', 'R', 'HR');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (218, 'Gone With The Wind', 'PG', 'CL');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (296, 'The Hurt Locker', 'R', 'AC');
INSERT INTO Title_djr(TitleID,Title,RatingID,GenreID) VALUES (35, 'Minions', 'PG', 'FM');

/*Inserts data into Disk_djr table */		
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (215, 92, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (191, 76, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (259, 119, 'B');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (89, 12, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (96, 29, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (152, 42, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (86, 58, 'B');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (260, 119, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (301, 230, 'B');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (376, 245, 'B');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (153, 42, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (202, 159, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (402, 240, 'B');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (381, 218, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (216, 92, 'B');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (203, 159, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (97, 29, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (421, 296, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (299, 35, 'D');

/*RentalDetail_djr insert base data */		
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(1, 215, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(1, 191, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(2, 259, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(3, 89, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(3, 96, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(3, 152, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(4, 86, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(5, 260, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(6, 301, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(7, 376, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(7, 153, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(8, 202, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(8, 402, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(9, 381, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(9, 216, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(10, 203, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(10, 97, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(11, 376, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(11, 421, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(11, 299, 'A');

COMMIT;

--Prints

SELECT * FROM RentalDetail_djr;
SELECT * FROM Title_djr;
SELECT * FROM Disk_djr;
SELECT * FROM Rental_djr;
SELECT * FROM Format_djr;
SELECT * FROM Fee_djr;
SELECT * FROM Genre_djr;
SELECT * FROM Customer_djr;
SELECT * FROM Clerk_djr;
SELECT * FROM Rating_djr;

--Updates

/* Updates customer 83 */
UPDATE Customer_djr
SET CustFName = 'Kerry'
WHERE CustID = 83;

/* Updates customer 23 */
UPDATE Customer_djr
SET CustPhone = '2146881234'
WHERE CustID = 23;

/* Adds customer 100 */
INSERT INTO Customer_djr(CustID, CustFName, CustLName, CustPhone) VALUES (100, 'Amanda', 'Green', null);

/* needed to make the foriegn key work for Title */
INSERT INTO Genre_djr(GenreID,GenreDesc) VALUES ('DR', 'Drama');

/*Inserts new title*/
INSERT INTO Title_djr(TitleID, Title, RatingID, GenreID) VALUES (279, 'Hidalgo', 'PG-13', 'DR');

/* add 3 new disks */
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (327, 92, 'D');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (382, 119, 'B');
INSERT INTO Disk_djr(DiskID,TitleID,FormatCode)	VALUES (406, 29, 'D');

/* add new rentals */
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(12, '06-sep-2017', 53, 15);
INSERT INTO Rental_djr(RentailID,RentailDate,CustID,ClerkID) VALUES	(13, '07-sep-2017', 100, 12);

/* Change the Fee Code of TitleID 92 to ‘B’ for RentalID 1 */ 
UPDATE RentalDetail_djr
SET FeeCode = 'B'
WHERE DiskID = 215 AND RentailID = 1;

/* Inserts the information for RentalDetail 12 */
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(12, 376, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(12, 406, 'B');

/* Inserts the information for RentalDetail 13 */
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(13, 382, 'A');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(13, 215, 'B');
INSERT INTO RentalDetail_djr(RentailID, DiskID, FeeCode) VALUES	(13, 327, 'A');

/* Inserts into Rating Table information */
INSERT INTO Rating_djr(RatingID, RatingDesc) VALUES ('NR', 'Not Rated');

--Saves data
COMMIT;

--Prints updated data

SELECT * FROM RentalDetail_djr;
SELECT * FROM Title_djr;
SELECT * FROM Disk_djr;
SELECT * FROM Rental_djr;
SELECT * FROM Format_djr;
SELECT * FROM Fee_djr;
SELECT * FROM Genre_djr;
SELECT * FROM Customer_djr;
SELECT * FROM Clerk_djr;
SELECT * FROM Rating_djr;

--Turns off Spooling and echoing
spool off
set echo off