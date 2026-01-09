/*
Define the Problem:

Design a database for a movie streaming service to store information about movies, directors, and actors.

Step-by-Step Example:
Identify Key Categories (Tables):

Movies: Details about each movie.
Directors: Information about movie directors.

Actors: Details about the actors.

Define the Columns for Each Table:

Movies Table:

MovieID: Unique identifier (Primary Key).

Title: Name of the movie.

ReleaseYear: Year the movie was released.

DirectorID: Connects to the Directors table (Foreign Key).

Directors Table:

DirectorID: Unique identifier (Primary Key).

Name: Director's name.

Actors Table:

ActorID: Unique identifier (Primary Key).

Name: Actor's name.

MovieActors Table (Many-to-Many Relationship):

MovieID: Links to Movies table (Foreign Key).

ActorID: Links to Actors table (Foreign Key).

Establish Relationships:

Each movie is directed by one director, but one director can direct many movies (One-to-Many).

Each movie can feature many actors, and each actor can appear in many movies (Many-to-Many).

Diagram the Schema:

Movies Table:
  - MovieID (PK)
  - Title
  - ReleaseYear
  - DirectorID (FK)

Directors Table:
  - DirectorID (PK)
  - Name

Actors Table:
  - ActorID (PK)
  - Name

MovieActors Table:
  - MovieID (FK)
  - ActorID (FK)
*/

CREATE TABLE Directors (
  DirectorID INT PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL
);

CREATE TABLE Actors (
  ActorID INT PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL
);

CREATE TABLE Movies (
  MovieID INT PRIMARY KEY,
  Title NVARCHAR(200) NOT NULL,
  ReleaseYear INT NOT NULL,
  DirectorID INT NOT NULL,
  FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID)
);

CREATE TABLE MovieActors (
  MovieID INT NOT NULL,
  ActorID INT NOT NULL,
  PRIMARY KEY (MovieID, ActorID),
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
  FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
);