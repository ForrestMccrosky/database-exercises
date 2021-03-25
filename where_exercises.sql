-- Selecting the employees database to work with for this exercise
use employees;

-- Viewing the full table to look at column names and results
Select *
from employees;

-- Question 2
-- This code below using the in command within the where clause displays all previous and current
-- employees with the first names Irena, Vidya. and Maya displaying 709 results
select first_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya');

-- Question 3 
-- Using the same idea as the previous question this code displays the same results (709 results), however, this 
-- code uses or method with the first_name column instead 
select first_name
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';

--  Question 4
-- Below we are using the same method as number 3 (using the or method) to find everyone with 
-- the names Irena,
-- Vidya, and Maya but we also want to find out who is a male. Therefore we will use the and
-- method after the or's because we want to find out who is also male making both statements 
-- need to be true. (441 rows displayed)
select first_name, gender
from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
	and gender = 'M';
	
-- Question 5 
-- Using the where clause and like command we can easily see which employees have last names 
-- beggining with e by using e% (7330 rows displayed)
select last_name
from employees
where last_name like 'E%';

-- Question 6
-- For question number 6 we can do the same as above however, this time we will use like %e 
-- becasue we want employees whose last names end in e (displays 24292 results)
select last_name
from employees 
where last_name like '%E';
-- And for the first part of the question we want employees whose last names starts or 
-- ends with e so using the or method and like e% with %e will display all of the employees 
-- meeting this criteria (30723 results).
select last_name
from employees
where last_name like 'E%' or last_name like '%E';

-- Question 7
-- Here we need to display the number of employees that have last names that start and 
-- end with the letter e. The keyword here is and unlike before in question 6 where you 
-- used the or method. By using the and method it will require both statements to be true yielding 
-- us the correct reulsts (899 rows displayed)
select first_name, last_name
from employees
where last_name like 'E%' and last_name like '%E';

-- Question 8
-- To find all the employees hired in the 90s we can use the like command within 
-- a where clause. we know the column name for this criteria is hire_date so by using the like 
--199% command will display any hiring date that begins with 199 with would contain all 
-- the 90s (135214 displayed rows).
select last_name, hire_date
from employees
where hire_date like '199%';

-- Question 9
-- Same thing as above we need to find out who was born on christmas which is 12-25. Therefore 
-- using the birth_date column name we can do a where birth_date like %12-25 because the date is 
-- formatted with the year first. This will yield any employee whose birth_date ends in 12-25 being 
-- christmas (842 rows displayed)
select last_name, birth_date
from employees
where birth_date like '%12-25';

-- Question 10
-- This question is asking us to combine questions 8 and 9 using an and statemnt to 
-- generate results of employees who were hired in the 90s and born on christmas. by combing the like statements within one where clause using an and 
-- because bothe statements need to be true yields the correct results here (362 rows displayed)
select last_name, hire_date, birth_date
from employees
where birth_date like '%12-25' and hire_date like '199%';

-- Question 11
-- Using a simple like command within a where clause will help us generate all employees whose last 
-- name contains a q. 
-- Since we are looking for contains (keyword) we will use like %q%, yielding 1873 rows displayed.
select first_name, last_name
from employees
where last_name like '%q%';

-- Question 12
-- Here we want to find the number of employees whose last name contains a q but does not contain a qu
-- This one is a little trickier because we had to google this and find out that there is also a not like 
-- command for where clasues so by using the original like to find the names with q's inside. We can
-- use and not like to eliminate any names containing qu (displays 547 results)
select first_name, last_name
from employees
where last_name like '%q%' and last_name not like '%qu%';





