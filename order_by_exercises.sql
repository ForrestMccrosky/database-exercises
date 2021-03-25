use employees;

select * 
from employees;

-- Question 2
-- The full name of the first employee on the list is Irena Reutenauer and the full name of the last person is Vidya Simmen
-- Using the same code from the where exercises to use the or statement to find the names all we have to do is add 
-- an order by statement at the end to produce 709 results in total
select first_name, last_name
from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
Order by first_name asc;

-- Question 3
-- Using the same code from question 2 and simply adding another sort by last_name with a comma produces the correct results
-- for question 3 yeilding 709 rows of employees. The full name of the first employee is Irena Acton and the full name of 
-- the last employee is Vidya Zweizig;
select first_name, last_name
from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
Order by first_name, last_name;

-- Question 4
-- The full name of the first person on this list is Irena Acton and the full name of the last person on this list 
-- is Maya Zyda. Ordering the results this way changes the last person on the list but no the first person and 
-- returns 709 results all the same as question 3
select first_name, last_name
from employees
where (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
Order by last_name, first_name;

-- Question 5 
-- 	using the emp_no and last_name we can use the order by command to sort all names that start and end in e with e%e.
-- This generates 899 results. The first employee with the lowest number is 10021 Ramzi Erde and the last employee with the largest emp_no
-- is Tadahiro Erde 499648
select emp_no, first_name, last_name
from employees 
where last_name like 'e%e'
order by emp_no;

-- Question 6
-- The amount of employees this query returns is 899. With the full name of the newest employee being Teiji Eldridge and the oldest employee
-- being Sergi Erde
select first_name, Last_name, hire_date
from employees
where last_name like 'e%e'
order by hire_date desc;

-- Question 7
-- The number of employees returned with birth dates on christmas and hired in the 90s is 362 employees. We can 
-- find this answer by using the query we wrote from the previous exercise (Question 10) and adding an Order by 
-- statement ordering the birth_date in ascending order to show the oldest and hire_date in descending to show the most recent hire
-- The full name of the first employee on the list is Khun Bernini and the name of the last employee on the list is Douadi Pettis
select first_name, last_name, hire_date, birth_date
from employees
where birth_date like '%12-25' and hire_date like '199%'
order by birth_date, hire_date desc;


