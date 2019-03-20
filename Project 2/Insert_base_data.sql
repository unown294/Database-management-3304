--Dalton James Redman
--Project 2

--Turns on Spooling and echoing
spool Project2_djr.txt
set echo on

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

--Turns off Spooling and echoing
spool Project2_djr.txt
set echo off