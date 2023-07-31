DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //

CREATE PROCEDURE UpdateBooking (IN bid INT, IN bdate DATE)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM Booking WHERE (booking_id = bid))
THEN
SELECT CONCAT("Booking " , bid, " does not exist.") AS `Message`;
ROLLBACK;
ELSE
UPDATE Booking SET date = bdate WHERE booking_id = bid;
COMMIT;
END IF; 
END //

DELIMITER ;