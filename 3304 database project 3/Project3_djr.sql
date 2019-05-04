--Turns on Spooling and echoing
spool Project3_djr.txt
SET WRAP ON
SET echo ON

--change width of printable space horizontally, set the line size
SET LINESIZE 150
COLUMN * FORMAT a15 
COLUMN Genre FORMAT a8
COLUMN FeeCode FORMAT a8
COLUMN GenreDesc FORMAT a10
COLUMN FeeAmt FORMAT a10
COLUMN GenreID FORMAT a7

--Problem 1 Solution
INSERT INTO Fee_djr VALUES ('C',2.50);

--Problem 2 Solution
UPDATE RentalDetail_djr
SET FeeCode = 'A'
WHERE DiskID = 191 AND RentailID = 1;

--Problem 3 Solution
UPDATE RentalDetail_djr
SET FeeCode = 'C'
WHERE DiskID = 421 AND RentailID = 11;

--Problem 4 Solution
UPDATE Rating_djr
SET RatingDesc = 'May Not be Suitable for Children Under 13'
WHERE RatingID = 'PG-13';

--Problem 5 Solution
INSERT INTO Customer_djr VALUES ((SELECT MAX(CustID) FROM Customer_djr)+1,'Mary','Jones', '2145552020');

--Problem 6 Solution
SELECT * FROM Customer_djr
WHERE CustPhone IS null;

--Problem 7 Solution
SELECT TO_CHAR(AVG(FeeAmt), '$9.99') as "AvgFee"
FROM Fee_djr;

--Problem 8 Solution
SELECT COUNT(DISTINCT D.TitleID) as "COUNT(TitleID)"
FROM Disk_djr D, Title_djr T
WHERE D.TitleID = T.TitleID;

--Problem 9
SELECT GenreID as "GenreID", COUNT(Title) as "TitleCount"
FROM Title_djr
GROUP BY GenreID;

--Problem 10 solution
SELECT R.RentailID as "RentalID", RentailDate as "Date", TO_CHAR(SUM(FeeAmt), '$999,999.99') as "RentalTotal"
  FROM RentalDetail_djr RD, Rental_djr R, Fee_djr F
 WHERE R.RentailID = 10 AND
       R.RentailID = RD.RentailID
GROUP BY R.RentailID, RentailDate;

--Problem 11a Solution
SELECT C.CustID as "CustomerID", CustFName || ' ' || CustLName as "CustomerName", COUNT(RentailID)
  FROM Customer_djr C, Rental_djr R
 WHERE C.CustID = R.CustID
GROUP BY C.CustID, CustFName, CustLName
ORDER BY C.CustID;

--Problem 11b solution
SELECT RentailID as "Rental ID", DiskID as "Disk ID", FeeCode as "FeeCode"
FROM RentalDetail_djr
ORDER BY RentailID, DiskID;

--Problem 12 solution
SELECT T.TitleID, Title, COUNT(DISTINCT FormatCode) as "Count(FormatCode)"
FROM Disk_djr D, Title_djr T
WHERE D.TitleID = T.TitleID
GROUP BY T.TitleID, Title
ORDER BY COUNT(FormatCode) DESC;

--Problem 13 Solution
SELECT CustID as "Customer_ID", CustFName as "First_Name", CustLName as "Last_Name", '(' || SUBSTR(CustPhone, 1,3) || ')' || SUBSTR(CustPhone, 4,3) || '-' || SUBSTR(CustPhone, 7,4) as "Phone"
FROM Customer_djr
ORDER BY CustID;

--Problem 14 Solution
SELECT RD.RentailID as "Rental ID", T.GenreID as "GenreID", GenreDesc as "Genre", T.TitleID as "TitleID", Title as "Title", TO_CHAR(FeeAmt, '$999,999.99') as "Fee"
FROM RentalDetail_djr RD, Title_djr T, Genre_djr G, Disk_djr D, Fee_djr F
WHERE RD.DiskID = D.DiskID AND
	  D.TitleID = T.TitleID AND
	  T.GenreID = G.GenreID AND
	  RD.FeeCode = F.FeeCode AND
	  (RD.RentailID,FeeAmt) IN (SELECT RentailID, MIN(FeeAmt)
				 FROM Fee_djr F, RentalDetail_djr RD
				 WHERE RD.FeeCode = F.FeeCode
				 GROUP BY RD.RentailID)
GROUP BY RD.RentailID, T.GenreID, GenreDesc, T.TitleID, Title, FeeAmt
ORDER BY FeeAmt;

--Problem 15 Solution
SELECT GenreDesc as "Genre", Title as "Title", RatingDesc as "Rating"
FROM Title_djr T, Genre_djr G, Rating_djr R
WHERE T.GenreID = G.GenreID AND
	  T.RatingID = R.RatingID
ORDER BY GenreDesc, Title;

--Problem 16 solution
SELECT GenreDesc as "GenreName", COUNT(DISTINCT TitleID) as "TitleCount"
FROM Title_djr T, Genre_djr G
WHERE T.GenreID = G.GenreID
GROUP BY GenreDesc
ORDER BY COUNT(TitleID) DESC;

--Problem 17 Solution
SELECT RD.RentailID as "RentalID", D.DiskID as "DiskID", Title as "Title", TO_CHAR(FeeAmt, '$9.99') as "Fee"
FROM Fee_djr F, RentalDetail_djr RD, Disk_djr D, Title_djr T
WHERE FeeAmt <= 2.5 AND
	  RD.DiskID = D.DiskID AND
	  D.TitleID = T.TitleID AND
	  RD.FeeCode = F.FeeCode
ORDER BY FeeAmt DESC;

--Problem 18 Solution
SELECT RD.RentailID as "RentalID", TO_CHAR(RentailDate, 'MM-DD-YYYY') as "Date", C.CustID, CustFName, CustLName, Count(DISTINCT RD.DiskID) as "Disk_Rented_Count"
  FROM RentalDetail_djr RD, Rental_djr R, Customer_djr C
 WHERE RD.RentailID = R.RentailID AND
	   R.CustID = C.CustID
GROUP BY RD.RentailID, RentailDate, C.CustID, CustFName, CustLName
ORDER BY RD.RentailID;

--Problem 19 Solution
SELECT D.DiskID as "DiskID", Title as "Title", RatingDesc as "Rating", FormatDesc as "Format", TO_CHAR(FeeAmt, '$9.99') as "Fee"
 FROM RentalDetail_djr RD, Disk_djr D, Title_djr T, Rating_djr R, Fee_djr F, Format_djr FM
WHERE RentailID = 3 AND
	  RD.DiskID = D.DiskID AND
	  D.TitleID = T.TitleID AND
	  D.FormatCode = FM.FormatCode AND
	  T.RatingID = R.RatingID AND
	  RD.FeeCode = F.FeeCode
ORDER BY D.DiskID;

--Problem 20 Solution
SELECT R.RatingID, RatingDesc, COUNT(Title)
FROM Title_djr T, Rating_djr R
WHERE T.RatingID = R.RatingID
GROUP BY R.RatingID, RatingDesc;

--Problem 21 Solution
SELECT RD.RentailID, D.DiskID, Title, GenreDesc, RD.FeeCode, TO_CHAR(FeeAmt, '$999,999.99')
FROM RentalDetail_djr RD, Disk_djr D, Title_djr T, Genre_djr G, Fee_djr F
WHERE RD.DiskID = D.DiskID AND
	  D.TitleID = T.TitleID AND
	  T.GenreID = G.GenreID AND
	  RD.FeeCode = F.FeeCode AND
	  FeeAmt >= (SELECT AVG(FeeAmt)
				FROM Fee_djr F, RentalDetail_djr RD
				WHERE RD.FeeCode = F.FeeCode)
ORDER BY Title;

--Problem 22 solution
SELECT UNIQUE T.TitleID, Title, GenreDesc, RatingDesc
 FROM RentalDetail_djr RD, Disk_djr D, Title_djr T, Rating_djr R, Genre_djr G
WHERE RD.FeeCode = 'B' AND
      RD.DiskID = D.DiskID AND
	  D.TitleID = T.TitleID AND
	  T.RatingID = R.RatingID AND
	  T.GenreID = G.GenreID
--GROUP BY T.TitleID, Title, GenreDesc, RatingDesc
ORDER BY Title;

--Problem 23 solution
SELECT RD.RentailID as "RentalID", TO_CHAR(RentailDate,'MM/DD/YY') as "Date", TO_CHAR(SUM(FeeAmt), '$99,999.99') as "RentalTotal"
FROM RentalDetail_djr RD, Rental_djr R, Fee_djr F
WHERE RD.RentailID = 3 AND
	  RD.RentailID = R.RentailID AND
	  RD.FeeCode = F.FeeCode
GROUP BY RD.RentailID, RentailDate;

--Problem 24 Solution
SELECT D.DiskID as "DiskID", T.TitleID as "TitleID", Title as "Title", RD.FeeCode as "FeeCode", TO_CHAR(FeeAmt, '$999,999.99') as "FeeAmt"
FROM Disk_djr D, Title_djr T, RentalDetail_djr RD, Fee_djr F
WHERE RD.FeeCode = F.FeeCode AND
	  RD.DiskID = D.DiskID AND
	  D.TitleID = T.TitleID AND
	  RentailID = 10 AND
	  FeeAmt = 
      (SELECT MAX(FeeAmt)
	   FROM Fee_djr F, RentalDetail_djr RD
	   WHERE RD.FeeCode = F.FeeCode);

--Problem 25 solution
SELECT RD.RentailID, RentailDate, CustLName, C.ClerkID, ClerkLName
FROM RentalDetail_djr RD, Rental_djr R, Clerk_djr C, Customer_djr CU
WHERE R.ClerkID = C.ClerkID AND
	  R.CustID = CU.CustID AND
	  RD.RentailID = R.RentailID AND
	  RentailDate <= '05-sep-2017'
GROUP BY RD.RentailID, RentailDate, CustLName, C.ClerkID, ClerkLName  
ORDER BY RentailDate ASC, RentailID ASC;

--Problem 26 Solution
SELECT D.DiskID, T.TitleID, Title, TO_CHAR(FeeAmt, '$999,999.99') as "FeeAmt"
 FROM RentalDetail_djr RD, Disk_djr D, Title_djr T, Fee_djr F
WHERE RD.DiskID = D.DiskID AND
	  D.TitleID = T.TitleID AND
	  RD.FeeCode = F.FeeCode AND
	  FeeAmt >= (SELECT AVG(FeeAmt)
				 FROM Fee_djr)
GROUP BY D.DiskID, T.TitleID, Title, FeeAmt
ORDER BY FeeAmt DESC, DiskID ASC;

--Problem 27 solution
SELECT C.CustID as "Customer_ID", CustFName || ' ' || CustLName as "Customer_Name", TO_CHAR(SUM(FeeAmt),'$999,999.99') as "Fee_Total"
FROM Customer_djr C, RentalDetail_djr RD, Rental_djr R, Fee_djr F
WHERE C.CustID = 23 AND
	  RD.RentailID = R.RentailID AND
	  R.CustID = C.CustID AND
	  RD.FeeCode = F.FeeCode
GROUP BY C.CustID, CustFName, CustLName;

--Problem 28 solution
SELECT RentailID, TO_CHAR(RentailDate, 'MM/DD/YYYY') as "Date", C.CustID, CustFName, CustLName, '(' || SUBSTR(CustPhone, 1,3) || ')' || SUBSTR(CustPhone, 4,3) || '-' || SUBSTR(CustPhone, 7,4) as "Phone"
FROM Rental_djr R, Customer_djr C
WHERE RentailDate >= '04-sep-2017' AND
	  R.CustID = C.CustID
ORDER BY RentailDate ASC, CustID ASC;	  

--Problem 29 solution
SELECT C.ClerkID as "EmployeeID", ClerkFName as "FirstName", ClerkLName as "LastName", COUNT(DISTINCT RentailID) as "RentalCount"
FROM Clerk_djr C, Rental_djr R
WHERE R.ClerkID = C.ClerkID
GROUP BY C.ClerkID, ClerkFName, ClerkLName
HAVING COUNT(DISTINCT RentailID) >= 1
ORDER BY COUNT(RentailID) DESC, C.ClerkID ASC;

--Problem 30 solution
SELECT CustID as "Customer_ID", CustFName as "First_Name", CustLName as "Last_Name"
FROM Customer_djr
WHERE CustFName LIKE 'J%' OR
	  CustLName LIKE 'J%'
ORDER BY CustLName;

--Problem 31 solution
SELECT CustID as "CustID", CustFName as "FirstName", CustLName as "LastName"
FROM Customer_djr
WHERE CustID NOT IN (SELECT CustID FROM Rental_djr);

spool OFF
SET echo OFF