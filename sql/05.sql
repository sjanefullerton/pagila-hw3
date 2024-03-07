/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */


SELECT title FROM film
JOIN film_actor as f1 USING (film_id)
JOIN actor USING (actor_id)
JOIN film_actor as f2 USING (actor_id) 
JOIN film USING(film_id) WHERE title = 'American Circus'
ORDER BY title;
