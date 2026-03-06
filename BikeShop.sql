CREATE DATABASE IF NOT EXISTS BikeShop;
USE BikeShop;

-- User Table
CREATE TABLE User(
user_ID INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email_address VARCHAR(255) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL,
birth_date DATE NOT NULL,
phone_number VARCHAR(15) NOT NULL,
user_role ENUM('customer', 'staff') NOT NULL DEFAULT 'customer',
is_active BOOLEAN DEFAULT TRUE,
PRIMARY KEY (user_ID)
);

-- Sample Data
INSERT INTO User (
	first_name, last_name, email_address, password_hash, birth_date, phone_number, user_role, is_active)
Values(
	'Leia', 'Organa', 'downwiththeorder@gmail.com', 'Resistance123', '1950-01-01', '305-555-5555', 'staff', true);

-- Test Data    
SELECT * FROM User;