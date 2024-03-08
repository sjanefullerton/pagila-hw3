/*
 * The film 'BUCKET BROTHERHOOD' is your favorite movie, but you're tired of watching it.
 * You want to find something new to watch that is still similar to 'BUCKET BROTHERHOOD'.
 * To find a similar movie, you decide to search the history of movies that other people have rented.
 * Your idea is that if a lot of people have rented both 'BUCKET BROTHERHOOD' and movie X,
 * then movie X must be similar and something you'd like to watch too.
 * Your goal is to create a SQL query that finds movie X.
 * Specifically, write a SQL query that returns all films that have been rented by at least 3 customers who have also rented 'BUCKET BROTHERHOOD'.
 *
 * HINT:
 * This query is very similar to the query from problem 06,
 * but you will have to use joins to connect the rental table to the film table.
 *
 * HINT:
 * If your query is *almost* getting the same results as mine, but off by 1-2 entries, ensure that:
 * 1. You are not including 'BUCKET BROTHERHOOD' in the output.
 * 2. Some customers have rented movies multiple times.
 *    Ensure that you are not counting a customer that has rented a movie twice as 2 separate customers renting the movie.
 *    I did this by using the SELECT DISTINCT clause.
 */

SELECT film.film_id, film.title
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE film.film_id <> (
    SELECT film_id FROM film WHERE title = 'BUCKET BROTHERHOOD'
)
AND film.film_id IN (
    SELECT inventory.film_id
    FROM inventory
    JOIN rental r2 ON inventory.inventory_id = r2.inventory_id
    JOIN customer c2 ON r2.customer_id = c2.customer_id
    WHERE c2.customer_id IN (
        SELECT customer_id
        FROM rental r3
        JOIN inventory i3 ON r3.inventory_id = i3.inventory_id
        JOIN film f3 ON i3.film_id = f3.film_id
        WHERE f3.title = 'BUCKET BROTHERHOOD'
    )
    AND film.title <> 'BUCKET BROTHERHOOD' -- Ensure 'BUCKET BROTHERHOOD' is not counted
)
GROUP BY film.film_id, film.title
HAVING COUNT(DISTINCT customer.customer_id) >= 3;


