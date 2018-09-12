/*
*		MOCK LIBRARY MANAGEMENT SYSTEM
*       SQL AND DATABASE FINAL       
*		By:Colby Lee                            */

/*DATABASE CREATION AND POPULATION*/

USE db_lms

CREATE TABLE PUBLISHER(
PublisherName varchar(70) PRIMARY KEY NOT NULL,
Address varchar(70) NOT NULL,
Phone varchar(30) NOT NULL,
);

CREATE TABLE BOOKS(
BookID int IDENTITY(1,1) PRIMARY KEY,
Title varchar(70) NOT NULL,
PublisherName varchar(70) FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BOOK_AUTHORS(
BookID int FOREIGN KEY REFERENCES BOOKS(BookID), 
AuthorName varchar(30) NOT NULL
);

CREATE TABLE LIBRARY_BRANCH(
BranchID int IDENTITY(1,1) PRIMARY KEY,
BranchName varchar(30),
Address varchar(30)
);

CREATE TABLE BORROWER(
CardNo int IDENTITY(1000,3) PRIMARY KEY,
Name varchar(30) NOT NULL,
Address varchar(30) NOT NULL,
Phone varchar(10) NOT NULL, 
);

CREATE TABLE BOOK_LOANS(
BookID int FOREIGN KEY REFERENCES BOOKS(BookID),
BranchID int FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
CardNo int FOREIGN KEY REFERENCES BORROWER(CardNo),
DateOut date NOT NULL,
DateDue date NOT NULL,
);


CREATE TABLE BOOK_COPIES(
BookID int FOREIGN KEY REFERENCES BOOKS(BookID),
BranchID int FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
Number_Of_Copies int NOT NULL
);

INSERT INTO PUBLISHER
	VALUES
	('Inks Pubs', 'Some Place St.', '509-122-1234'),
	('GOODBOY PUBLICATIONS', 'Some Place St.', '120-399-0911'),
	('Times', '1200 Park Place, Dog House in front right of very secure lawn', '3')

INSERT INTO BOOKS
	VALUES
	('The Lost Tribe', 'Inks Pubs'),
	('Henry''s Tail', 'Inks Pubs'),
	('Pupps on the Run', 'Inks Pubs'),
	('Poochies Mooch Handbook', 'Inks Pubs'),
	('Where To Do Twos', 'GOODBOY PUBLICATIONS'),
	('The Tale Of The Infinite Food Dish', 'GOODBOY PUBLICATIONS'),
	('One Night In The Pen','GOODBOY PUBLICATIONS'),
	('Proper Hole Digging Technique', 'Times'),
	('MOVING ROOM RIDES', 'Times'),
	('Yard Intruders: The Night Before the bad one', 'Times'),
	('The Book Series: 1' , 'Inks Pubs'),
	('The Book Series: 2' , 'Inks Pubs'),
	('The Book Series: 3' , 'Inks Pubs'),
	('The Book Series: 4' , 'Inks Pubs'),
	('The Book Series: 5' , 'Inks Pubs'),
	('The Book Series: 6' , 'Inks Pubs'),
	('The Book Series: 7' , 'Inks Pubs'),
	('The Book Series: 8' , 'Inks Pubs'),
	('The Book Series: 9' , 'Inks Pubs'),
	('The Book Series: 10' , 'Inks Pubs')	

INSERT INTO BOOK_AUTHORS
	VALUES
	(1,'Oran Juice Jones'),
	(2,'Momma Hen'),
	(3,'Grandma Hen'),
	(4,'Henry Asscabin Lee'),
	(5,'Kevyn the Cat'),
	(6,'GoodBoy Chief'),
	(7,'Stella'),
	(8,'Rex'),
	(9,'Rider Rosco'),
	(10,'Chance'),
	(11,'Stephen King'),
	(12,'Stephen King'),
	(13,'Stephen King'),
	(14,'Stephen King'),
	(15,'Stephen King'),
	(16,'Stephen King'),
	(17,'Stephen King'),
	(18,'Stephen King'),
	(19,'Stephen King'),
	(20,'Stephen King')


INSERT INTO LIBRARY_BRANCH
	VALUES
	('Sharpstown', '540 NW Park Ave'),
	('Central', '870 E State'),
	('Portland', '230 NE Sandy Blvd'),
	('Seattle', '542 Edgar Martinez Blvd'),
	('Chewelah', '100 NW Street Ave')

INSERT INTO BORROWER	
	VALUES
	('Colby', '123 Sandy Blvd', '123-1231'),
	('Henry', 'Colby''s Yard', '456-3121'),
	('Debbie', '123 Sandy Blvd', '756-5163'),
	('Katy', '260 Sandy Blvd', '456-3214'),
	('Rico', '123 Sandy Blvd', '849-5487'),
	('Cord', '123 Sandy Blvd', '465-7598'),
	('Bob', '1200 Bob Blvd', '465-7598'),
	('Sandy', '100 Sandy Blvd', '465-7598'),
	('Jim', '1200 Beatulgeuse Blvd', '885-7598'),
	('Billy', '999 Palace Place', '885-6548')

DECLARE @today AS DATE, @return AS DATE
SET @today = CONVERT(date, getDate())
SET @return = CONVERT(date, '2018-09-12')
INSERT INTO BOOK_LOANS
	VALUES
	(1, 1, 1000, @today, @return),
	(2, 1, 1000, @today, @return),
	(3, 1, 1000, @today, @return),
	(5, 1, 1003, @today, @return),
	(6, 1, 1003, @today, @return),
	(7, 1, 1003, @today, @return),
	(9, 1, 1003, @today, @return),
	(10, 1, 1003, @today, @return),
	(11, 1, 1003, @today, @return),
	(12, 1, 1003, @today, @return),
	(13, 2, 1006, @today, @return),
	(14, 2, 1006, @today, @return),
	(15, 2, 1006, @today, @return),
	(16, 2, 1006, @today, @return),
	(17, 2, 1009, @today, @return),
	(18, 2, 1009, @today, @return),
	(19, 2, 1009, @today, @return),
	(20, 2, 1009, @today, @return),
	(1, 2, 1024, @today, @return),
	(2, 2, 1012, @today, @return),
	(3, 2, 1012, @today, @return),
	(5, 2, 1012, @today, @return),
	(6, 3, 1012, @today, @return),
	(7, 3, 1015, @today, @return),
	(9, 4, 1015, @today, @return),
	(10, 4, 1015, @today, @return),
	(11, 4, 1015, @today, @return),
	(12, 4, 1015, @today, @return),
	(13, 1, 1018, @today, @return),
	(14, 1, 1018, @today, @return),
	(15, 3, 1018, @today, @return),
	(16, 3, 1018, @today, @return),
	(17, 3, 1024, @today, @return),
	(18, 3, 1021, @today, @return),
	(19, 2, 1009, @today, @return),
	(20, 2, 1009, @today, @return),
	(1, 2, 1000, @today, @return),
	(2, 2, 1000, @today, @return),
	(3, 2, 1000, @today, @return),
	(5, 1, 1003, @today, @return),
	(6, 1, 1003, @today, @return),
	(7, 1, 1003, @today, @return),
	(9, 1, 1003, @today, @return),
	(10, 1, 1003, @today, @return),
	(11, 1, 1003, @today, @return),
	(12, 1, 1003, @today, @return),
	(13, 2, 1006, @today, @return),
	(14, 2, 1006, @today, @return),
	(15, 2, 1006, @today, @return),
	(16, 2, 1006, @today, @return),
	(17, 2, 1009, @today, @return),
	(18, 2, 1009, @today, @return),
	(19, 2, 1009, @today, @return),
	(20, 2, 1009, @today, @return),
	(5, 1, 1000, @today, @today)
;


INSERT INTO BOOK_COPIES
	VALUES
	(1, 1, 2),
	(2, 1, 3),
	(3, 1, 3),
	(4, 1, 3),
	(5, 1, 3),
	(6, 1, 3),
	(7, 1, 3),
	(8, 1, 3),
	(9, 1, 3),
	(10, 1, 3),
	(11, 1, 3),
	(12, 1, 3),
	(1, 2, 4),
	(2, 2, 3),
	(3, 2, 3),
	(4, 2, 3),
	(5, 2, 3),
	(6, 2, 3),
	(7, 2, 3),
	(8, 2, 3),
	(9, 2, 3),
	(10, 2, 3),
	(11, 2, 3),
	(12, 2, 3),
	(13, 2, 3),
	(14, 2, 3),
	(15, 2, 3),
	(16, 2, 3),
	(17, 2, 3),
	(18, 2, 3),
	(1, 3, 4),
	(2, 3, 3),
	(3, 3, 3),
	(4, 3, 3),
	(5, 3, 3),
	(6, 3, 3),
	(7, 3, 3),
	(8, 3, 3),
	(9, 3, 3),
	(10, 3, 3),
	(11, 3, 3),
	(12, 3, 3),
	(13, 3, 3),
	(14, 3, 3),
	(15, 3, 3),
	(16, 3, 3),
	(17, 3, 3),
	(18, 3, 3),
	(1, 4, 4),
	(2, 4, 3),
	(3, 4, 3),
	(4, 4, 3),
	(5, 4, 3),
	(6, 4, 3),
	(7, 4, 3),
	(8, 4, 3),
	(9, 4, 3),
	(10, 4, 3),
	(11, 4, 3),
	(12, 4, 3),
	(13, 4, 3),
	(14, 4, 3),
	(15, 4, 3),
	(16, 4, 3),
	(17, 4, 3),
	(18, 4, 3)

/*Create All Stored Procedures----------------------------------------------------------*/

/*PROCEDURE FOR SQL FINAL DRILL 1
How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown"?*/
GO

CREATE PROC usp_cBooksIn @branch varchar(30) = 'Sharpstown', @title varchar(30) = 'The Lost Tribe'
AS
SELECT b.Title, Number_Of_Copies FROM BOOK_COPIES bc
INNER JOIN LIBRARY_BRANCH lb ON bc.BranchID = lb.BranchID
INNER JOIN BOOKS b ON bc.BookID = b.BookID 
WHERE lb.BranchName = @branch AND b.Title = @title
GO

/*PROCEDURE FOR SQL FINAL DRILL 2
How many copies of the book titled "The Lost Tribe" 
are owned by each library branch?*/ 
GO

CREATE PROC usp_bookByBranch @title varchar(30) = 'The Lost Tribe'
AS
SELECT b.Title, Number_Of_Copies AS 'Copies', lb.BranchName AS 'Branch' FROM BOOK_COPIES bc
INNER JOIN LIBRARY_BRANCH lb ON bc.BranchID = lb.BranchID
INNER JOIN BOOKS b ON bc.BookID = b.BookID 
WHERE b.Title = @title
GO

/*PROCEDURE FOR SQL FINAL DRILL 3
Retrieve the names of all borrowers who do not have any books checked out.*/
GO

CREATE PROC usp_noBooks
AS
SELECT Name AS 'No Books On Loan' FROM BORROWER b
LEFT JOIN BOOK_LOANS bl ON bl.CardNo = b.CardNo
WHERE bl.BookID IS NULL
GO

/*PROCEDURE FOR SQL FINAL DRILL 4
For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 
today, retrieve the book title, the borrower's name, and the borrower's address.*/
GO

CREATE PROC usp_dueTodayS
AS
SELECT Title, bo.Name, bo.Address FROM BOOKS b
INNER JOIN BOOK_LOANS bl ON b.BookID = bl.BookID
INNER JOIN LIBRARY_BRANCH lb on bl.BranchID = lb.BranchID
INNER JOIN BORROWER bo on bl.CardNo = bo.CardNo
WHERE lb.BranchName = 'Sharpstown' AND bl.DateDue = CONVERT(date,getDate())
GO

/*PROCEDURE FOR SQL FINAL DRILL 5
For each library branch, retrieve the branch name and the total number of 
books loaned out from that branch.*/
GO

CREATE PROC usp_booksLoaned
AS
SELECT BranchName, COUNT(*) AS 'Books On Loan' FROM LIBRARY_BRANCH lb
INNER JOIN BOOK_LOANS bl on lb.BranchID = bl.BranchID
GROUP BY BranchName HAVING COUNT(*) >= 0
GO

/*PROCEDURE FOR SQL FINAL DRILL 6
Retrieve the names, addresses, and the number of books checked out for all borrowers
who have more than five books checked out.*/
GO

CREATE PROC usp_hasLots
AS
SELECT Name, Address, COUNT(*) AS 'Books On Loan' FROM BORROWER b
INNER JOIN BOOK_LOANS bl ON b.CardNo = bl.CardNo
GROUP BY Name, Address HAVING COUNT(*) > 5
GO

/*PROCEDURE FOR SQL FINAL DRILL 7
For each book authored (or co-authored) by "Stephen King", retrieve the title and the 
number of copies owned by the library branch whose name is "Central".*/
GO

CREATE PROC usp_authorAtBranch
AS
SELECT Title, COUNT(*) AS 'Copies' FROM BOOKS b
INNER JOIN BOOK_LOANS bl ON b.BookID = bl.BookID
INNER JOIN BOOK_AUTHORS ba on b.BookID = ba.BookID
INNER JOIN LIBRARY_BRANCH lb on bl.BranchID = lb.BranchID
WHERE ba.AuthorName = 'Stephen King' AND lb.BranchName = 'Central'
GROUP BY Title HAVING COUNT(*) > 0
GO

/*Executing all the procedures we created*/
EXEC [dbo].[usp_cBooksIn]
EXEC [dbo].[usp_bookByBranch]
EXEC [dbo].[usp_noBooks]
EXEC [dbo].[usp_dueTodayS]
EXEC [dbo].[usp_booksLoaned]
EXEC [dbo].[usp_hasLots]
EXEC [dbo].[usp_authorAtBranch]


