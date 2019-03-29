--Turns on Spooling and echoing
spool Project3_djr.txt
set echo on

--project 3 example

--Problem 7 example. List the average rate amount for all rooms reserved
SELECT AVG(RateAmt)
FROM ResDetail_djr; --Gets the average amount

--Problem 8 example. List the average rate amount for all rooms reserved
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
--Close the output file
SELECT R.ResNum as 'ResNumber', CheckIN as 'CkInDate', CheckOut as 'CkOutDate', TO_CHAR(SUM(RateAmt), '$###,###.##') as 'NightlyTtl'
  FROM Reservation R, ResDetail RD
 WHERE R.ResNum = RD.ResNum AND 
	   R.ResNum = 1001;
	   

--Turns off Spooling and echoing
spool off
set echo off