DELIMITER //
CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT,
    IN customer_id INT     -- Add CustomerID parameter
)
BEGIN
    DECLARE booking_exists INT DEFAULT 0; 
    START TRANSACTION; 

    SELECT COUNT(*) INTO booking_exists
    FROM Booking
    WHERE BookingDate = booking_date AND TableNumber = table_number;

    IF booking_exists = 0 THEN
        INSERT INTO Booking (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_number, customer_id);   -- Use the provided CustomerID
        COMMIT;
        SELECT 'Booking successful!' AS message;
    ELSE
        ROLLBACK; 
        SELECT 'Booking failed: Table already booked' AS message;
    END IF;
END //
DELIMITER ;
