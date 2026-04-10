-- ============================================================
-- Bike Shop Constraints Test File
-- Purpose: demonstrate constraint enforcement with failing SQL
-- ============================================================

-- Run these queries AFTER creating tables and loading valid sample data

-- ============================================================

-- FAIL #1: Duplicate primary key in User
-- Violates: PRIMARY KEY (user_ID)

INSERT INTO User (user_ID, user_name, first_name, last_name, email_address, phone_number, birth_date, user_role, is_active)
VALUES (1, 'dupuser', 'Duplicate', 'User', 'dup@email.com', '305-555-9999', '1999-01-01', 'customer', TRUE);

-- Expected database error message example:
-- MySQL: ERROR 1062 (23000): Duplicate entry '1' for key 'User.PRIMARY'
-- PostgreSQL: ERROR: duplicate key value violates unique constraint "user_pkey"
-- DETAIL: Key (user_id)=(1) already exists



-- FAIL #2: Bike references a non-existent user
-- Violates: FOREIGN KEY (user_ID) REFERENCES User(user_ID)

INSERT INTO Bike (bike_ID, user_ID, bike_type, bike_price, bike_brand, bike_model_year, bike_size, bike_status)
VALUES (999, 9999, 'Road', 1200.00, 'Trek', 2024, 'M', 'in_shop');

-- Expected database error message example:
-- MySQL: ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- PostgreSQL: ERROR: insert or update on table "bike" violates foreign key constraint
-- DETAIL: Key (user_id)=(9999) is not present in table "user"


-- FAIL #3: Repair references a non-existent bike
-- Violates: FOREIGN KEY (bike_ID) REFERENCES Bike(bike_ID)

INSERT INTO Bike_Repairs (bike_repair_ID, bike_ID, repair_status, repair_description, ticket_creation, ticket_completed, parts_cost, labor_cost, notes)
VALUES (999, 9999, 'Pending', 'Test invalid bike reference', '2026-04-09', NULL, 10.00, 20.00, 'Should fail FK');

-- Expected database error message example:
-- MySQL: ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- PostgreSQL: ERROR: insert or update on table "bike_repairs" violates foreign key constraint
-- DETAIL: Key (bike_ID)=(9999) is not present in table "bike".


-- FAIL #4: Sale references a non-existent customer
-- Violates: FOREIGN KEY (customer_ID) REFERENCES User(user_ID)

INSERT INTO Sales (sale_ID, sale_amount, sale_date, payment_type, receipt, costumer_ID)
VALUES (999, 49.99, '2026-04-09', 'cash', 'RCP-0999', 9999);

-- Expected database error message example:
-- MySQL: ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- PostgreSQL: ERROR: insert or update on table "sales" violates foreign key constraint
-- DETAIL: Key (costumer_ID)=(9999) is not present in table "user".
