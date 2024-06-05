-- Section 3_4 Joins Practice
-- Mmmmmm, steaks and ice cream.

create database schwans;
use schwans;

create table Employee (
	id smallint unsigned,
    name varchar(40),
    city varchar(80),
    commission decimal(3,2),
    primary key(id));
    
create table Customer (
	id smallint unsigned,
    name varchar(40),
    city varchar(80),
    sales_id smallint unsigned,
    primary key(id),
    foreign key(sales_id) references Employee(ID));
    
insert into Employee
values
(5001, 'James Houtz', 'Cedar Rapids', 0.15),
(5002, 'Kate Knite', 'Des Moines', 0.13),
(5003, 'Alex Pit', NULL, 0.11);

insert into Customer
values
(3002, 'Sam Snead', 'Iowa City', 5001),
(3003, 'Sarah Diesburg', 'Cedar Falls', 5001),
(3004, 'Julian Green', 'Omaha', 5002),
(3005, 'Bob Weber', 'Cedar Rapids', NULL);


-- Write a query to find star employees!  Use an inner join
-- to create a result table of employee.name to count of customers.
-- Next, filter that table to only include employees with two
-- or more customers.

SELECT Employee.name, COUNT(*)
FROM Employee
INNER JOIN Customer
ON Employee.id = Customer.sales_id
GROUP BY Employee.name
HAVING COUNT(*) > 1;

-- Now that we have written a query to find star performers, write
-- a query to find the empolyees with no customers.  Use a join to
-- create a table of employee.name to customer.name that includes
-- employees with NULL customers.  Then filter the result to only
-- display the employee where the customer.name is NULL

SELECT Employee.name, Customer.name
FROM Employee
LEFT JOIN Customer
ON Employee.id = Customer.sales_id
WHERE Customer.name is NULL;