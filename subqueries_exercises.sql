USE employees;

SELECT *
FROM employees
LIMIT 5;

-- Question 1
-- Find all the current employees with the same hire date as employee 101010 using a sub-query.
-- to find all employees with the same hire date as employee 101010 is by doing a sub_query referencing hire date from
-- employees where emp_no = 101010.
-- then we are displaying all results of dept_emp within that reference. Also making sure they are all current 
-- using to_date > curdate()

 SELECT *
 FROM dept_emp WHERE from_date IN(
 SELECT hire_date 
 FROM employees 
 WHERE emp_no =101010)
 AND to_date > curdate();


-- Question 2
-- Find all the titles ever held by all current employees with the first name Aamod.
-- Here we used a subquery within title and emp_no. With title being the outside table and inside we referenced the
-- emp_nom from employees where the first_name of the employee was = aamod to be able to use the emp_no in titles in to display the 
-- titles of all emp_no's named Aamod. Then we used group by to remove duplicate titles
-- and to_date > curdate() to make sure they are current employees.

SELECT title
FROM titles WHERE emp_no IN(
SELECT emp_no FROM employees 
WHERE FIRST_name = 'Aamod')
AND to_date >curdate()
GROUP BY title;

-- Question 3
-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- Using a subquery within the same table. We can easily see which employees have to_date less than current date and time
-- to figure out who has left the company. Then grouping by emp_no and only selecting emp_no to remove duplcates. I got the
-- Answer 85,108 employees


SELECT emp_no
FROM dept_emp WHERE to_date IN(
SELECT to_date FROM dept_emp
WHERE to_date < curdate())
group by emp_no;

-- Question 4 
-- Find all the current department managers that are female. List their names in a comment in your code.
-- since we are referencing employees as our original table we can only display first_name and last_name
-- as existing columns of this table, but in order to get current female department manager names we need a subquery referencing
-- the emp_no of the department manager to display only department managers. Then we can use to_date > curdate and gender ='f' to make sure
-- they are current and female
-- Isamu	Legleitner
-- Karsten	Sigstam
-- Leon	DasSarma
-- Hilary	Kambil


SELECT first_name, last_name 
FROM employees WHERE emp_no IN(
SELECT emp_no FROM dept_manager
WHERE to_date > curdate())
AND gender = 'F';

-- Question 5 
--Find all the employees who currently have a higher salary than the companies overall, historical average salary.
-- This is easily done by performing a subquery with the > sign instead of an in to return all the salary from salaries 
-- that have a greater salary then the average within the subquery.

SELECT AVG(salary)
FROM salaries;


SELECT * FROM employees
WHERE emp_no IN(
SELECT emp_no FROM salaries
WHERE salary > 63810.7448 AND to_date > curdate()
);

SELECT *
FROM salaries
WHERE salary > (SELECT AVG(salary) 
FROM salaries)
AND to_date > curdate();

-- Question 6

SELECT salary
FROM salaries 
WHERE salary >= (SELECT max(salary) - stddev(salary) FROM salaries 
WHERE to_date > curdate())
AND to_date > curdate();

SELECT (SELECT count(salary)
FROM salaries 
WHERE salary >= (SELECT max(salary) - stddev(salary) FROM salaries 
WHERE to_date > curdate())
AND to_date > curdate())
/
(SELECT count(salary)
FROM salaries
WHERE to_date > curdate()) *100;





