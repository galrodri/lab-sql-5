-- Lab SQL Queries: Part 5
-- Question 1: Drop column picture from Staff table
select distinct *
from sakila.staff

alter table staff
drop column picture

select distinct *
from sakila.staff


-- Question 2: Update database with new hire
select distinct *
from sakila.customer
where first_name = 'TAMMY'
 and last_name = 'SANDERS';

insert into staff values(3, "Tammy", "Sanders", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1, "Tammy", password=NULL, now());

select distinct *
from sakila.staff


-- Question 3: Add rental for movie "Academy Dinosaur". 
-- First I check the values in the different tables and then I insert values in the rental table

SELECT DISTINCT *
from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

SELECT DISTINCT *
from sakila.film
where title = 'ACADEMY DINOSAUR';

SELECT DISTINCT *
FROM sakila.inventory
WHERE film_id = 1
AND store_id = 1;

SELECT DISTINCT *
FROM sakila.staff
WHERE first_name = "Mike";

SELECT DISTINCT *
FROM sakila.rental
ORDER BY rental_id DESC
LIMIT 1;

INSERT INTO rental VALUES (16050, now(), 1, 130, return_date = null, 1, now());

SELECT DISTINCT *
FROM sakila.rental
ORDER BY rental_id DESC
LIMIT 1;


-- Question 4: Delete non-active users
# Check if there are any non-active users
SELECT DISTINCT *
FROM sakila.customer
WHERE active = 0;

# Create a table backup and insert non active users in the table
CREATE TABLE deleted_users
	AS (SELECT *
		FROM customer
		WHERE active = 0);

SELECT DISTINCT *
FROM deleted_users;

# Delete the non active users from the table customer
DELETE FROM sakila.customer
WHERE active = 0;

SELECT DISTINCT *
FROM customer
WHERE active = 0;