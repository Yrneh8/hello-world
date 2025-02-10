import mysql.connector
from mysql.connector import Error

# Define the connection parameters
host = 'localhost'  # Host name, could be an IP or domain name
user = 'root'  # Your MySQL username
password = 'myrootpassword!'  # Your MySQL password
database = 'mydb'  # The database to connect to

# Example values for 'name' and 'password' from variables
name = "myuser1"
password_value = "mypassword123!"

# Create a connection to the database
try:
    connection = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )

    if connection.is_connected():
        print('Connected to MySQL database')

        # Create a cursor object to interact with the database
        cursor = connection.cursor()

        # Directly use variables in the query (with proper escaping)
        sql_insert_query = f"""INSERT INTO user (name, password)
                               VALUES ('{name}', '{password_value}')"""

        # Execute the SQL query
        cursor.execute(sql_insert_query)

        # Commit the transaction to the database
        connection.commit()

        print("1 row inserted into 'user' table")

except Error as e:
    print(f"Error: {e}")
finally:
    if connection.is_connected():
        # Close the cursor and connection to the MySQL server
        cursor.close()
        connection.close()
        print("MySQL connection closed")
