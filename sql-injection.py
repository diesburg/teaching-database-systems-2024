"""
Supplemental File

This is a supplement to the python connector shown in class.
The purpose of this file is to demonstrate why separating
query variables into a data tuple is important to prevent
SQL injection.

"""

import mysql.connector as mysql

def connect(password_str):
    db = mysql.connect(
        host = "localhost",
        user = "root",
        passwd = password_str,
        database = "sakila"
    )
    return db

def get_cust_info(db):
    """Example of SQL injection if we don't separate the input variables.
    Type the last name Jones into input to see the expected use of the
    function.  To see an example of SQL injection to list all last names,
    type the following WITH AN EXTRA SPACE AT THE END:

    Jones' or 1=1 --
    """
    
    cursor = db.cursor()

    cust_last_name =input("Enter the last name: ")

    ## note we don't use placeholders....
    query = ('SELECT * '
             'FROM customer '
             "WHERE last_name ='" + cust_last_name +"'")

    ## note there is no variable tuple
    cursor.execute(query)

    records = cursor.fetchall()
    for record in records:
        print(record)

    ## Close the cursor
    cursor.close()

def get_cust_info_safe(db):
    """Example of fixing SQL injection. The SQL injection will not work."""
    
    cursor = db.cursor()

    cust_last_name =input("Enter the last name: ")

    ## Note we do use a placeholder!
    query = ('SELECT * '
             'FROM customer '
             "WHERE last_name = %s")

    data = (cust_last_name,)

    ## Note there is a variable tuple! The execute method will clean the
    ## data variables tuple of injection.
    cursor.execute(query,data)

    records = cursor.fetchall()
    for record in records:
        print(record)

    ## Close the cursor
    cursor.close()


