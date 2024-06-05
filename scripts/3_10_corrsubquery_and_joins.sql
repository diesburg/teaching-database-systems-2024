-- Let's play with the Auto and AutoColor tables to see how the
-- same query can be answered with a subquery or a JOIN.

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
    
create table AutoColor (
	AutoID smallint unsigned,
    Color varchar(30) not null,
    PRIMARY KEY(AutoID),
    FOREIGN KEY(AutoID) references Auto(ID)
    );
    
insert into Auto (Make,Model,Type,Year,Price)
values
('Toyota',	'Camry',	'sedan',	2015,	9800),
('Ford', 'Escape',	'crossover',	2015,	15900),
('Honda',	'Civic',	'sedan',	2016,	10200),
('Volkswagen',	'Golf',	'compact',	2014,	8800),
('Toyota',	'RAV4',	'crossover',	2016,	12800),
('Toyota',	'4Runner',	'suv',	2015,	16900),
('Honda',	'CR-V',	'crossover',	2016,	17900);

insert into AutoColor
values
(1, 'red'),
(2, 'silver'),
(3, 'white'),
(4, 'black'),
(5, 'white'),
(6, 'red'),
(7, 'silver');

-- (With a subquery): Select all columns from the auto table
-- for cars with an auto color of white. (Hint: we need to use 
-- a correlated subquery and EXISTS)

select ID, Make, Model, Type, Year, Price
from Auto A
where EXISTS
	(select *
    from AutoColor
    where A.ID = AutoID and Color = 'White')
;

-- (With a JOIN): Select all columns from the auto table
-- for cars with an auto color of white.
select ID, Make, Model, Type, Year, Price
FROM Auto
INNER JOIN AutoColor
ON AutoID=ID and Color = 'White';