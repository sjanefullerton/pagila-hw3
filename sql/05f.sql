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
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id IN (
    SELECT fc.film_id
    FROM film_category fc
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name IN ('AMERICAN CIRCUS')
)
AND f.film_id IN (
    SELECT fc.film_id
    FROM film_category fc
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name IN ('AMERICAN CIRCUS')
)
GROUP BY f.title
HAVING COUNT(DISTINCT f.film_id) = 2
AND COUNT(DISTINCT fa.actor_id) = 1;

