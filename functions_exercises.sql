USE employees;

# Update your queries for employees whose names start and end with 'E'.
# Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no DESC;


# For your query of employees born on Christmas and hired in the 90s,
# use datediff() to find how many days they have been working at the company
# (Hint: You will also need to use now() or curdate())
SELECT *, CONCAT('DAYS at company: ', DATEDIFF(NOW(), hire_date))
FROM employees
WHERE hire_date LIKE '199%'
    AND birth_date LIKE '%12-25'
ORDER BY birth_date ASC, hire_date DESC;
