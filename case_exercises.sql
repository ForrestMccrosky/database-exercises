USE employees;

SELECT *
FROM employees;

-- 1. WRITE a QUERY that RETURNS ALL employees (emp_no), their department number, their START DATE, their END DATE, AND a NEW COLUMN 'is_current_employee' that IS a 1 IF the employee IS still WITH the company AND 0 IF not.

-- in order to display all the information we need to solve the problem we need to use a join combining dept_emp with employees to display dept_numbers and
-- to_date. We accomplish this by joining them on the common column of emp_no

-- after the join we select all the neccessary columns and build our results column (is_current_employee) using statement with a when clause to filter the
-- current employees and non current employees with 1's and 0's using the to_date column  

SELECT employees.emp_no, dept_no, hire_date, to_date,
CASE 
WHEN to_date LIKE '9999-01-01' THEN '1'
ELSE '0'
END AS is_current_employee
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

-- View the employees table 

SELECT *
FROM employees;

-- we all know the alphabet right? Well we did a case statement with a when clause for every letter of the alphabet. We tried experimenting with '['s but could not decipher a runnable query. Therefore we took the long road and here are the results.

SELECT first_name, last_name,
CASE 
WHEN LAST_name LIKE 'a%' THEN 'A-H'
WHEN LAST_name LIKE 'b%' THEN 'A-H'
WHEN LAST_name LIKE 'c%' THEN 'A-H'
WHEN LAST_name LIKE 'd%' THEN 'A-H'
WHEN LAST_name LIKE 'e%' THEN 'A-H'
WHEN LAST_name LIKE 'f%' THEN 'A-H'
WHEN LAST_name LIKE 'g%' THEN 'A-H'
WHEN LAST_name LIKE 'h%' THEN 'A-H'
WHEN LAST_name LIKE 'i%' THEN 'I-Q'
WHEN LAST_name LIKE 'j%' THEN 'I-Q'
WHEN LAST_name LIKE 'k%' THEN 'I-Q'
WHEN LAST_name LIKE 'l%' THEN 'I-Q'
WHEN LAST_name LIKE 'm%' THEN 'I-Q'
WHEN LAST_name LIKE 'n%' THEN 'I-Q'
WHEN LAST_name LIKE 'o%' THEN 'I-Q'
WHEN LAST_name LIKE 'p%' THEN 'I-Q'
WHEN LAST_name LIKE 'q%' THEN 'I-Q'
WHEN LAST_name LIKE 'r%' THEN 'R-Z'
WHEN LAST_name LIKE 's%' THEN 'R-Z'
WHEN LAST_name LIKE 't%' THEN 'R-Z'
WHEN LAST_name LIKE 'u%' THEN 'R-Z'
WHEN LAST_name LIKE 'v%' THEN 'R-Z'
WHEN LAST_name LIKE 'w%' THEN 'R-Z'
WHEN LAST_name LIKE 'x%' THEN 'R-Z'
WHEN LAST_name LIKE 'y%' THEN 'R-Z'
WHEN LAST_name LIKE 'z%' THEN 'R-Z'
END AS alpha_group
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?

-- view the birth days in descding order to get the youngest person (1965)
SELECT *
FROM employees 
ORDER BY birth_date DESC;

-- view the birth days in ascending default order to get the oldest person (1952)
SELECT *
FROM employees 
ORDER BY birth_date;

-- know that we know we are only working with two decades we can build our case statement. We accomplish this by using two when clauses seperating the decades with like statements with 195% and 196% then using then to display the decade name.

-- then we needed to select a count all (*) because we are only selecting the case we built and the count so a count(*) only counts what we have and need. 
-- Then since we are using an aggregate function we will need to group by the case we built (birth_decade) to sort the output.
SELECT 
CASE 
WHEN birth_date LIKE '195%' THEN 'The Fifties Babies'
WHEN birth_date LIKE '196%' THEN 'The Sixties Babies'
ELSE 'youngins'
END AS birth_decade,
count(*) AS employees_per_decade
FROM employees
GROUP BY birth_decade;

