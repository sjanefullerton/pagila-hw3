/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */


SELECT f3.title
FROM film AS f3
JOIN film_actor AS a3 USING (film_id)
JOIN (
    SELECT f1.film_id
    FROM film AS f1
    JOIN film_actor AS a1 USING (film_id)
    JOIN film_actor AS a2 USING (actor_id)
    JOIN film AS f2 ON (a2.film_id = f2.film_id)
    WHERE f2.title = 'AMERICAN CIRCUS'
    GROUP BY f1.film_id
) AS movies_with_shared_actors ON f3.film_id = movies_with_shared_actors.film_id
GROUP BY f3.title
HAVING COUNT(DISTINCT a3.actor_id) >= 3
ORDER BY f3.title;

