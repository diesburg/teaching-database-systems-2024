-- Let's play with the Auto table in 3.3.2 to see
-- how aggregate functions work

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



-- Play with some queries

-- How many cars are in this table?
select COUNT(*) from Auto;



-- What is the price of cheapest car?
select MIN(Price) from Auto;

-- What is the difference between the cheapest car and most expensive car?
select MAX(Price) - MIN(Price) from Auto;

-- Can we get more info than that on the cheapest car?
select MIN(Price), ID from Auto; -- will fail

-- This failed because MIN(Price) just returns one price, but
-- asking for ID asks for ID from every row.  No way to answer.

-- What if we use a local variable??? (Note the () )
SET @min_price = (select MIN(Price) from Auto);

-- Now we can get info about the car based on @min_price
select * from Auto where Price = @min_price;

-- How do we get a result table of makes along with their counts?
-- Can we do this without a group by statement?
select Make, Count(Make) from Auto
group by Make;

-- How do we get a result table of the average price of each make?
-- Can we do this without a group by statement?

select Make, avg(Price) from Auto
group by Make;

-- How do we get a result table of the average price of each make without including Toyota?

select Make, avg(Price) from Auto
where Make != 'Toyota'
group by Make;
-- having Make != 'Toyota';

-- How do we get a results table of each car grouped by year for all years < 2016?
select count(Year),Year
from Auto
where Year < 2016
group by Year;

-- How do we add onto that query to exclude groups that have a count <= 1?
select count(Year),Year
from Auto
where Year < 2016
group by Year
having count(Year) > 1;


