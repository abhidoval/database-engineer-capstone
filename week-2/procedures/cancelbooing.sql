DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //

CREATE PROCEDURE CancelBooking (IN bid INT)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM Booking WHERE (booking_id = bid))
THEN
	SELECT CONCAT("Booking " , bid, " does not exist.") AS Response;
ROLLBACK;
ELSE
	DELETE FROM Booking WHERE booking_id = bid;
COMMIT;
END IF;
END //

DELIMITER ;