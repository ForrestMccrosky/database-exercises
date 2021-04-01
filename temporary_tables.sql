
USE florence10;
-- Questioon 1 Create the table

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT employees.employees.emp_no, employees.employees.first_name, employees.employees.last_name, employees.dept_emp.dept_no, employees.departments.dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

SELECT *
FROM employees_with_departments
LIMIT 20;

-- Question 1a adds the column full_name as a string using VARCHAR

ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

SELECT *
FROM employees_with_departments;

-- Question 1b update the full_name column from null to the correct information using a concat statement with first_name and last_name to add  the string values
-- for the full names
UPDATE employees_with_departments 
SET full_name = concat(first_name, ' ', last_name);

SELECT *
FROM employees_with_departments;

-- Question 1c remove the columns first_name and last_name we can do this by using two seperate alter tables and drop columns for first_name
-- and last_name

ALTER TABLE employees_with_departments 
DROP COLUMN first_name;

ALTER TABLE employees_with_departments
DROP COLUMN last_name;

-- During these alter and updates the output is not generated the table is simply changed so by selecting * from our temporary table
-- we can check our work
SELECT *
FROM employees_with_departments;

-- Question 1d
-- Another way we could have ended up with the same table is by building the concat in the original query

-- Question 2

USE sakila;

SELECT *
FROM payment;

USE florence10;

-- For Question 2 since the question is asking to create a table based on the payment table from sakila
-- I just created a duplicate temporary table named sakila_payment and selected everything from sakila.payments to be inside of it

CREATE TEMPORARY TABLE sakila_payment AS (
SELECT * FROM sakila.payment
);

-- 

SELECT *
FROM sakila_payment;

-- For some reason when i tried to multiply by 100 to remove the decimal to make cents it had an error where the value was too high.
-- So I (Anna) looked up how to modify the decimal limit in a table

ALTER TABLE sakila_payment
MODIFY amount DECIMAL(10,0);

-- then the multiply by 100 removed the decimal to make cents.

UPDATE sakila_payment
SET amount = amount * 100

-- However, for some reason the multiplying by 100 method rounded all the prices ending in 99 up 1 so i used another update to subract by 1 getting the correct answer in the table with the select * below

UPDATE sakila_payment 
SET amount = amount -1;

SELECT *
FROM sakila_payment;

-- Question 3
-- In order to answere question 3 it wants us to use a function with salaries, but we don't have salary information in our temporary
-- table so I used a join statement joining salaries table to our temp table below using the common column emp_no

SELECT *
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no
WHERE employees.salaries.to_date > curdate();

-- To return the average salaries of each department. I am going to narrow my select becasue I will have an aggregate function 
-- of average as the second select. So by selecting dept_name and the avg function of employees.salaries.salary I can sort everything
-- with an easy group by dept_name at the end 

-- This displays current department average salaries

SELECT dept_name, AVG(employees.salaries.salary) AS c_average_salary
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no
WHERE employees.salaries.to_date > curdate()
GROUP BY dept_name;


-- By removing the where, the group by, and the dept_name select we can display the average salary of every salary (historical average salary
-- per the question)

SELECT AVG(employees.salaries.salary) AS h_average_salary
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no;

-- Historical average salary = 63805.4005


-- Redisplaying table

SELECT *
FROM employees_with_departments;

-- In order to calculate z scores of salaries I am going to make a new clean temporary table only displaying the info needed
-- for the equation with the department names

CREATE TEMPORARY TABLE salary_comparison AS(
SELECT dept_name, AVG(employees.salaries.salary) AS c_average_salary
FROM employees_with_departments
JOIN employees.salaries ON employees_with_departments.emp_no = employees.salaries.emp_no
WHERE employees.salaries.to_date > curdate()
GROUP BY dept_name
);

-- this displays our updated and modified table showing the current average salaries of each department with the single value of 
-- average historical salary next to it for easier equation usage.
SELECT *
FROM salary_comparison;

ALTER TABLE salary_comparison ADD h_average_salary INT(255);

ALTER TABLE salary_comparison
MODIFY h_average_salary DECIMAL(10,4);

UPDATE salary_comparison 
SET h_average_salary = 63805.4005;

-- Calculating the Z-score below  

SELECT *, (c_average_salary - h_average_salary)/ 16904.82828800014 AS z_score
FROM salary_comparison;

-- Results of temporary table with z scores at the end above ^^^^^^
-- Using the new z score output with the new temporary table the best department to work for woulb be sales because it has the largest z score
-- which translates into higher growth potential for salary.
-- Then the worst department to work for would be human resources because of their unfortunate negative z-score which means the growth
-- of the salary in reference to time is negligent and has barely increased over the years.

USE employees;
-- standard deviation of salaries from employees = 16904.82828800014
SELECT stddev(salary)
FROM salaries;










