DROP PROCEDURE IF EXISTS UpdateBooking; -- Remove any previous version

DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN p_booking_id INT,
    IN p_booking_date DATE
)
BEGIN
    DECLARE booking_exists INT DEFAULT 0;

    -- Check if the booking with the given ID exists
    SELECT COUNT(*) INTO booking_exists
    FROM Booking
    WHERE BookingID = p_booking_id;

    IF booking_exists > 0 THEN
        -- Update the booking date if the booking exists
        UPDATE Booking
        SET BookingDate = p_booking_date
        WHERE BookingID = p_booking_id;

        -- Indicate successful update
        SELECT CONCAT('Booking ', p_booking_id, ' updated') AS message; 
    ELSE
        SELECT CONCAT('Booking ', p_booking_id, ' not found') AS message; 
    END IF;
END //
DELIMITER ;
