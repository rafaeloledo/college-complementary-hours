/*
Define the Problem:

Design a database to manage information about books, authors, and publishers for a bookstore.

Step-by-Step Example:
Identify Key Categories (Tables):

Books: Information about each book.

Authors: Details about authors.

Publishers: Information about the companies publishing the books.

Define the Columns for Each Table:

Books Table:

BookID: Unique identifier (Primary Key).

Title: Name of the book.

ISBN: A unique code for the book.

PublisherID: Connects to the Publishers table (Foreign Key).

Authors Table:

AuthorID: Unique identifier (Primary Key).

FirstName: Author’s first name.

LastName: Author’s last name.

Publishers Table:

PublisherID: Unique identifier (Primary Key).

Name: Publisher name.

Address: Publisher address.

BookAuthors Table (Many-to-Many Relationship):

BookID: Links to Books table (Foreign Key).

AuthorID: Links to Authors table (Foreign Key).

Establish Relationships:

Each book is linked to one publisher, but one publisher can publish many books (One-to-Many).

Each book can have multiple authors, and each author can write multiple books (Many-to-Many).

Diagram the Schema as seen:

Books Table:
  - BookID (PK)
  - Title
  - ISBN (UNIQUE)
  - PublisherID (FK)

Authors Table:
  - AuthorID (PK)
  - FirstName
  - LastName

Publishers Table:
  - PublisherID (PK)
  - Name
  - Address

BookAuthors Table:
  - BookID (FK)
  - AuthorID (FK)
*/

CREATE TABLE Publishers (
  PublisherID INT PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL,
  Address NVARCHAR(255)
);

CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL
);

CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title NVARCHAR(200) NOT NULL,
  ISBN NVARCHAR(20) UNIQUE NOT NULL,
  PublisherID INT NOT NULL,
  FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

CREATE TABLE BookAuthors (
  BookID INT NOT NULL,
  AuthorID INT NOT NULL,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);