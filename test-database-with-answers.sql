-- This script is a sample script that creates a test
-- database, creates a sample customer table, and inserts
-- values into it.
--
-- To play with this new database, run this script, then
-- open up a second SQL query tab to attempt various
-- SELECT, ALTER TABLE, INSERT, UPDATE, and DELETE rows 

-- This script is meant to be run one statement at a time.
-- To do that, highlight a statement and click the lightning bolt
-- button WITH the cursor.  Clicking the other lightning bolt button
-- will cause the whole script to run top-to-bottom.

-- Don't delete this for now
SET SQL_SAFE_UPDATES = 0;

-- Set up
CREATE DATABASE test;
USE test;

-- Creating a Customer table with an unsigned 
-- integer ID, Name column as a variable-length 
-- string of 30, a decimal Balance column with
-- the largest possible value as 99999999.99, and 
-- a Payment column with the largest possible value
-- as 99999999.99 . 

-- **Note: Let's make ID and Name NOT NULL
-- **Note: Let's make the default payment be zero.

CREATE TABLE Customer (
ID	INT Unsigned NOT NULL,
Name VARCHAR(30) NOT NULL,
Balance DECIMAL(10,2),
Payment DECIMAL(10,2) DEFAULT 0);

-- Inserting values into the Customer table. 

INSERT INTO Customer (ID, Name, Balance, Payment)
VALUES 
(193,'Chen',2100,300),
(584,'Ravindran',500,250),
(231, 'Bolt', 300, 10);

-- Note that we leave out Payment in this insert statement.
-- That means Payment will have the default value of 0
-- for Gomez.

INSERT INTO Customer (ID, Name, Balance)
VALUES 
(608, 'Gomez', 950);

-- Let's also add a customer with NULL values.  It turns out
-- if we don't specifiy the column names, we'll use the order
-- of the columns in the CREATE statement.

INSERT INTO Customer 
VALUES 
(900, 'Diesburg', NULL, NULL);

-- Let's verify.  Is Diesburg in there?

SELECT * from Customer;

-- Questions Section -- 

-- How can I update Diesburg's balance to 5000.00?

UPDATE Customer
SET Balance = 5000.00
WHERE ID = 900;

-- Can you write a SELECT query to display 2 things:
-- 1. The name of each customer
-- 2. How much each customer owes after subtracting the next payment
-- Finally, will the customer Diesburg show up in this table?  Why/why not?

SELECT Name, Balance-Payment
FROM Customer
WHERE Payment IS NOT NULL;

-- Shoot.  We need to add a person with a name larger than 30 characters in the future.
-- Can you alter the table to expand the Name column to 80 characters?

ALTER TABLE Customer 
CHANGE Name Name VARCHAR(80);

-- Maybe people have first names, too.  Add a new
-- Firstname column with a VARCHAR(80) datatype?

ALTER TABLE Customer
ADD Firstname VARCHAR(80);

-- It turns out Bolt paid their balance off.  Write a statement to remove their
-- row from the table.

DELETE FROM Customer
WHERE Name = 'Bolt';

-- The company is feeling generous!  Write a statement to remove all rows from the
-- table that have a balance under 1000 or their payment is 0.

DELETE FROM Customer
WHERE balance < 1000 OR Payment = 0;

-- We don't have many customers remaining.  Can you write a statement that removes
-- all the rows?

DELETE from Customer;
-- or
TRUNCATE TABLE Customer;

-- Okay, how do we just delete the table?
DROP Table Customer;

-- How do we delete the test database?
DROP DATABASE Test;

-- This is equivalent to:
-- DROP SCHEMA Test;

