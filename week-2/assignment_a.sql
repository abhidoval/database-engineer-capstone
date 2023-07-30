-- In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 
-- Here’s some guidance around completing this task: 
-- Use a CREATE VIEW statement.
-- Extract the order id, quantity and cost data from the Orders table.
-- Filter data from the orders table based on orders with a quantity greater than 2. 
CREATE VIEW OrderView AS
    SELECT 
        order_id, cost, quantity
    FROM
        Orders
    WHERE
        quantity > 2;


-- For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 
-- Customers table: The customer id and full name.
-- Orders table: The order id and cost.
-- Menus table: The menus name.
-- MenusItems table: course name and starter name.
-- The result set should be sorted by the lowest cost amount.
-- The output result of your query (depends on the data populated in your database) should be similar to the example in the following screenshot: 

SELECT 
    Customer.id,
    CONCAT(Customer.first_name,
            ' ',
            Customer.last_name) AS name,
    Orders.id,
    Orders.cost,
    Menu.name,
    Menu_Items.name,
    Menu_Items.category
FROM
    Customer
        JOIN
    Booking ON Customer.customer_id = Booking.customer_id
        JOIN
    Orders ON Orders.order_id = Booking.order_id
        JOIN
    Menu ON Menu.menu_id = Orders.menu_id
        JOIN
    Menu_Items ON Menu_Items.menu_id = Menu.menu_id
WHERE
    Orders.cost > 150
ORDER BY Orders.cost ASC;


-- For the third and final task, Little Lemon need you to find all menu items for which more than 2 orders have been placed. You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.
-- Here’s some guidance around completing this task: 
-- Use the ANY operator in a subquery
-- The outer query should be used to select the menu name from the menus table.
-- The inner query should check if any item quantity in the order table is more than 2.
SELECT 
    name
FROM
    Menu
        JOIN
    Orders ON Menu.menu_id = Orders.menu_id
WHERE
    order_id = ANY (SELECT 
            quantity
        FROM
            Orders
        WHERE
            quantity > 2); 