--project 3 example

--Turns on Spooling and echoing
spool Project3_djr.txt
set echo on

--List the average rate amount for all rooms reserved
SELECT AVG(RateAmt)
FROM ResDetail_djr; --Gets the average amount

--List the average rate amount for all rooms reserved
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

--List the CustType and count of customers for each type. 
SELECT CustType, Count(CustID)
FROM Customer_djr
GROUP BY CustType;

--Turns off Spooling and echoing
spool off
set echo off