-- Script to get the datediff of last 2 purchase dates for a 
-- customer ID.  Use this to demonstrate using subqueries.
-- Futher, this is an example of a correlated query.
--
-- Try customer_id = 2 for 1 day difference
-- Try customer_id = 215 for 175 days difference

USE sakila;

select datediff(max(payment_date), min(payment_date)) as days_between, a.customer_id
from (
	SELECT payment_date, customer_id
	FROM payment
	WHERE customer_id = 2
	ORDER BY payment_date DESC
	LIMIT 2) as a;
