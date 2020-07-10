USE employees;

DESCRIBE departments;
DESCRIBE dept_manager;
# Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
-- start with department table
-- then JOIN with the dept_manager using dept_no as the common thread
-- then JOIN with the employees table using emp_no as the common thread
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > curdate()
ORDER BY departments.dept_name;

SELECT departments.dept_name AS Department, CONCAT(emp.first_name, ' ', emp.last_name) AS Managers
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees AS emp ON emp.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date = '9999-01-01';


# Find the name of all departments currently managed by women.
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > curdate() AND employees.gender = 'f'
ORDER BY departments.dept_name;


SELECT departments.dept_name AS 'Department Name', CONCAT(emp.first_name, ' ', emp.last_name) AS 'Manager Name'
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees AS emp ON emp.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND emp.gender = 'F'
ORDER BY 'Department Name';


# Find the current titles of employees currently working in the Customer Service department.
SELECT titles.title AS Title, COUNT(*) AS Count
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Customer Service' AND titles.to_date > curdate() AND dept_emp.to_date > curdate()
GROUP BY Title;


SELECT titles.title AS Title, COUNT(dept_emp.emp_no) AS Count
FROM titles
JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Customer Service' AND titles.to_date > curdate() AND dept_emp.to_date > curdate()
GROUP BY Title;



# Find the current salary of all current managers.
SELECT departments.dept_name AS 'Department Name', CONCAT(emp.first_name, ' ', emp.last_name) AS 'Name', salaries.salary AS 'Salary'
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees AS emp ON emp.emp_no = dept_manager.emp_no
JOIN salaries ON emp.emp_no = salaries.emp_no
WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%'
ORDER BY departments.dept_name;



# Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(emp.first_name, ' ', emp.last_name) AS 'Employee Name', departments.dept_name AS 'Department Name', CONCAT(emp2.first_name, ' ', emp2.last_name)
FROM employees as emp
JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
JOIN dept_manager ON emp.emp_no = dept_manager.emp_no
JOIN employees emp2 ON dept_manager.emp_no = emp2.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date = '9999-01-01' AND dept_manager.to_date = '9999-01-01';

SELECT CONCAT(emp.first_name, ' ', emp.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(emp2.first_name, ' ', emp2.last_name)
FROM employees as emp
JOIN dept_emp de on emp.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
JOIN dept_manager dm on d.dept_no = dm.dept_no
JOIN employees emp2 on dm.emp_no = emp2.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01';

