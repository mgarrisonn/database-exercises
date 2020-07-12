# ALIASES LECTURE

USE employees;

-- Aliases = used to temporarily control output for column / table names


SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
LIMIT 25;

-- Alias column name

SELECT CONCAT("Hello", " world") AS 'Some Message';

SELECT CONCAT(
               'Teaching people to code for ',
               UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
               ' seconds'
           ) AS 'Codeup Age';


-- Multiple aliases
SELECT first_name as 'First Name', last_name as 'Last Name'
FROM employees;


-- Multiple column data for one alias

SELECT CONCAT(first_name, ' ', last_name, ' was born ', birth_date) AS 'Employee Birth Message'
FROM employees;

-- Alias table name (very important for writing table joins)

SELECT * FROM employees AS e;


SELECT hire_date, COUNT(*) AS employee_count
FROM employees
GROUP BY hire_date
ORDER BY employee_count DESC
LIMIT 10;