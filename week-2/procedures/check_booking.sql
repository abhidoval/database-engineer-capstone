DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //

CREATE PROCEDURE CheckBooking (IN bdate DATE, IN tno INT)
BEGIN
IF EXISTS(SELECT 1 FROM Booking WHERE date = bdate AND table_number = tno)
THEN
SELECT CONCAT("Table " , tno, " is already booked.") AS `Booking status`; 
ELSE
SELECT CONCAT("Table " , tno, " is not yet booked.") AS `Booking status`; 
END IF;
END //

DELIMITER ;