# WHERE CLAUSE LECTURE

# The Where clause allows us to craft queries based on very specific criteria

# The following concepts will be covered:
# LIKE
# BETWEEN
# IS NULL / IS NOT NULL
# Comparison Operators
# IN
# DISTINCT
# Chaining WHERE clauses

USE employees;

SHOW TABLES;

select * from salaries;

# example queries on the employees table

DESCRIBE employees;


# Basic WHERE Clause
# the list of employees that were hired in 1987-02-23
SELECT first_name, last_name
FROM employees
WHERE hire_date = '1987-02-23';

# LIKE and wild cards
# all the employees with a first name that starts with "F"
SELECT *
FROM employees
WHERE first_name LIKE 'f%';

# all the employees whose last name ends with ing
SELECT *
FROM employees
WHERE last_name LIKE '%ing';

# all the employees with "in" somewhere in their first name
SELECT *
FROM employees
WHERE first_name LIKE '%in%';

# BETWEEN
# all the employees that has an employee number between 12434 and 12440
SELECT *
FROM employees
WHERE emp_no BETWEEN 12434 AND 12440;

SELECT *
FROM employees
WHERE emp_no >= 12434 and emp_no <= 12440;

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-10-22' AND '1990-11-22';

# IS NULL and IS NOT NULL
USE codeup_test_db;
SHOW TABLES;
SELECT * FROM users;
SELECT * FROM users WHERE role_id IS NULL;
USE employees;

# IN
# all employees with one of the following first names 'Elvis','Magy','Brendon'
SELECT * FROM employees
WHERE first_name IN ('Elvis','Magy','Brendon');

# same results different approach
SELECT * FROM employees WHERE first_name = 'Elvis'
                           OR first_name = 'Magy'
                           OR first_name = 'Brendon';

# DISTINCT
SELECT * FROM employees;
SELECT DISTINCT first_name FROM employees;
SELECT DISTINCT last_name FROM employees;
SELECT DISTINCT first_name, last_name FROM employees;

# Chained where clauses

SELECT * FROM employees
WHERE emp_no = 10001
   OR first_name = 'Parto';

SELECT * FROM employees
WHERE birth_date = '1953-09-02'
  AND gender = 'F';

SELECT *
FROM employees
WHERE last_name IN ('Herber','Baek')
    AND emp_no < 20000
   OR first_name = 'Dmitri';


# the list of employees that were hired in 1987-02-23
# all the employees that start with an F
# all the employees whose last name ends with ing
# all the employees with "in" somewhere in their first name
# all the employees that has an employee number between 12434 and 12440
# all employees hired in March
# all employees hired before February 7, 1991
# all employees with one of the following first names 'Elvis','Magy','Brendon'
# same results different approach
# DISTINCT
# Chained where clauses