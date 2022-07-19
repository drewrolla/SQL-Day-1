-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 2 actors
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
-- 4764 payments between $3.99 and $5.99
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- 3. What film does the store have the most of? (search in inventory)
-- Curtain Videotape, film_id is 200
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

SELECT title
FROM film
WHERE film_id = 200;

SELECT * FROM inventory;


-- 4. How many customers have the last name ‘William’?
-- 0 customers
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';


-- 5. What store employee (get the id) sold the most rentals?
-- Store Employee ID 1
SELECT staff_id, count(rental_id)
FROM rental
GROUP BY staff_id;

-- 6. How many different district names are there?
-- 378 different names
SELECT COUNT(DISTINCT district)
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- film_id is 508 - Lambs Cincinatti
SELECT film_id, COUNT(film_id) -- actually unsure about this one, did I calculate how many times the film shows up instead?
FROM film_actor
GROUP BY film_id
ORDER BY COUNT DESC;

SELECT title
FROM film
WHERE film_id = 508;

SELECT * FROM film_actor;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 13 customers
SELECT last_name, store_id
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

SELECT store_id, last_name
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 3 payment amounts

--old code
-- SELECT amount, rental_id, customer_id
-- FROM payment
-- WHERE customer_id BETWEEN 380 AND 430
-- GROUP BY amount
-- HAVING rental_id > 250;

SELECT amount, COUNT(rental_id) -- how come when i removed customer_id it worked?
FROM payment
WHERE payment.customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
-- There are 5 ratings, PG13 has the most
SELECT rating, COUNT(rating), COUNT(DISTINCT rating)
FROM film
GROUP BY rating;

