-- Sample Data

-- User 
INSERT INTO User
(first_name, last_name, email_address, password_hash, birth_date,
 phone_number, user_role, is_active)
VALUES
('James',  'Smith',   'james.smith@test.com',   'hash1', '1990-03-14', '305-555-0101', 'customer',  TRUE),
('Maria',  'Lopez',   'maria.lopez@test.com',   'hash2', '1985-07-22', '305-555-0102', 'customer',  TRUE),
('Brian',  'Wilson',  'brian.wilson@test.com',  'hash3', '1978-11-05', '786-555-0103', 'customer',  FALSE),
('Anh',    'Nguyen',  'anh.nguyen@test.com',    'hash4', '2000-01-18', '786-555-0104', 'customer',  TRUE),
('Tara',   'Patel',   'tara.patel@test.com',    'hash5', '1998-09-30', '954-555-0105', 'staff',     TRUE),
('Luis',   'Garcia',  'luis.garcia@test.com',   'hash6', '1975-04-11', '954-555-0106', 'staff',     TRUE);

-- Bike
INSERT INTO Bike
(bike_type, bike_model, bike_brand, bike_status,
 bike_price, bike_size, bike_model_year)
VALUES
('Road',     'Domane AL 2',   'Trek',        'in_shop',     1299.99, 'M', 2022),
('Mountain', 'Talon 3',       'Giant',       'ready',        899.00, 'L', 2021),
('Hybrid',   'Quick 4',       'Cannondale',  'in_shop',      679.50, 'S', 2023),
('BMX',      'Legion L40',    'Mongoose',    'picked_up',    389.99, 'M', 2020),
('Road',     'Allez',         'Specialized', 'out_of_stock', 1200.00, 'L', 2024),
('Electric', 'Turbo Como 3',  'Specialized', 'ready',        2899.00, 'L', 2024),
('Road',     'Via Nirone 7',  'Bianchi',     'in_shop',      1799.00, 'XL',2021),
('Mountain', 'Scale 980',     'Scott',       'picked_up',    999.00, 'M', 2022),
('Hybrid',   'Discover 2',    'Schwinn',     'in_shop',      549.00, 'S', 2019),
('Hybrid',   'Escape 3',      'Giant',       'in_shop',      550.00, 'M', 2025);

-- BikeRepairs
INSERT INTO BikeRepairs
(bike_ID, repair_description, ticket_creation, ticket_completed,
 parts_costs, labor_cost, notes)
VALUES
(1, 'Flat tire replacement and brake adjustment',
 '2026-03-01', '2026-03-02',  18.00,  35.00, 'Replaced tube, adjusted both brakes'),
(2, 'Full tune-up and chain replacement',
 '2026-03-05', '2026-03-07',  25.50,  60.00, 'Chain stretched; derailleur re-indexed'),
(3, 'Wheel truing and rear cable replace',
 '2026-04-01', NULL,          15.00,  40.00, 'Waiting for customer approval'),
(5, 'Battery diagnostic and firmware update',
 '2026-01-20', '2026-01-22',   0.00,  80.00, 'Battery at 90% health'),
(6, 'Bottom bracket replacement',
 '2026-04-07', NULL,          45.00,  70.00, 'Parts on order'),
(8, 'Brake pad replacement and safety check',
 '2026-03-15', '2026-03-16',   9.99,  30.00, 'Both pads replaced; safety check passed');

-- Sales
INSERT INTO Sales
(sale_amount, sale_date, payment_type, receipt, costumer_ID, bike_repair_ID)
VALUES
-- Payments for repairs (linked to BikeRepairs)
(53.00,  '2026-03-02', 'credit_card', 'RCP-0001', 1, 1),
(85.50,  '2026-03-07', 'debit_card',  'RCP-0002', 2, 2),
(55.00,  '2026-04-02', 'cash',        'RCP-0003', 3, 3),
(80.00,  '2026-01-22', 'credit_card', 'RCP-0004', 4, 4),
(39.99,  '2026-03-16', 'cash',        'RCP-0005', 1, 6),

-- Bike purchases only (no repair ticket)
(899.00, '2026-03-10', 'credit_card', 'RCP-0006', 2, NULL),
(1299.99,'2026-03-18', 'credit_card', 'RCP-0007', 1, NULL),
(549.00, '2026-02-28', 'cash',        'RCP-0008', 4, NULL),
(2899.00,'2026-04-05', 'debit_card',  'RCP-0009', 5, NULL),
(389.99, '2026-01-15', 'cash',        'RCP-0010', 3, NULL);

