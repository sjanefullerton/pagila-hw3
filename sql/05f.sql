/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */

SELECT film2.title FROM film film1
JOIN film_actor fact ON (film1.film_id = fact.film_id)
JOIN actor ON (fact.actor_id = actor.actor_id)
JOIN film_actor fact2 ON (actor.actor_id = fact2.actor_id)
JOIN film film2 ON (film2.film_id = fact2.film_id) WHERE film1.title LIKE 'AMERICAN CIRCUS'
INTERSECT
SELECT DISTINCT title FROM film
JOIN film_category fcat USING(film_id)
JOIN film_category fcat2 USING(category_id)
JOIN ( SELECT film_id FROM film WHERE title LIKE 'AMERICAN CIRCUS'
) as t ON fact2.film_id = t.film_id
GROUP BY title 
HAVING COUNT(DISTINCT category_id) = 2 UNION ALL SELECT 'AMERICAN CIRCUS' AS title
ORDER BY title;





