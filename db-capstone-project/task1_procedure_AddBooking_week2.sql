DELIMITER //
CREATE PROCEDURE AddBooking(
    IN p_booking_id INT,
    IN p_customer_id INT,
    IN p_booking_date DATE,
    IN p_table_number INT
)
BEGIN
    -- Insert the new booking record into the Bookings table
    INSERT INTO Booking (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (p_booking_id, p_customer_id, p_booking_date, p_table_number);
END //
DELIMITER ;
