# ORDER BY LECTURE
# Used to order a query result set by specified column(s) in ascending or descending order

USE employees;

DESCRIBE employees;

# Get employees by first_name ascending
SELECT * FROM employees ORDER BY first_name;

# Get employees by last_name descending
SELECT * FROM employees ORDER BY last_name DESC;

# Get employee names ordered by first_name descending and within duplicated first name results,
# order the result by last name ascending
SELECT first_name, last_name FROM employees
ORDER BY first_name DESC, last_name;


# first employee hired
# last employee hired
# first female employee hired
# highest current salary