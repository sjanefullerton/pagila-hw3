/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */

SELECT f1.title FROM film f1
JOIN film_actor a1 USING (film_id)
JOIN actor AS actor USING (actor_id)
JOIN film_actor a2 USING (actor_id)
JOIN film f2 ON (f2.film_id = a2.film_id)
WHERE f1.title IN ('AMERICAN CIRCUS', 'ACADEMY DINOSAUR', 'AGENT TRUMAN')
GROUP BY f2.title
HAVING COUNT(f2.title) >= 3
ORDER BY f2.title;



