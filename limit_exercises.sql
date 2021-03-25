use employees;

select *
from employees;



-- Question 2 
-- The last 10 distinct names in descneding order are 
-- Zykh
-- Zyda
-- Zwicker
-- Zweizig
-- Zumaque
-- Zultner
-- Zucker
-- Zuberek
-- Zschoche
-- Zongker
Select distinct last_name
from employees
order by last_name desc
Limit 10;

-- Question 3
-- The first five records of the employess born in the 90s and on christmas:
-- Alselm Cappello
-- Utz Mandell
-- Bouchung Schreiter
-- Baocai Kushner
-- Petter Stroustrup 
select *
from employees 
where hire_date like '199%' and birth_date like '%12-25'
order by hire_date
limit 5;

-- Question 4 
-- The results for question 4 using the offset of 45 with a limit of 5 are shown below
-- 463558	1963-12-25	Pranay	Narwekar	F	1990-07-18
-- 444269	1963-12-25	Marjo	Farrow	F	1990-07-18
-- 291662	1962-12-25	Ennio	Karcich	M	1990-08-05
-- 413687	1954-12-25	Dines	Lubachevsky	F	1990-08-06
-- 416525	1952-12-25	Ipke	Fontan	M	1990-08-06
select *
from employees 
where hire_date like '199%' and birth_date like '%12-25'
order by hire_date
limit 5 offset 45;

-- The relationship between offset and limit is offset is a subfunction of limit that can not run on its own
-- and when used it sets a different start point for the query to display based on the parameters the programmer
-- chooses for limit and offset. For example above in question 4 we have chosen to display 5 results with the limit
-- and start the data set 50 above the original data origin.