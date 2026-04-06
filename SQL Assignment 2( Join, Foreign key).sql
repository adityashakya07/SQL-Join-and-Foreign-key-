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
select * from Departments d
join Employees e
on d.dept_id = e.dept_id;
select * from Employees 
where dept_id is null ;
select * from Departments d
left join Employees e
on d.dept_id = e.dept_id ;
select e.emp_name,e.salary, dept_name from Employees e
join Departments d
on e.dept_id = d.dept_id;
select * from Employees e  
join Projects p
on p.emp_id = e.emp_id ;
select * from Employees
where dept_id is null;
select e.emp_name, project_name from Employees e  
left join Projects p
on p.emp_id = e.emp_id ;
SELECT d.dept_id, d.dept_name
FROM Departments d
LEFT JOIN Employees e 
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;
SELECT e.emp_name, e.emp_id,salary , d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'HR';
SELECT e.emp_name, d.dept_name, p.project_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id
LEFT JOIN Projects p ON e.emp_id = p.emp_id;
select emp_id from Projects
group by emp_id Having count(*) > 1; 
SELECT d.dept_name, COUNT(e.emp_id)
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
SELECT d.dept_name, COUNT(e.emp_id)>2
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


SELECT e.emp_name FROM Employees e
LEFT JOIN Projects p 
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;
SELECT p.project_name FROM Projects p
LEFT JOIN Employees e
ON p.emp_id = e.emp_id
WHERE e.emp_id IS NULL;
select emp_name, salary , dept_name from Employees e
left join departments d
on e.dept_id = d.dept_id 
where salary>40000;
SELECT dept_id, MAX(salary) FROM Employees
GROUP BY dept_id;

SELECT e.*
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);
SELECT dept_id
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > 45000;
SELECT *
FROM Employees
WHERE dept_id = (
    SELECT dept_id FROM Employees WHERE emp_name = 'Amit'
);
SELECT p1.emp_id, p2.emp_id, p1.project_id
FROM Projects p1
JOIN Projects p2 
ON p1.project_id = p2.project_id AND p1.emp_id <> p2.emp_id;
SELECT *
FROM Employees e
LEFT JOIN Projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL AND e.dept_id IS NOT NULL;
SELECT dept_id, SUM(salary), AVG(salary)
FROM Employees
GROUP BY dept_id;
SELECT *
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);
SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
LEFT JOIN Projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;
ALTER TABLE Employees
DROP FOREIGN KEY Employees_ibfk_1;

ALTER TABLE Employees
ADD FOREIGN KEY (dept_id)
REFERENCES Departments(dept_id)
ON DELETE SET NULL;
ALTER TABLE Employees
DROP FOREIGN KEY Employees_ibfk_1;

ALTER TABLE Employees
ADD FOREIGN KEY (dept_id)
REFERENCES Departments(dept_id)
ON UPDATE CASCADE;
ALTER TABLE Projects
ADD CONSTRAINT fk_emp
FOREIGN KEY (emp_id)
REFERENCES Employees(emp_id);
