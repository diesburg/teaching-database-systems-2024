-- Script to get the datediff of last 2 purchase dates for all 
-- customer IDs.  Use this to demonstrate using subqueries.
--
-- Note: This is more advanced than this class should cover,but
-- it shows it is possible using the more advanced directives
-- rank() over and partition by.
use sakila;

select cust.customer_id
, max(cust.payment_date)
, min(cust.payment_date)
, datediff(max(cust.payment_date), min(cust.payment_date)) DaysBetween
from (
select p.customer_id
, p.payment_date
, rank() over (partition by p.customer_id order by p.payment_date desc) DateRank
from payment p) cust
where DateRank <= 2
group by cust.customer_id
