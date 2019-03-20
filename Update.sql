--Dalton James Redman
--Project 2

--Turns on Spooling and echoing
spool Project2_djr.txt
set echo on

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

COMMIT;

--Turns off Spooling and echoing
spool off
set echo off