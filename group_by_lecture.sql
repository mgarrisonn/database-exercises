# GROUP BY LECTURE

# The "group by" clause is used to aggregate a table into various groups of shared characteristics.
#
# Grouping data is often accompanied with the use of aggregate functions to derive additional information
# about the various groupings.
#
# Most common aggregate functions are:
#
#     MIN()
#     MAX()
#     SUM()
#     AVG()
#     COUNT()
#
# One or multiple columns may be grouped together.
#
# No table columns may exist in a select clause that are not contained in the group by clause.
#
#     The group by clause is after an optional where clause and before an optional order by clause.
#
#     The order of a result set may be by an aggregate column but an aggregate column cannot be referenced in a where clause.
#
# A having clause is a way to use aggregate results as if in a where clause.

use employees;

# Grouping by a single column

SELECT gender FROM employees;

SELECT DISTINCT gender from employees;

SELECT gender FROM employees
GROUP BY gender;



# Grouping by multiple columns

SELECT first_name, last_name FROM employees
GROUP BY first_name, last_name;

SELECT DISTINCT first_name, last_name FROM employees;

# COUNT function

# Find total number of employees
# SELECT COUNT(*) FROM employees;

# Find the most common name
SELECT first_name, last_name, count(*) FROM employees
GROUP BY first_name, last_name;

SELECT first_name, last_name, count(*) FROM employees
GROUP BY first_name, last_name
ORDER BY count(*) DESC;

# Find the most common female and male name
SELECT first_name, last_name, gender, count(*) FROM employees
GROUP BY first_name, last_name, gender
ORDER BY count(*) desc;



# =========== AGGREGATE FUNCTIONS

# COUNT


# Aggregating with group by

# Find total number of female and male employees
SELECT gender, COUNT(*) FROM employees
GROUP BY gender;

# MIN and MAX
# Select the first and last hire date for each first name
SELECT first_name, MIN(hire_date) as 'First Hired', MAX(hire_date) as 'Last Hired' FROM employees
GROUP BY first_name;

DESCRIBE salaries;

# Find the minimum, maximum, average, and total number of salaries
SELECT COUNT(salary), MIN(salary), MAX(salary), AVG(salary), SUM(salary) FROM salaries;

# Find the min, max, avg, total, and count of each employee's salaries
SELECT emp_no, COUNT(salary), MIN(salary), MAX(salary), AVG(salary), SUM(salary) FROM salaries
GROUP BY emp_no
ORDER BY MIN(salary);


# show only the first and last name combinations with more than three employees each
select first_name, last_name, count(*) from employees group by first_name, last_name having count(*) > 3 order by count(*) desc;










# Find the most common name
# Find the most common female and male name
# Find total number of female and male employees
# Find the highest employee number of each unique first name
# Select the first and last hire date for each first name
# Find the minimum, maximum, average, and total number of salaries
# Find the min, max, avg, total, and count of each employee's salaries