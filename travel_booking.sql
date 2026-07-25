-- Travel Booking System Database Schema & Queries
CREATE DATABASE TravelBooking;
USE TravelBooking;

-- Packages Table
CREATE TABLE Packages (
    package_id INT PRIMARY KEY AUTO_INCREMENT,
    destination VARCHAR(100),
    duration_days INT,
    cost DECIMAL(10, 2)
);

-- Bookings Table
CREATE TABLE TravelBookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    package_id INT,
    travel_date DATE,
    status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (package_id) REFERENCES Packages(package_id)
);

-- Sample Data Insert
INSERT INTO Packages (destination, duration_days, cost) VALUES
('Goa Beach Tour', 4, 12000.00),
('Manali Adventure Trip', 5, 15000.00);

INSERT INTO TravelBookings (customer_name, package_id, travel_date) VALUES
('Sana Ahmad', 1, '2025-09-15');

-- Key Analytical Query: Popular Destinations by Bookings
SELECT p.destination, COUNT(tb.booking_id) AS Total_Bookings
FROM Packages p
LEFT JOIN TravelBookings tb ON p.package_id = tb.package_id
GROUP BY p.destination;
