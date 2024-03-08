/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */

SELECT f.title FROM film f
JOIN film_actor fa USING (film_id)
JOIN film_actor a ON (fa.actor_id = a.actor_id)
JOIN film ff ON (a.film_id = ff.film_id)
WHERE ff.title = 'AMERICAN CIRCUS'
INTERSECT
SELECT f.title FROM film f
JOIN film_category fc USING (film_id)
JOIN film_category fcc ON (fc.category_id = fcc.category_id)
JOIN film ff ON (fcc.film_id = ff.film_id) WHERE ff.title = 'AMERICAN CIRCUS'
GROUP BY f.title 
HAVING COUNT(DISTINCT f.title) >= 2;

