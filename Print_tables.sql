--Dalton James Redman
--Project 2

--Turns on Spooling and echoing
spool Project2_djr.txt
set echo on

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