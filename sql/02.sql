/*
 * Compute the country with the most customers in it. 
 */

SELECT country FROM customer 
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country ORDER BY COUNT(customer_id) DESC
FETCH FIRST 1 ROWS ONLY;
