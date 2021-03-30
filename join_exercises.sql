-- Starter questions using the cirriculumn code are listed below to help understand the exercises we are about to perform

USE join_example_db;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- Join exercise

USE employees;

-- Question 2

-- shows all the departments needed to complete question 2
SELECT *
FROM departments;

-- shows all department managers with their employment dates but only shows employee numbers
SELECT *
FROM dept_manager;

-- shows all employees with employee numbers. These three bkock give us an entire visual of everything we will need to complete question 1
SELECT *
FROM employees;

-- Question 2
-- by joining the employees table, the dept_manager table, and the departments tabe, by using the emp_no column for the first two and
-- dept_no for the latter 2. We generate a table with every peice of information we need to answer the question.
-- Then by using a concat statement with a space combining first_name and last_name to create a one column result aliased as Manager_name
-- we can then select the departments.dept_name to display the managers of each department
-- and also making sure they are current employees by using the where clause to_date >curdate()
SELECT concat(employees.first_name, '_', employees.last_name) AS Manager_Name, departments.dept_name
FROM employees 
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE to_date > curdate()
ORDER BY dept_name;

-- Question 3 
-- for question number 3 I can use the same join statements from question 2 and have the same selects because the
-- only difference the question is asking is to return only female gendered employees.
-- There all I did was add an and gender = 'F' at the end of the where clause to produce the correct results
-- Isamu_Legleitner	Finance
-- Karsten_Sigstam	Human Resources
-- Leon_DasSarma	Development
-- Hilary_Kambil	Research
SELECT concat(employees.first_name, '_', employees.last_name) AS Manager_Name, departments.dept_name
FROM employees 
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE to_date > curdate() AND gender = 'F';

-- Question 4
-- For question 4 we need to join the titles, employees, deparments tables to display all the information you need.
-- we can join titles to dept_emp with the emp_no becasue that is a common column and then we can join the 
-- departments table to the dept_emp with dept_no because this is the common column here giving us a complet single table with all the information we need
-- Since the question is only asking for a two column output we can select title and count (title) cleaning up the output
-- with aliases using Title and Count, and since we are using an aggregate function we will need to group by title as well. to produce the correct ouput for question 4
-- Assistant Engineer	68
-- Engineer	627
-- Manager	1
-- Senior Engineer	1790
-- Senior Staff	11268
-- Staff	3574
-- Technique Leader	241
SELECT *
FROM titles;

SELECT title AS Title, count(title) AS Count
FROM titles
JOIN dept_emp ON dept_emp.emp_no = titles.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date > curdate() AND titles.to_date > curdate() AND departments.dept_name = 'Customer Service'
GROUP BY title;

	
	
-- Question 5
-- Find the current salary of all current managers.
-- For question 5 we can use the code from question 2 which displays the current managers.
-- Then we only need to add 3 things to match the question. By adding the salaries table with the common column of emp_no to the managers
-- table we have all the info we need to answer the question now. 
-- Then since we need to see the salaries we will them to our select statement making sure they are from the correct table
-- by using salaries.salary and then by adding an and statement to our original where clause we also 
-- need to make sure the salaries are current by using and salaries.to_date > curdate()
-- Vishwani_Minakawa	Marketing	106491
-- Isamu_Legleitner	Finance	83457
-- Karsten_Sigstam	Human Resources	65400
-- Oscar_Ghazalie	Production	56654
-- Leon_DasSarma	Development	74510
-- Dung_Pesch	Quality Management	72876
-- Hauke_Zhang	Sales	101987
-- Hilary_Kambil	Research	79393
-- Yuchang_Weedman	Customer Service	58745
SELECT concat(employees.first_name, '_', employees.last_name) AS Manager_Name, departments.dept_name, salaries.salary
FROM employees 
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN salaries ON dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date > curdate() AND salaries.to_date >curdate();


-- Question 6
-- Find the number of employees in each department
-- In order to get the full list of information we need to asnwer question 6 we need to join the employees table, 
-- dept_emp table, and the departments table
-- Joining employees with dept_emp uses emp_no as the similar column and joing dept_emp with departments uses dept_no as the similar column
-- Then the question we need to asnwer is the number of employees in each department
-- To answer this I need to select (display) all the required information which is departments.dept_no, dept_name, and a count of all the employees
-- listed as count(employees.emp_no) counting the unique employee number because they can not be duplicates.
-- and since we used an aggregate function we need to group by the departments.dept_no to display the unique departmnet numbers in the correct order.
-- Also everything need to be current employees so we used a where clause referencing the dept_emp table and to.date column making sure it is greater than curdate()
-- d001	Marketing	14842
-- d002	Finance	12437
-- d003	Human Resources	12898
-- d004	Production	53304
-- d005	Development	61386
-- d006	Quality Management	14546
-- d007	Sales	37701
-- d008	Research	15441
-- d009	Customer Service	17569

SELECT *
FROM salaries;

SELECT departments.dept_no, dept_name, count(employees.emp_no) AS num_employees
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > curdate()
GROUP BY departments.dept_no;

-- Question 7
-- Which department has the highest average salary?
-- In order to display one table with all the info we need for question 7 we need to join
-- 4 tables: employees, salaries, dept_emp, and departments. We can join employees and salaries with emp_no
-- then join salaries to dept_emp with emp_no
-- then join dept_emp to departments with dept_no
-- In order to display the unique department names I used a group by dept_name becasue in the select to display and average 
-- I ussed an aggregate function avg(salaries.salary) aliased as average_salary to clean up the output.
-- Also the question is asking for current employees so we used where and the to dates for both salaries and dept_emp > curdate() to make sure the results are only returning recent employees
-- Throw in a order by average_salary desc to display the highest salary first and then limiting the results to will produce the highest salary result
-- Sales	88852.9695

SELECT dept_name, AVG(salaries.salary) AS average_salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE salaries.to_date > curdate() AND dept_emp.to_date > curdate()
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Question 8 
-- Who is the highest paid employee in the Marketing department?
-- I copied the join statements from question 7 because that joined table has all the info I needed.
-- then for the selects the question needs us to display first_name, last_name, and salaries.salary
-- Then to only display the marketing department I added an additional and statement to the where clause
-- 'and dept_name = 'Marketing' 
-- then with order by salaries descending and limiting to 1 it shows highest paid in marketing
-- Akemi	Warwick	145128
SELECT first_name, last_name, salaries.salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE salaries.to_date > curdate() AND dept_emp.to_date > curdate() AND dept_name = 'Marketing'
ORDER BY salaries.salary DESC
LIMIT 1;





-- Question 9 
-- Which current department manager has the highest salary?
-- in order to gather all the information needed to answer quesiton 9 we need to join the following tables:
-- employees (for the names), salaries(for the salaries), dept_manager(to get only department managerial employees)
-- and the departments(for the department names)
-- We joined salaries to employess with emp_no
-- We joined salaries to dept_manager with emp_no
-- We joined dept_manager to departments with dept_no
-- Then we also need current employees so we will use the same where clause from all the other question answers
-- 'WHERE salaries.to_date > curdate() AND dept_manager.to_date > curdate()'
-- Then we need to select (display) first_name, last_name, salaries.salary (salary from salaries table), and departments.dept_name (department names from departments)
-- then by adding a order salary from the salaries table by desc and limiting the result to 1 it is guarenteed to show the top result answering the question.
-- Vishwani	Minakawa	106491	Marketing

SELECT first_name, last_name, salaries.salary, departments.dept_name
FROM employees 
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN dept_manager ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE salaries.to_date > curdate() AND dept_manager.to_date > curdate()
ORDER BY salaries.salary desc
LIMIT 1;




 



