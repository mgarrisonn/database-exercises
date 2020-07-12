# FUNCTIONS LECTURE

USE employees;

# http://www.mysqltutorial.org/mysql-functions.aspx

# ========== STRING FUNCTIONS (string manipulation) --

# CONCAT() - used to concatenate strings together

SELECT 'Something';

SELECT CONCAT('Hello', ' ' , 'World');

# Use CONCAT() to output the following for all employees...
# "Georgi Facello was born 1953-09-02" (and include column for emp_no)
SELECT
    CONCAT(
            first_name,
            ' ',
            last_name,
            ' was born ',
            birth_date
        ) as Info, emp_no as Employeeno
FROM employees;


# LENGTH() - used to find the length of a string
SELECT LENGTH('supercalifragilisticexpialidocious');

# Output first_name, and length of first name as two columns
SELECT first_name, LENGTH(first_name) FROM employees;

# COMBINING FUNCTIONS
SELECT UPPER(CONCAT("Hello", TRIM(" world   ")));


# ========== DATE FUNCTIONS (return units of time) --

# NOW()
SELECT NOW();

# CURDATE()
SELECT CURDATE();

# CURTIME()
SELECT CURTIME();

# UNIX_TIMESTAMP()

SELECT UNIX_TIMESTAMP();

SELECT CONCAT(
               'Teaching people to code for ',
               ((UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'))),
               ' seconds'
           );

# ========== AGGREGATE FUNCTIONS (info about results) --

# /////// COUNT()

# count all table records
SELECT COUNT(*) FROM employees;


# count total filtered results
SELECT COUNT(*)
FROM employees
WHERE birth_date = '1953-09-02';

# count each unique instance of a value
SELECT COUNT(DISTINCT birth_date)
FROM employees;


# count each set of identical results
SELECT birth_date, COUNT(birth_date)
FROM employees
GROUP BY birth_date;


# MAX() / MIN()
SELECT MAX(birth_date) FROM employees;
SELECT MIN(birth_date) FROM employees;

# SUM()
SELECT salary, from_date
FROM salaries
WHERE emp_no = 10001
ORDER BY from_date ASC;

SELECT SUM(salary)
FROM salaries
WHERE emp_no = 10001;



# AVG()

SELECT AVG(salary)
FROM salaries;



# ========== MATH FUNCTIONS (perform calculations) --

# ROUND()
SELECT ROUND(AVG(salary))
FROM salaries;

# COS()

SELECT COS(2);

# RAND()
SELECT RAND();
