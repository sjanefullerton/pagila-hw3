/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */

SELECT f1.title 
FROM film AS f1
JOIN film_actor AS a1 USING (film_id)
JOIN film_actor AS a2 USING (actor_id)
JOIN film AS f2 ON (a2.film_id = f2.film_id) 
WHERE f2.title = 'AMERICAN CIRCUS'
INTERSECT
SELECT f1.title 
FROM film AS f1
JOIN film_actor AS a1 USING (film_id)
JOIN film_actor AS a2 USING (actor_id)
JOIN film AS f2 ON (a2.film_id = f2.film_id) 
WHERE f2.title = 'ACADEMY DINOSAUR'
INTERSECT
SELECT f1.title 
FROM film AS f1
JOIN film_actor AS a1 USING (film_id)
JOIN film_actor AS a2 USING (actor_id)
JOIN film AS f2 ON (a2.film_id = f2.film_id) 
WHERE f2.title = 'AGENT TRUMAN'
ORDER BY title;

