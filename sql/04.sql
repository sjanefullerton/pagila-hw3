/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */

SELECT first_name, last_name FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM actor
    WHERE film_id IN (
        SELECT film_id
        FROM film
        WHERE category = 'Children'
    )
)
AND actor_id NOT IN (
    SELECT actor_id
    FROM actor
    WHERE film_id IN (
        SELECT film_id
        FROM film
        WHERE category = 'Horror'
    )
);


