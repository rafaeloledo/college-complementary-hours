/*
Define the Problem:

Design a database for a university to manage students, courses, and professors.

Steps to Complete the Task:
Identify the tables: Students, Courses, Professors.

Decide on the columns for each table.

Connect the tables with relationships:

Each professor can teach many courses, but a course is taught by one professor (One-to-Many).

Each student can enroll in many courses, and each course can have many students (Many-to-Many).
*/

CREATE TABLE Professors (
	ProfessorID INT PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL,
	Department NVARCHAR(50) NOT NULL
);

CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
	CourseName NVARCHAR(100) NOT NULL,
	ProfessorID INT NOT NULL,
	FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID)
);

CREATE TABLE Students (
	StudentID INT PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL,
	EnrollmentYear INT
);

CREATE TABLE StudentCourses (
	StudentID INT NOT NULL,
	CourseID INT NOT NULL,
	PRIMARY KEY (StudentID, CourseID),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);