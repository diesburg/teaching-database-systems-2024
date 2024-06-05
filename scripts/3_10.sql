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


-- The following examples work to select cars under or equal to the average price.

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

-- Something harder...can we create a correlated subquery to display cars that are
-- under or equal to the average price for the Make of that car?  For example,
-- only display a Toyota car if it is under the average price of all toyotas in the
-- table.

select *
from Auto as A
WHERE Price <=

	(select AVG(Price)
    from Auto
    where Make = A.Make)
;

