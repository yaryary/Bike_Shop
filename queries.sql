--Query 1 - checks for bikes that cost more than 450
SELECT bike_id, bike_model, bike_brand, bike_price
FROM Bike
WHERE bike_price > 450;

--Query 2 - will count bikes by status (in_shop or out_of_stock)
SELECT bike_status, COUNT(*) AS total_bikes
FROM Bike
GROUP BY bike_status;

--Query 3 - counts bikes by average price and bike's type
SELECT 
    bike_type,
    bike_status,
    COUNT(*) AS total_bikes,
    AVG(bike_price) AS average_price,
    MAX(bike_price) AS highest_price
FROM Bike
GROUP BY bike_type, bike_status
ORDER BY average_price DESC;

--Query 4: View all repairs
SELECT bike_repair_ID, bike_ID, repair_description,
       ticket_creation, ticket_completed, parts_costs, labor_cost
FROM BikeRepairs;

--query 5: repairs per bike.'
SELECT bike_ID, COUNT(bike_repair_ID) AS total_repairs
FROM BikeRepairs
GROUP BY bike_ID;

--Query 6: complete repairs
CREATE VIEW CompletedRepairs AS
SELECT *
FROM BikeRepairs
WHERE ticket_completed IS NOT NULL;
SELECT * FROM CompletedRepairs;

--Query7: insert repair, put values such as the Bike_ID and the number assigned to it
INSERT INTO BikeRepairs(--bike_ID)
VALUES(--3)

--Query 8: for ongoing repairs
SELECT bike_repair_ID, bike_ID, repair_description
FROM BikeRepairs
WHERE ticket_completed IS NULL;

--Query 9: for deleting a repair
DELETE FROM BikeRepairs
WHERE bike_repair_ID = --EX: 6;

--Query 10: updating a repair
UPDATE BikeRepairs
SET ticket_completed = CURDATE()
WHERE bike_repair_ID = --Ex: 3;

-- Query 11: Find users with active accounts

SELECT
    u.user_ID,
    u.first_name,
    u.last_name,
    u.email_address,
    u.user_role,
    u.is_active,
    COUNT(s.sale_ID) AS total_orders,
    SUM(s.sale_amount) AS total_spent
FROM User u
LEFT JOIN Sales s
    ON s.costumer_ID = u.user_ID
GROUP BY
    u.user_ID, u.first_name, u.last_name,
    u.email_address, u.user_role, u.is_active
ORDER BY total_spent DESC;

-- Query 12: Trigger that prevents negative sale_amount if user bypasses CHECK
DELIMITER //
CREATE TRIGGER trg_sales_no_negative_amount
BEFORE INSERT ON Sales
FOR EACH ROW
BEGIN
    IF NEW.sale_amount < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'sale_amount cannot be negative';
    END IF;
END//
DELIMITER ;



