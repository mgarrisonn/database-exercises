USE employees;

# Return 10 employees in a result set named 'full_name' in the format of 'last name, first name' for each employee.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
GROUP BY first_name, last_name
ORDER BY last_name
LIMIT 10;


# Add the date of birth for each employee as 'DOB' to the query
SELECT CONCAT(first_name, ' ', last_name) AS full_name, CONCAT(birth_date) AS DOB
FROM employees
GROUP BY first_name, last_name, birth_date
ORDER BY last_name
LIMIT 10;


# Update the query to format full name to include the employee number so it is formatted as 'employee number - last name, first name'
SELECT CONCAT(emp_no, ' ', first_name, ' ', last_name) AS full_name, CONCAT(birth_date) AS DOB
FROM employees
GROUP BY emp_no, first_name, last_name, birth_date
ORDER BY emp_no
LIMIT 10;

