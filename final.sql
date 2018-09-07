
CREATE DATABASE db_lms
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
	(11,'Steven King'),
	(12,'Steven King'),
	(13,'Steven King'),
	(14,'Steven King'),
	(15,'Steven King'),
	(16,'Steven King'),
	(17,'Steven King'),
	(18,'Steven King'),
	(19,'Steven King'),
	(20,'Steven King')

INSERT INTO LIBRARY_BRANCH
	VALUES
	('Sharpstown', '540 NW Park Ave'),
	('Central', '870 E State'),
	('Portland', '230 NE Sandy Blvd'),
	('Seattle', '542 Edgar Martinez Blvd'),
	('Chewelah', '100 NW Street Ave')

INSERT INTO BORROWER	
	VALUES
	('Bob', '1200 Bob Blvd', '465-7598'),
	('Sandy', '100 Sandy Blvd', '465-7598'),
	('Jim', '1200 Beatulgeuse Blvd', '885-7598')

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
	(20, 2, 1009, @today, @return)

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

