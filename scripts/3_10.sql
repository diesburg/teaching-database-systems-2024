-- Let's play with the Auto table to explore subqueries.

create database cars;
use cars;
create table Auto (
	ID	smallint unsigned auto_increment,
    Make varchar(30) not null,
    Model varchar(30) not null,
    Type varchar(15) check (Type in ('sedan','crossover','compact','suv')),
    Year int unsigned not null,
    Price decimal(7,2) not null,
    PRIMARY KEY(ID));

insert into Auto (Make,Model,Type,Year,Price)
values
('Toyota',	'Camry',	'sedan',	2015,	9800),
('Ford', 'Escape',	'crossover',	2015,	15900),
('Honda',	'Civic',	'sedan',	2016,	10200),
('Volkswagen',	'Golf',	'compact',	2014,	8800),
('Toyota',	'RAV4',	'crossover',	2016,	12800),
('Toyota',	'4Runner',	'suv',	2015,	16900),
('Honda',	'CR-V',	'crossover',	2016,	17900);

-- Now let's have some fun with a second table.  AutoColor has two
-- columns: an autoID and a color!  The two tables do relate.

create table AutoColor (
	AutoID smallint unsigned,
    Color varchar(30) not null,
    PRIMARY KEY(AutoID),
    FOREIGN KEY(AutoID) references Auto(ID)
    );
    
insert into AutoColor
values
(1, 'red'),
(2, 'silver'),
(3, 'white'),
(4, 'black'),
(5, 'white'),
(6, 'red'),
(7, 'white');

-- The following examples work to select cars under or equal to the average price.
-- Hint: Just use the Auto table.

-- This won't work because we can't use an aggregate function in the WHERE clause!
select *
from Auto
where Price <= AVG(Price); 

-- We can solve this with a subquery.
select *
from Auto
where Price <=
	(select AVG(Price)
	from Auto)
;

-- (Special note: we could have saved the subquery into a variable.)
-- set @avg_price = (select AVG(Price) from Auto);
-- 
-- select *
-- from Auto
-- where Price <= @avg_price;

-- Can we create a subquery using TWO DIFFERENT tables that lists
-- all the cars from the Auto table that are white?

-- (Special note: we cannot save the subquery into a variable, 
-- because it contains more than 1 row.)
select *
from Auto
where ID in
	(select AutoID
	from AutoColor
	where Color = 'white')
ORDER BY Make;



-- Something harder...can we create a correlated subquery to 
-- display cars that are under or equal to the average price for 
-- the Make of that car?  
-- For example, only display a Toyota car if it is under the 
-- average price of all Toyotas in the table.
-- Hint: only use the Auto table in this example!

select *
from Auto as A
where Price <=
	(select AVG(Price)
    from Auto
    where A.Make = Make)
;

-- Can we write a query to print the make of a car if 2 or more cars
-- of that make are white?

select distinct Make
from Auto A
where exists
	(select *
	from AutoColor
    where A.ID = AutoID and Color = 'white')
;

-- Alternative with a join (a.k.a. "flattening the query")
select distinct Make
from Auto
INNER JOIN AutoColor
on Auto.ID = AutoColor.AutoID
where AutoColor.Color = 'white';

-- What about makes without cars that are white?  It is harder
-- than flipping "exists" to "not exists"...

-- Instead, we create a query around the subqurey that gave us
-- the makes that have white cars.  We only print the make if
-- it is not within one of those.
select distinct Make
from Auto
where Make not in
	(select distinct Make
	from Auto A
	where exists
		(select *
		from AutoColor
		where A.ID = AutoID and Color = 'white'))
	;

-- We cannot do a simple join to make all the subqueries in the previous 
-- example go away.