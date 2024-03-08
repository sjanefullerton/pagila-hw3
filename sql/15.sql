/*
 * Find every documentary film that is rated G.
 * Report the title and the actors.
 *
 * HINT:
 * Getting the formatting right on this query can be tricky.
 * You are welcome to try to manually get the correct formatting.
 * But there is also a view in the database that contains the correct formatting,
 * and you can SELECT from that VIEW instead of constructing the entire query manually.
 */

SELECT title, STRING_AGG(INITCAP(first_name) || INITCAP(last_name), ', ') AS actors 
FROM actor
JOIN film_actor USING (actor_id) JOIN film USING (film_id) JOIN film_category USING (category_id) WHERE name = 'Documentary' AND rating = 'G'
GROUP BY 1;



