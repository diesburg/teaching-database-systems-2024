USE sakila;

SHOW columns FROM customer_list;

SELECT ID, name FROM customer_list;

SELECT ID, name FROM customer_list WHERE ID >=1 AND ID <=100;

SELECT ID, name FROM customer_list WHERE ID BETWEEN 1 AND 100;

SELECT name FROM customer_list WHERE name LIKE 'ANNA%';

SELECT name FROM customer_list WHERE name LIKE 'ANN_%';

-- How can I find all 'Andy' / 'Andrew' varients?
SELECT name from customer_list WHERE name LIKE 'AND_%';

-- DISTINCT: List distinct cities

SELECT DISTINCT country FROM customer_list;

-- When selecting names, what if we want them in alphabetical order?

SELECT name FROM customer_list WHERE name LIKE 'A%' ORDER BY name ASC;

SELECT name FROM customer_list ORDER BY name ASC;



