delimiter //
CREATE PROCEDURE AddBooking (IN id INT, IN cid INT, IN tno INT, IN bdate DATE)
BEGIN
INSERT INTO booking (booking_id, customer_id, table_number, date) VALUES (id, cid, table_number, bdate); 
END //
delimiter ;