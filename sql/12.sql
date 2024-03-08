/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT DISTINCT cmer.customer_id, cmer.first_name, cmer.last_name FROM customer cmer LEFT JOIN lateral (
    SELECT rental_id, rental_date, inventory_id, name FROM rental
    JOIN inventory USING (inventory_id)
    JOIN film_category USING (film_id)
    JOIN category cat USING (category_id)
    WHERE customer_Id = cmer.customer_id
    ORDER BY rental_date DESC ) AS t ON true
WHERE t.name = 'Action'
GROUP BY cmer.customer_id
HAVING COUNT(cmer.customer_id) >= 4;


