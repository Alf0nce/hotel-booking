-- Create database
CREATE DATABASE Hotel;
USE Hotel;

-- guest table
CREATE TABLE guest(
guest_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(50)
);

-- Insert values into guest table
INSERT INTO guest (first_name, last_name, phone_number) VALUES
('John', 'Smith', '555-123-4567'),
('Emily', 'Johnson', '555-234-5678'),
('Michael', 'Williams', '555-345-6789'),
('Sarah', 'Brown', '555-456-7890'),
('David', 'Jones', '555-567-8901');

-- payment table 
CREATE TABLE payment_status(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
payment_status_name VARCHAR(20) DEFAULT "NOT PAID"
);

-- Insert values into payment_status table
INSERT INTO payment_status (payment_status_name) VALUES
('PAID'),
('NOT PAID'),
('PARTIALLY PAID'),
('REFUNDED'),
('PENDING');

-- booking table
CREATE TABLE IF NOT EXISTS booking(
booking_id INT PRIMARY KEY AUTO_INCREMENT,
guest_id INT,
payment_status_id INT,
checkin_date DATETIME DEFAULT CURRENT_TIMESTAMP,
checkout_date DATETIME DEFAULT CURRENT_TIMESTAMP,
num_adults INT,
num_children INT,
booking_amount DECIMAL(10,2) CHECK(booking_amount>0),
FOREIGN KEY(guest_id) REFERENCES guest(guest_id),
FOREIGN KEY(payment_status_id) REFERENCES payment_status(payment_id)
);

-- Insert values into booking table
INSERT INTO booking (guest_id, payment_status_id, checkin_date, checkout_date, num_adults, num_children, booking_amount) VALUES
(1, 1, '2023-05-01 14:00:00', '2023-05-05 11:00:00', 2, 0, 500.00),
(2, 2, '2023-05-10 15:00:00', '2023-05-15 10:00:00', 2, 1, 750.00),
(3, 3, '2023-06-01 12:00:00', '2023-06-07 11:00:00', 1, 0, 450.00),
(4, 1, '2023-06-15 16:00:00', '2023-06-20 10:00:00', 4, 2, 1200.00),
(5, 4, '2023-07-01 13:00:00', '2023-07-10 11:00:00', 2, 0, 900.00);

-- addon table
CREATE TABLE addon(
addon_id INT PRIMARY KEY AUTO_INCREMENT,
addon_name VARCHAR(100) NOT NULL,
price DECIMAL(10,2)
);

-- Insert values into addon table
INSERT INTO addon (addon_name, price) VALUES
('Breakfast Buffet', 15.99),
('Airport Transfer', 25.00),
('Spa Access', 50.00),
('Late Checkout', 20.00),
('Parking', 12.50);

-- booking_addon table
CREATE TABLE booking_addon(
booking_id INT NOT NULL,
addon_id INT NOT NULL,
FOREIGN KEY(booking_id) REFERENCES booking(booking_id),
FOREIGN KEY(addon_id) REFERENCES addon(addon_id) 
);

-- Insert values into booking_addon table
INSERT INTO booking_addon (booking_id, addon_id) VALUES
(1, 1),
(1, 5),
(2, 2),
(3, 3),
(4, 1);

-- bed_type table
CREATE TABLE bed_type(
bed_type_id INT PRIMARY KEY AUTO_INCREMENT,
bed_type_name VARCHAR(100)
);

-- Insert values into bed_type table
INSERT INTO bed_type (bed_type_name) VALUES
('King'),
('Queen'),
('Double'),
('Twin'),
('Single');

-- room_class table 
CREATE TABLE room_class(
room_class_id INT PRIMARY KEY AUTO_INCREMENT,
class_name VARCHAR(100),
base_price DECIMAL(10,2)
);

-- Insert values into room_class table
INSERT INTO room_class (class_name, base_price) VALUES
('Standard', 100.00),
('Deluxe', 150.00),
('Executive', 200.00),
('Suite', 300.00),
('Presidential', 500.00);

-- feature table 
CREATE TABLE feature(
feature_id INT PRIMARY KEY AUTO_INCREMENT,
feature_name VARCHAR(100)
);

-- Insert values into feature table
INSERT INTO feature (feature_name) VALUES
('Ocean View'),
('Balcony'),
('Mini Bar'),
('Jacuzzi'),
('Kitchenette');

-- room_class_feature table 
CREATE TABLE room_class_feature(
room_class_id  INT,
feature_id INT,
FOREIGN KEY (room_class_id) REFERENCES room_class(room_class_id),
FOREIGN KEY (feature_id) REFERENCES feature(feature_id)
);

-- Insert values into room_class_feature table
INSERT INTO room_class_feature (room_class_id, feature_id) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

-- room_class_bed_type table
CREATE TABLE room_class_bed_type(
  id INT PRIMARY KEY AUTO_INCREMENT,
  room_class_id INT,
  bed_type_id INT,
  num_beds INT,
  FOREIGN KEY (room_class_id) REFERENCES room_class(room_class_id),
  FOREIGN KEY (bed_type_id) REFERENCES bed_type(bed_type_id)
);

-- Insert values into room_class_bed_type table
INSERT INTO room_class_bed_type (room_class_id, bed_type_id, num_beds) VALUES
(1, 3, 1),
(1, 4, 2),
(2, 2, 1),
(3, 1, 1),
(4, 1, 1),
(4, 2, 1),
(5, 1, 1);

-- room_status table 
CREATE TABLE room_status(
id INT PRIMARY KEY AUTO_INCREMENT,
status_name VARCHAR(100)
);

-- Insert values into room_status table
INSERT INTO room_status (status_name) VALUES
('Available'),
('Occupied'),
('Maintenance'),
('Reserved'),
('Cleaning');

-- floor table 
CREATE TABLE floor(
floor_id INT PRIMARY KEY AUTO_INCREMENT,
floor_number VARCHAR(5)
);

-- Insert values into floor table
INSERT INTO floor (floor_number) VALUES
('1'),
('2'),
('3'),
('4'),
('5');

-- room table
CREATE TABLE room(
room_id INT PRIMARY KEY AUTO_INCREMENT,
room_number VARCHAR(10),
status_id INT,
room_class_id INT,
floor_id INT,
FOREIGN KEY (status_id) REFERENCES room_status(id),
FOREIGN KEY (room_class_id) REFERENCES room_class(room_class_id),
FOREIGN KEY (floor_id) REFERENCES floor(floor_id)
);

-- Insert values into room table
INSERT INTO room (room_number, status_id, room_class_id, floor_id) VALUES
('101', 1, 1, 1),
('201', 1, 2, 2),
('301', 1, 3, 3),
('401', 1, 4, 4),
('501', 1, 5, 5);

-- booking_room table 
CREATE TABLE booking_room(
booking_id INT,
room_id INT,
FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
FOREIGN KEY (room_id) REFERENCES room(room_id)
);

-- Insert values into booking_room table
INSERT INTO booking_room (booking_id, room_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
