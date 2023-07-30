# DATABASE ENGINEER CAPSTONE PROJECT
This is the final project for meta database engineer certification

1. <a href='week-1'>Week1</a>
    <Br> Create a normalized ER diagram and use the forward engineer method in MySQL Workbench to implement the Little Lemon data model inside MySQL server.<br>
    Contains conceptual data model diagram ```conceptual-data-model.png```, ER Diagram ```LittleLemonDM-ERD.png```.
    ```LittleLemonDB.sql``` file to implement the schema in your own mysql workbench.
    ```show_databases.sql``` file to show if the little lemon database is present or not.


2. <a href='week-2'>Week2</a>
    <br> In the __task-1__ created a virtual table called *OrdersView* that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2.<br>
    In the __task-2__ extract information from four tables on all customers with orders that cost more than $150.<br>
    In the __task-3__, find all menu items for which more than 2 orders have been placed.<br>
    *__All this task(1-3) are done in assignment_a.sql file__*

    <br>
    In <b>task 4</b>, created a procedure *GetMaxQuantity* that displays the maximum ordered quantity in the Orders table.<br>
    In <b>task 5</b>, created a prepared statement called GetOrderDetail that returns the order id, the quantity and the order cost from the Orders table. <br>
    In <b>task 6</b>, created a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.<Br>
    <i><b>All this task(4-6) are done in assignment_b.sql file</i></b>

