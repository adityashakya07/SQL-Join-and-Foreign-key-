CREATE DATABASE COMPANY;
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Employees VALUES
(101, 'Amit', 1, 30000),
(102, 'Neha', 2, 50000),
(103, 'Raj', 2, 45000),
(104, 'Simran', 3, 40000),
(105, 'Karan', NULL, 35000);
CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(50),
emp_id INT,
FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
INSERT INTO Projects VALUES
(1, 'Website', 102),
(2, 'App', 103),
(3, 'Audit', 104),
(4, 'Recruitment', 101);
SELECT * FROM Departments d
join Employees e
on d.dept_id = e.dept_id;
