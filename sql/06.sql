/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT a1.first_name || ' ' || a1.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a2.actor_id IN (
        SELECT actor_id FROM actor
        WHERE first_name = 'RUSSELL' and last_name = 'BACALL'
    )
AND a1.actor_id NOT IN (
        SELECT actor_id FROM actor
        WHERE first_name = 'RUSSELL' and last_name = 'BACALL'
    )
AND a1.actor_id NOT IN (
        SELECT a3.actor_id FROM actor a3
        JOIN film_actor fa3 ON a3.actor_id = fa3.actor_id
        JOIN film_actor fa4 ON fa3.film_id = fa4.film_id
        JOIN actor a4 ON fa4.actor_id = a4.actor_id
        WHERE a4.actor_id IN (
                SELECT actor_id FROM actor
                WHERE first_name = 'RUSSELL' and last_name = 'BACALL'
            )
    )
AND a1.actor_id NOT IN (
        SELECT actor_id FROM actor
        WHERE first_name = 'RUSSELL' and last_name = 'BACALL'
    )
ORDER BY "Actor Name";




