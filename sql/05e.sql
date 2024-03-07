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



SELECT f.title
FROM film AS f
JOIN film_category AS fc1 USING (film_id)
JOIN film_category AS fc2 USING (category_id)
JOIN (
    SELECT fc.film_id
    FROM film_category AS fc
    JOIN film ON fc.film_id = film.film_id
    JOIN category ON fc.category_id = category.category_id
    WHERE category.name = 'AMERICAN CIRCUS'
) AS american_circus_categories ON fc1.film_id = american_circus_categories.film_id
WHERE fc2.film_id != american_circus_categories.film_id
GROUP BY f.title
HAVING COUNT(DISTINCT fc2.category_id) >= 2
ORDER BY f.title;

