USE sakila;

-- Let's do something basic and play with the customer table.

-- What does the table look like?
SHOW columns 
FROM customer;

-- Let's get the customer_id, first_name, and last_name
SELECT customer_id, first_name, last_name 
FROM customer;

-- We are looking for a customer who has a last name of
-- Smith or Jones.  Can we use an IN clause to do that?
SELECT customer_id, first_name, last_name 
FROM customer
WHERE last_name IN ('Smith', 'Jones');

-- Can we narrow down the ID numbers 1 to 100?
SELECT customer_id, first_name, last_name FROM customer 
WHERE ID >=1 AND ID <=100;

SELECT customer_id, first_name, last_name FROM customer
WHERE ID BETWEEN 1 AND 100;

-- We are looking for someone who has a first name start with 
-- ANNA or ANNE. Can we use the LIKE clause to find her?
SELECT first_name, last_name FROM customer
WHERE first_name LIKE 'ANN_';

-- Ok, that wasn't it.  How about finding all names that
-- start with ANN?
SELECT first_name, last_name FROM customer 
WHERE first_name LIKE 'ANN%';

-- How can I find all 'Andy' / 'Andrew' varients? Do not
-- allow AND as a match.
SELECT first_name, last_name from customer 
WHERE first_name LIKE 'AND_%';

-- DISTINCT: List distinct cities

-- How many stores do we have?
SELECT store_ID from customer;

-- Can we get just unique store numbers?
SELECT DISTINCT store_ID FROM customer;

-- When selecting last names that start with A, what if we 
-- want them in alphabetical order?

SELECT first_name, last_name FROM customer WHERE 
last_name LIKE 'A%' 
ORDER BY last_name ASC;





