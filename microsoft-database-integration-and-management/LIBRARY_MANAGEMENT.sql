/*
Define the Problem:

Design a database for a library to manage members, books, and loans.

Steps to Complete the Task:
Identify the tables: Members, Books, Loans.

Decide on the columns for each table.

Connect the tables with relationships:

A loan connects a member to a book (One-to-Many).

A book can be borrowed many times by different members (Many-to-Many).
*/

-- Create Members table
CREATE TABLE Members (
	MemberID INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(100)
);

-- Create Books table
CREATE TABLE Books (
	BookID INT PRIMARY KEY,
	Title NVARCHAR(200) NOT NULL,
	Author NVARCHAR(100),
	ISBN NVARCHAR(20) UNIQUE
);

-- Create Loans table
CREATE TABLE Loans (
	LoanID INT PRIMARY KEY,
	MemberID INT NOT NULL,
	BookID INT NOT NULL,
	LoanDate DATE NOT NULL,
	ReturnDate DATE,
	FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
	FOREIGN KEY (BookID) REFERENCES Books(BookID)
);