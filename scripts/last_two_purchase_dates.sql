-- Script to get the last 2 purchase dates for a customer ID
--
-- Try customer_id = 2 for 1 day difference
-- Try customer_id = 215 for 175 days difference

USE sakila;

SELECT payment_date
FROM payment
WHERE customer_id = 2
ORDER BY payment_date DESC
LIMIT 2
;