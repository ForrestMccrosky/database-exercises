

SELECT *
FROM titles;

-- Question 2
-- By selecting the title column with distinct we can see that there our only 7 unique title names
-- in the titles table
SELECT DISTINCT title
FROM titles;

-- Question 3
-- By selecting the last_name column from employees we can use the where clause and like with the wildcard
-- 'e%e' to find all names. Then we can use the group by last_name to display all the unique last names 
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- Question 4
-- Question 4 is asking for the same thing as question 3 but wants to add the first name column. This is easily done
-- by adding the first_name column to our select statement and to our group by statement.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e' 
GROUP BY first_name, last_name;

-- Question 5
-- By selecting the last name column from employees and using the where clause with like '%q%' 
-- to display ANY NAMES WITH a q AND NOT LIKE '%qu%' TO exclude ANY NAMES that include qu. 
-- Then finally we use group by last_name to display only the unique results 
-- These names are Chleq, Lindqvist, and Qiwen
SELECT last_name
FROM employees 
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Question 6 
-- For question 6 to get an easy count of all the people that share a unique last name with a q but not a qu 
-- we can simply add the count(last_name) to the select statement and then use order by count(last_name) to show the 
-- count of names in a ascending order.

SELECT last_name, count(last_name)
FROM employees 
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY count(last_name);

-- However, if we wanted to go more in depth and see which people share the same first name with the same unique last name we can display the first name in our select and also add it to the group by and order by statements
-- to generate a desceding count of people that share the same unique last name and first names
SELECT first_name, last_name, count(last_name)
FROM employees 
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY first_name, last_name
ORDER BY count(last_name) DESC;



-- Question 7
SELECT *
FROM employees;

SELECT gender, first_name, count(first_name)
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
GROUP BY gender, first_name;

-- Question 8 
-- using the large string we used to generate the lowercase usernames we can select the usernames with the large concat with substrings. Then selecting the count with the same concat and 
-- rename this as count to clean up the output. Then since we have a new column aliased as username in the select statement we can use grop by usernames
-- and order by username to generate all the duplicate usernames by also using a having statement to filter all 
-- the usernames with a count of 1 because if they have a count of 1 they are not duplicates

SELECT Lower(Concat(Substr(first_name,1,1),Substr(last_name,1,4),'_', Substr(birth_date,6,2), Substr(birth_date,3,2))) AS username,
count(Lower(Concat(Substr(first_name,1,1),Substr(last_name,1,4),'_', Substr(birth_date,6,2),Substr(birth_date,3,2)))) AS count
FROM employees
GROUP BY username 
HAVING count > 1
ORDER BY count(username) DESC;






