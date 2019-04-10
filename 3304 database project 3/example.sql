--Turns on Spooling and echoing
spool Project3_djr.txt
set echo on

--project 3 example

--Problem 7 example. List the average rate amount for all rooms reserved
SELECT AVG(RateAmt)
FROM ResDetail_djr; --Gets the average amount

--Problem 8 example. List the average rate amount for all rooms reserved. Actual how its suppose to be done.
SELECT Count(DISTINCT TitleID)
FROM Disk_djr;

--List the Count of all rooms in the Room TABLE
SELECT Count(*)
FROM Rooms_djr;

--counts up the total # of reservations
SELECT SUM(ResID)
FROM Reservation_djr;

--List the highest value for existing customer IDs
SELECT (MAX(CustID) + 1)
FROM Customer_djr;

--List the lowest amount charged for any room reservation.
SELECT MIN(RateAmt)
FROM ResDetail_djr;

--Problem 9 example. List the CustType and count of customers for each type. 
SELECT CustType, Count(CustID)
FROM Customer_djr
GROUP BY CustType;

--Problem 10 Example. List the ResNum, CheckIn, CheckOut, and the total nightly rate charged for Reservation 1001. Use the following headings:
-- ResNumber, CkInDate, CkOutDate, NightlyTtl
SELECT R.ResNum as 'ResNumber', CheckIN as 'CkInDate', CheckOut as 'CkOutDate', TO_CHAR(SUM(RateAmt), '$999,999.99') as 'NightlyTtl'
  FROM Reservation R, ResDetail RD
 WHERE R.ResNum = RD.ResNum AND 
	   R.ResNum = 1001;

-- List the CustID, CustFName, CustLName, and count of reservation for each customer. Combine the first and last name into one column
--Sort by reservation count in descending order, then by customer ID in ascending order. Hint:  Use a GROUP BY clause.
SELECT R.CustID, CustFName || ' ' || CustLName, Count(ResID) as 'ResCount' -- || is used for string cancatination which joins the values together into one column without a space
FROM Reservation_djr R, Customer_djr C
WHERE R.CustID = C.CustID
GROUP BY R.CustID, CustFName, CustLName 
ORDER BY 'ResCount' DESC, R.CustID;
	   
--Problem 11 Example. List all rows and all columns from the RentalDetail table; sort by Rental ID then by Disk ID, both in ascending order.
--Use the following column headings:  RentalID, DiskID, FeeCode.
SELECT * FROM ResDetail_djr
 ORDER BY ResNum, RoomNum; --DESC would be used to specify if the numbers would be descending
 
--Problem 12 example.  List the AgentType, AgentDESC, and count of Agents for each type.  
--Sort by count in descending order. Hint:  Use a GROUP BY clause. 
SELECT A.AgentType, AgentDesc, Count(AgentID)
FROM Agent_djr A				 
INNER JOIN AgentType_djr ATT ON		-- cant use the alias AT as its a command that waits for a command so ATT was substituted.
A.AgentType = ATT.AgentType
GROUP BY A.Agentype, AgentDesc;

--Other join types

--Problem 13 example. List the ResNum, CustID, CustLName, CustPhone for all reservations. Format the phone number as ###.###.####. Use the following
--alternate column headings: ResNum CustomerID, LastName, Phone. Sort by ResNum
SELECT ResNum as 'ResID', C.CustID as 'CustomerID', CustLName as 'LastName', SUBSTR(CustPhone, 1,3) || '.' || SUBSTR(CustPhone, 4,3) || '.' || SUBSTR(CustID, 7,4) as 'Phone'
FROM Reservation_djr R, Customer_djr C
WHERE R.CustID = C.CustID
ORDER BY ResNum;

--Problem 14 example. 
SELECT ResNum, RD.RoomNum, R.RoomType, RoomDesc, RateAmt		--Whats being outputed
FROM ResDetail_djr RD, Room_djr R, RoomType_djr RT
WHERE RD.RoomNum = R.RoomNum AND
	  R.RoomType = RT.RoomType AND
	  (ResNum, RateAmt) IN				--"JOIN" IN is necessary to show only a specific amount rather than a bunch of columns
	  (SELECT ResNum, MAX(RateAmt)		--This is the nested select that only displays the combinations that have the highest rent amount
	  FROM ResDetail_djr
	  GROUP BY ResNum);

--Problem 24 example	  
SELECT RD.RoomNum, R.RoomType, RoomDesc, RateAmt
FROM ResDetail_djr RD, Room_djr R, RoomType_djr RT
WHERE RD.RoomNum = R.RoomNum AND
	  R.RoomType = RT.RoomType AND
	  ResNum = 1008 AND
	  RateAmt = 
	  (SELECT MIN(RateAmt)
	     FROM ResDetail_djr
	    WHERE ResNum = 1008);

--Problem 30 example
--List the CustID, First name, and last name for all customers whose first name starts with an 'M'
--And last name starts with a 'V'
SELECT CustID, CustFName, CustLName
  FROM Customer_djr
 WHERE CustFName LIKE 'M%' AND --The % means Remainder or whats after
	   CustLName Like 'V%';

--Close the output file	  
--Turns off Spooling and echoing
spool off
set echo off