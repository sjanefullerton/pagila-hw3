/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT customer_id, first_name, last_name 
FROM (
    SELECT customer_id, first_name, last_name, inventory_id,
    RANK() OVER(partition by customer_id ORDER BY rental_date desc)
    FROM customer
    JOIN rental USING (customer_id)) t
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN category USING (category_id) 
WHERE RANK <= 5 group by 1, 2, 3
HAVING COUNT(CASE WHEN cat.name = 'Action' THEN 1 END) >= 4
ORDER BY customer_id;



