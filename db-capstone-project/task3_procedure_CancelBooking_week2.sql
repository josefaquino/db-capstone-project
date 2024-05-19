DROP PROCEDURE IF EXISTS CancelBooking; -- Remove any previous version

DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN p_booking_id INT
)
BEGIN
    -- Declare a variable to check if the booking exists
    DECLARE booking_exists INT DEFAULT 0;

    -- Check if the booking with the given ID exists
    SELECT COUNT(*) INTO booking_exists
    FROM Booking
    WHERE BookingID = p_booking_id;

    -- Delete the booking if it exists
    IF booking_exists > 0 THEN
        DELETE FROM Booking
        WHERE BookingID = p_booking_id;

        -- Indicate successful cancellation
        SELECT CONCAT('Booking ', p_booking_id, ' cancelled successfully') AS message;
    ELSE
        -- Indicate that the booking was not found
        SELECT CONCAT('Booking ', p_booking_id, ' not found') AS message;
    END IF;
END //
DELIMITER ;
