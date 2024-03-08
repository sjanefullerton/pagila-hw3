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

SELECT title, string_agg(concat(INITCAP(split_part(first_name, ' ', 1)), INITCAP(split_part(last_name, ' ', 1))), ', ') AS actors FROM film
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
JOIN film_category ON (film.film_id=film_category.film_id)
JOIN category USING(category_id)
WHERE CAST(rating as text) LIKE 'G' AND name LIKE 'Documentary'
group by 1;



