/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */

SELECT t.name, t.title, t.count AS "total rentals" FROM category c
JOIN LATERAL (
    SELECT COUNT(rental_id) AS count, title, name FROM rental
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
    JOIN film_category USING (film_id)
    JOIN category cat USING (category_id)
    WHERE category_id = c.category_id
    GROUP BY title, name 
    ORDER BY COUNT(rental_id) DESC, title DESC LIMIT 5) t ON TRUE
ORDER BY name, count DESC, title;
