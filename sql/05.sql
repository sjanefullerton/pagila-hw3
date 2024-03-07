/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT title FROM film AS f1
JOIN film_actor AS f2 ON (f1.film_id = f2.film_id)
JOIN actor USING (actor_id)
JOIN film_actor AS f3 ON (actor.actor_id = f3.actor_id)
JOIN film AS f4 USING (film_id) 
WHERE f1.title = 'American Circus'
ORDER BY title;
