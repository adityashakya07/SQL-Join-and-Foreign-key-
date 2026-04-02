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
SELECT * FROM Employees
WHERE dept_id IS NULL;
SELECT * FROM Departments d
left join Employees e
on d.dept_id = e.dept_id
order by  d.dept_name, e.emp_name;
SELECT e.emp_name, salary ,d.dept_name from Employees e
join Departments d 
on d.dept_id = e.dept_id;
Select * from Employees e
Join Projects p
on e.emp_id = p.emp_id;
SELECT * FROM Employees e
left join Departments d
on d.dept_id = e.dept_id 
where d.dept_id= null ;
