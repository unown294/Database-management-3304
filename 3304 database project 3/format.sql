--Dalton Redman
--Project 3 Formatting

spool Project3_djr.txt
set echo on

--change width of printable space horizontally, set the line size
SET LINESIZE 150

--to change the width of a column for output, a<length desired>. Will applied to character and variable character column
COLUMN FeeCode FORMAT a8 

--TO use an alternate ("Alieas") Column heading
--Retrieve the CustID, CustFName, and CustLName for all Customer using the following column headings:
--CustomerID, Firstname, LastName
SELECT CustID as "CustomerID", CustFName as "FirstName", CustLName as "LastName"
	FROM Customer_djr;
	
--Retrieve the ResNum, CkIn, CkOut, CustID, CustLName
SELECT ResNum, CkIn, CkOut, Reservation_djr.CustID, CustLName
FROM Reservation, Customer
WHERE Reservation_djr.CustID = Customer_djr.CustID

--Column ambigously defined = you did not use dot notation to reference the attribute
--Points will be taken off if note