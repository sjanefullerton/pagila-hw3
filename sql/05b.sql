/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */

SELECT DISTINCT f1.title 
FROM film AS f1
JOIN film_actor AS a1 USING (film_id)
JOIN film_actor AS a2 ON a1.actor_id = a2.actor_id
JOIN film AS f2 ON a2.film_id = f2.film_id
WHERE f2.title = 'AMERICAN CIRCUS'
GROUP BY f1.title
HAVING COUNT(DISTINCT a1.actor_id) >= 2
ORDER BY f1.title;


