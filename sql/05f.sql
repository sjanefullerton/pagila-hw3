/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */

SELECT f.title
FROM film AS f
JOIN film_actor AS fa USING (film_id)
JOIN actor AS a ON fa.actor_id = a.actor_id
JOIN film_category AS fc USING (film_id)
JOIN (
    SELECT film_id
    FROM film_category
    JOIN category ON film_category.category_id = category.category_id
    WHERE category.name = 'AMERICAN CIRCUS'
) AS ac ON fc.film_id = ac.film_id
WHERE f.film_id != ac.film_id
GROUP BY f.title
HAVING COUNT(DISTINCT fc.category_id) = 2
   AND COUNT(DISTINCT fa.actor_id) = 1
ORDER BY f.title;

