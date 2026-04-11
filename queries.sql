--Query 1 - checks for bikes that cost more than 450
SELECT bike_id, bike_model, bike_brand, bike_price
FROM Bike
WHERE bike_price > 450;

--Query 2 - will count bikes by status (in_shop or out_of_stock)
SELECT bike_status, COUNT(*) AS total_bikes
FROM Bike
GROUP BY bike_status;

--Query 3: View all repairs
SELECT bike_repair_ID, bike_ID, repair_description,
       ticket_creation, ticket_completed, parts_costs, labor_cost
FROM BikeRepairs;

--query 4: repairs per bike.'
SELECT bike_ID, COUNT(bike_repair_ID) AS total_repairs
FROM BikeRepairs
GROUP BY bike_ID;

--Query 5: complete repairs
SELECT * FROM CompletedRepairs;

--Query6: insert repair, put values such as the Bike_ID and the number assigned to it
INSERT INTO BikeRepairs(--bike_ID)
VALUES(--3)

--Query 7: for ongoing repairs
SELECT bike_repair_ID, bike_ID, repair_description
FROM BikeRepairs
WHERE ticket_completed IS NULL;

--Query 8: for deleting a repair
DELETE FROM BikeRepairs
WHERE bike_repair_ID = --EX: 6;

--Query 9: updating a repair
UPDATE BikeRepairs
SET repair_status = --EX: 'Completed',
    ticket_completed = CURDATE()
WHERE bike_repair_ID = --Ex: 3;


