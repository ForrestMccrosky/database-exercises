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
-- The results for question 4 using the offset of 50 with a limit of 5 are shown below
-- 231580	1957-12-25	Christophe Baca	    F	1990-08-11
-- 275621	1961-12-25	Moie	Birsak	       M	1990-08-11
-- 494492	1957-12-25	Chikako	Ibel	   F	1990-08-12
-- 48396	1955-12-25	Shounak	Jansen 	M	1990-08-13
-- 17351	1961-12-25	Zhigen	Boissier	   M	1990-08-18
select *
from employees 
where hire_date like '199%' and birth_date like '%12-25'
order by hire_date
limit 5 offset 50;

-- The relationship between offset and limit is offset is a subfunction of limit that can not run on its own
-- and when used it sets a different start point for the query to display based on the parameters the programmer
-- chooses for limit and offset. For example above in question 4 we have chosen to display 5 results with the limit
-- and start the data set 50 above the original data origin.