DELIMITER //
CREATE PROCEDURE CheckBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_exists INT DEFAULT 0; -- Variable to track booking status

    -- Check if the table is booked on the given date
    SELECT COUNT(*) INTO booking_exists 
    FROM Booking
    WHERE BookingDate = booking_date AND TableNumber = table_number;

    IF booking_exists > 0 THEN
        SELECT CONCAT('Table ', table_number, ' is booked on ', booking_date) AS message;
    ELSE
        SELECT CONCAT('Table ', table_number, ' is available on ', booking_date) AS message;
    END IF;
END //
DELIMITER ;

CALL CheckBooking('2024-05-25', 3);  -- Example: Check if table 3 is booked on May 25th, 2024
