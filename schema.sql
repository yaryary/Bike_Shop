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

-- Bike Table
CREATE TABLE Bike (
    bike_ID INT NOT NULL AUTO_INCREMENT,
    bike_type VARCHAR(50) DEFAULT NULL,
    bike_model VARCHAR(50) DEFAULT NULL,
    bike_brand VARCHAR(50) DEFAULT NULL,
    bike_status VARCHAR(30) DEFAULT NULL,
    bike_price DECIMAL(8,2) DEFAULT NULL,
    bike_size VARCHAR(20) DEFAULT NULL,
    bike_model_year YEAR DEFAULT NULL,
    PRIMARY KEY (bike_ID)
);

-- BikeRepairs Table
CREATE TABLE BikeRepairs (
    bike_repair_ID INT NOT NULL AUTO_INCREMENT,
    bike_ID INT NOT NULL,
    repair_description VARCHAR(100) NOT NULL,
    ticket_creation DATE NOT NULL,
    ticket_completed DATE,
    parts_costs DECIMAL(10,2) NOT NULL CHECK (parts_costs >= 0),
    labor_cost DECIMAL(10,2) NOT NULL CHECK (labor_cost >= 0),
    notes TEXT,
    PRIMARY KEY (bike_repair_ID),
    CONSTRAINT fk_bikerepairs_bike
        FOREIGN KEY (bike_ID) REFERENCES Bike(bike_ID)
);

-- Sales Table
CREATE TABLE Sales (
    sale_ID INT NOT NULL AUTO_INCREMENT,
    sale_amount DECIMAL(10,2) NOT NULL,
    sale_date DATE NOT NULL,
    payment_type ENUM('cash', 'credit_card', 'debit_card') NOT NULL,
    receipt VARCHAR(100) NOT NULL UNIQUE,
    costumer_ID INTEGER UNSIGNED NOT NULL,
    bike_repair_ID INT NULL,
    PRIMARY KEY (sale_ID),
    CONSTRAINT fk_sales_customer
        FOREIGN KEY (costumer_ID)
        REFERENCES User(user_ID),
    CONSTRAINT fk_sales_bike_repair
        FOREIGN KEY (bike_repair_ID)
        REFERENCES BikeRepairs(bike_repair_ID)
);
