-- winget install oracle.mysql
-- winget install oracle.mysqlshell

-- mysqlsh -u mysql

CREATE DATABASE TechCorpDB;

USE TechCorpDB;

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL UNIQUE,
    DepartmentID INT
);

ALTER TABLE Employees
ADD COLUMN LastName VARCHAR(50) NOT NULL;

ALTER TABLE Employees
ADD CONSTRAINT FK_Department FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);

DESCRIBE Departments;

/*

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| DepartmentID   | int         | NO   | PRI | NULL    | auto_increment |
| DepartmentName | varchar(50) | NO   | UNI | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
2 rows in set (0.0019 sec)

*/

INSERT INTO Departments (DepartmentName)
VALUES ('HR'), ('Engineering'), ('Marketing');

INSERT INTO Employees (FirstName, LastName, DepartmentID)
VALUES
('Margaret', 'Smith', 2),
('Rajesh', 'Patel', 1),
('Bjorn', 'Andersen', 3),
('Gerry', 'Johnson', 2),
('Makaela', 'Lopez', 3),
('Mary-Kate', 'Olsen', 1);

SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

/*
+-----------+----------+----------------+
| FirstName | LastName | DepartmentName |
+-----------+----------+----------------+
| Margaret  | Smith    | Engineering    |
| Gerry     | Johnson  | Engineering    |
| Rajesh    | Patel    | HR             |
| Mary-Kate | Olsen    | HR             |
| Bjorn     | Andersen | Marketing      |
| Makaela   | Lopez    | Marketing      |
+-----------+----------+----------------+
6 rows in set (0.0009 sec)
*/