/* This is a sample script to show how stored procedures work */

use sakila;  /* sakila database must be installed */

/* set our parameter variables */
set @film_id = 1;
set @store_id = 1;
set @film_count = 0; 

/* run the procedure */
call sakila.film_in_stock(@film_id, @store_id, @film_count);

/* re-read the output variable to see the result */
select @film_count;
