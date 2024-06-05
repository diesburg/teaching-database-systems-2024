-- This script is a sample script that creates a test
-- database, creates a sample customer table, and inserts
-- values into it.
--
-- To play with this new database, run this script, then
-- open up a second SQL query tab to attempt various
-- SELECT, ALTER TABLE, INSERT, UPDATE, and DELETE rows 

-- To delete this database and start over, right click on the
-- test database and select 'DROP SCHEMA'.



CREATE DATABASE test;

USE test;

-- Creating a Customer table. Note Payment has a default
-- value of 0.

CREATE TABLE Customer (
ID	INT Unsigned,
Name VARCHAR(30),
Balance DECIMAL(10,2),
Payment DECIMAL(10,2) DEFAULT 0);

-- Inserting values into the Customer table. 

INSERT INTO Customer (ID, Name, Balance, Payment)
VALUES 
(193,'Chen',2100,300),
(584,'Ravindran',5000,250),
(231, 'Bolt', 300, 10);

-- Note that we leave out Payment in this insert statement.
-- That means Payment will have the default value of 0
-- for Gomez.

INSERT INTO Customer (ID, Name, Balance)
VALUES 
(608, 'Gomez', 950);
