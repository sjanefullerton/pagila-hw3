/* 
 * You've decided that you don't actually like ACADEMY DINOSAUR and AGENT TRUMAN,
 * and want to focus on more movies that are similar to AMERICAN CIRCUS.
 * This time, however, you don't want to focus only on movies with similar actors.
 * You want to consider instead movies that have similar categories.
 *
 * Write a SQL query that lists all of the movies that share 2 categories with AMERICAN CIRCUS.
 * Order the results alphabetically.
 *
 * NOTE:
 * Recall that the following query lists the categories for the movie AMERICAN CIRCUS:
 * ```
 * SELECT name
 * FROM category
 * JOIN film_category USING (category_id)
 * JOIN film USING (film_id)
 * WHERE title = 'AMERICAN CIRCUS';
 * ```
 * This problem should be solved by a self join on the "film_category" table.
 */

SELECT title FROM (
    SELECT fii.title, COUNT(fii.title) AS count FROM film fi
    JOIN film_category AS c1 ON (c1.film_id = fi.film_id)
    JOIN film_category AS c2 ON (c1.film_id = c2.film_id)
    JOIN film fii ON (fii.film_id = c2.film_id)
    WHERE fi.title = 'AMERICAN CIRCUS'
    GROUP BY fii.title
) titles
WHERE count >= 2
ORDER BY title;




SELECT f.title FROM (
    SELECT f2.title , COUNT(f2.title) AS "count" FROM film f
    JOIN film_category AS fc1 ON (fc1.film_id = f.film_id)
    JOIN film_category AS fc2 USING (category_id)
    JOIN film f2 ON (f2.film_id = fc2.film_id)
    WHERE f.title = 'AMERICAN CIRCUS'
    GROUP BY f2.title 
) selected
HAVING "count" >= 2
ORDER BY f.title;


