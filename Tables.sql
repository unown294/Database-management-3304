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

--Turns off Spooling and echoing
spool Project2_djr.txt
set echo off