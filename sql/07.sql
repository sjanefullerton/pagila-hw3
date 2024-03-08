/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT act.first_name || ' ' || act.last_name AS "Actor Name" FROM actor act
JOIN ( SELECT fact.actor_id FROM film_actor fact
    JOIN film_actor fact2 USING (film_id)
    JOIN film_actor fact3 ON (fact2.actor_id = fact3.actor_id)
    JOIN film_actor fact4 ON (fact4.film_id = fact4.film_id)
    JOIN actor act2 ON (fact4.actor_id = act2.actor_id)
    WHERE act2.first_name = 'RUSSELL' AND act2.last_name = 'BACALL' EXCEPT
    SELECT fact.actor_id FROM film_actor fact
    JOIN film_actor fact2 USING (film_id)
    JOIN actor act2 ON (fact2.actor_id = act2.actor_id)
    WHERE act2.first_name = 'RUSSELL' AND act2.last_name = 'BACALL'
) joined USING (actor_id) ORDER BY 1;
