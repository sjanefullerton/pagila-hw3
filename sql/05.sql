/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT f1.title FROM film f1
JOIN film_actor a1 USING (film_id)
JOIN film_actor a2 USING (actor_id)
JOIN film f2 ON (a2.film_id = f2.film_id) 
WHERE f2.title = 'AMERICAN CIRCUS'
ORDER BY title;


