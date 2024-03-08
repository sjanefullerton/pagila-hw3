/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT cid.customer_id, cid.first_name, cid.last_name 
FROM customer AS cid 
LEFT JOIN lateral (
    SELECT COUNT(*) AS ac  
    FROM (
        SELECT f.film_id 
        FROM rental rent
        JOIN inventory inv ON (rent.inventory_id = inv.inventory_id)
        JOIN film f ON (inv.film_id = f.film_id)
        JOIN film_category fcat ON (f.film_id = fcat.film_id)
        JOIN category cat ON (fcat.category_id = cat.category_id)
        WHERE rent.customer_id = cid.customer_id AND cat.name = 'Action'
        ORDER BY rent.rental_date DESC
        LIMIT 5
    ) AS rents
) AS am ON true
GROUP BY cid.customer_id
HAVING COALESCE(am.ac, 0) >= 4;

