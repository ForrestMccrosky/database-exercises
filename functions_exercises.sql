USE employees;

SELECT * FROM employees;


-- Question 2
-- using the concat function with select will combine the two column first name and last name into
-- one neat column. And using AS also known as the alias function allows us to 
-- rename the new column we are concat'ing to full_name and the where statement finds the 
-- employees whose last names start and end with e using the wildcard 'e%e'
SELECT Concat(first_name,' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE ('e%e');

-- Question 3
-- Completely copying our code from above for question 3 because the only difference
-- is we want everything to be uppercase. So we can simply add the Upper function
-- at the begginning of our select with paranthesis to display everything as uppercase lettering
-- to correctly perform question 3
SELECT Upper(Concat(first_name,' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE ('e%e');

-- Question 4 
-- For question 4 I started off with the select all and created my where function first.
-- this allowed me to all employees who were born on christmas using like %12-25 and all employees 
-- who were also hired in the 90s using and like 199%
-- To answer the question after select * I used the datediff function by subtracting the curdate from hire date and named it as 
--Days worked using the AS
SELECT *, datediff(curdate(),hire_date) AS 'Days_Worked'
FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date LIKE '199%';

-- Question 5
-- Question 5 is pretty simple to find all the current employees we can look and see that in to_date
-- all current employees have their year set to 9999 so using where to_date like 9999% this pulls
-- all the current employees and in our select statement we can simply use select min(salary) and select max(salary)
-- to get a minimum of 38623 and a maximum of 158220
SELECT min(salary)
FROM salaries;

SELECT max(salary)
FROM salaries
WHERE to_date LIKE '9999%';

SELECT min(salary)
FROM salaries
WHERE to_date LIKE '9999%';

SELECT max(salary)
FROM salaries;

-- Question 6
-- For number 6 it is a simple yet complex select statement involving several substrings with a main Concat function to display the correct content for the new column we aliased
-- as username and also using a prefixed Lower function to generate eveything in a lowercase letter format with the '_' added to the concat to display the correct username format.
SELECT *, Lower(Concat(Substr(first_name,1,1),Substr(last_name,1,4),'_', Substr(birth_date,6,2),substr(birth_date,3,2))) AS username 
FROM employees;

