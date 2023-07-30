-- In this first task, Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table. 
-- Creating this procedure will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again 
-- and again to check the maximum quantity. 
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT 
    quantity AS 'MAX_QUANTIY'
FROM
    Orders
ORDER BY quantity DESC
limit 1;
END //
DELIMITER ;

CALL GetMaxQuantity;

-- In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
-- The prepared statement should accept one input argument, the CustomerID value, from a variable. 
-- The statement should return the order id, the quantity and the order cost from the Orders table. 
-- Once you create the prepared statement, you can create a variable called id and assign it value of 1. 

PREPARE GetOrderDetail FROM 
'SELECT order_id, quantity, cost FROM Orders 
WHERE order_id = ?;';

SET @id = 	1;
EXECUTE GetOrderDetail USING @id;


-- Your third and final task is to create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record 
-- based on the user input of the order id.
-- Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement. 

DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderid INT)
BEGIN
IF EXISTS(SELECT 
    order_id
FROM
    Orders
WHERE
    order_id = orderid)
then
	DELETE FROM Orders 
	WHERE
		order_id = orderid;
	SELECT CONCAT('Order ', orderid, ' is cancelled.') AS OK_Response;
ELSE
	SELECT CONCAT("Order ", orderid, " does not exist.") AS Error_Response;
END IF;
END //
DELIMITER ;

CALL CancelOrder(2);