# Brief overview
This project, using SQL, manages the database of a fictional car dealership. Apart from table creation, structure alteration and data insertion, it also contains views and queries, which are used to display relevant information, such as the performance of different selling locations. <br/>


# Structure
- create_alter_tables.sql --> creation of tables and alterations
- populate_tables.sql --> population of tables with data
- views_and_queries --> views and queries on the created views


# Views and queries
In the views_and_queries file, the code written there responds to possible questions of a fictional manager of the dealeriship chain. Those demands are, as follows:
- Display the dealerships, the cars that are or used to be in stock, their price and the chassis number. Then, based on this information, display the dealerships that sold vehicles for an amount greater than a number chosen by the manager (the displayed sum should not include price reductions of any kind).
- Display all the clients and their departments, in alphabetical order of their surname and then of their name.
- Which vehicles are or used to be in stock? Display the models and their prices for the vehicles that are still in stock, and for the others, display the invoice number, the date and time of the sale and the client's name.
- How much money did each dealership make from selling cars, including price reductions? Order the dealerships by their performance.
  

# How to run
In order to run the program, you will need to download a tool that can execute SQL scripts, such as SQLite or DB Browser (provides a graphical interface). You then need to clone the files in this repo and then run create_alter_tables.sql and then populate_tables.sql. In order to see the views, and queries, you need to run them separately.
