DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bdate DATE, IN tno INT, IN cust INT)
BEGIN
START TRANSACTION;
SELECT booking_id INTO @id FROM Booking ORDER BY booking_id DESC LIMIT 1;
SET @id = @id + 1;
IF EXISTS(SELECT 1 FROM Booking WHERE (date = bdate AND table_number = tno))
THEN
SELECT CONCAT("Table " , tno, " is already booked - booking cancelled.") AS `Booking status`; 
ROLLBACK;
ELSE
INSERT INTO Booking (booking_id,date, tno, customer_id)
VALUES (@id, bdate, tno, cust);
COMMIT;
SELECT CONCAT("Booking for table " , tno, " is successful.") AS `Booking status`; 
END IF;
END //

DELIMITER ;