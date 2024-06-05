import mysql.connector as mysql

def connect(password_str):
    db = mysql.connect(
        host = "localhost",
        user = "root",
        passwd = password_str,
        database = "sakila"
    )
    return db

def get_category(db):
    """ Basic example of running a query """
    cursor = db.cursor()

    ## defining the query
    query = "SELECT * FROM category"

    ## getting records from the table
    cursor.execute(query)

    ## fetching all records from the 'cursor' object
    records = cursor.fetchall()

    ## Showing the data
    for record in records:
        ## Each record is a tuple of row
        ## Chage to print(record[1]) to get the category name only
        print(record)

    ## If you made changes to the database, you should
    ## commit the db connection here.
    ## db.commit()

    ## Close the cursor
    cursor.close()
        
    return None

def main():
    """ Example of putting everything together."""
    
    ## Connect once to get the db connection
    print("Connecting to the database...")
    password_str = input("Enter password: ")
    db = connect(password_str)

    ## Do queries
    get_category(db)
    
def get_film_description(db):
    """Example of using query parameters to change your query."""
    
    cursor = db.cursor()

    ## defining the Query
    film_id=input("Enter a film ID number to get the title and description: ")

    ## query must be a string with one or multiple %s placeholders
    query = ('SELECT title, description '
             'FROM film '
             'WHERE film_id = %s')

    ## note that data MUST be a tuple!  To make a single item tuple, use parenthesis
    ## and put a comma at the end.
    data = (film_id,)

    ## getting records from the table
    cursor.execute(query,data)

    ## fetching all records from the 'cursor' object
    records = cursor.fetchall()

    ## Showing the data
    for record in records:
        ## Each record is a tuple of row
        ## Chage to print(record[1]) to get the category name only
        print(record)

    ## If you made changes to the database, you should
    ## commit the db connection here.
    ## db.commit()

    ## Close the cursor
    cursor.close()

def film_in_stock(db):
    """Example of using a stored procedure.  Sakila has 6 of these."""
    cursor = db.cursor()

    ## Set up the parameters to the stored procedure.
    film_id = 1
    store_id = 1
    film_count = 0 #This is the return variable, set to 0.

    ## Put the parameters in a tuple.  Everything goes in a tuple.
    data = (film_id, store_id, film_count)

    ## Call the stored sakila procedure.
    result = cursor.callproc('film_in_stock', data)


    ## Result is the new version of the data tuple.  Since our
    ## film_count is the return variable and in index 2, we just
    ## print index 2 of result.
    
    print(result[2])

    ## Close the cursor
    cursor.close()
        



