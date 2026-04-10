--Query 1 - checks for bikes that cost more than 450
SELECT bike_id, bike_model, bike_brand, bike_price
FROM Bike
WHERE bike_price > 450;

--Query 2 - will count bikes by status (in stock or out of stock)
SELECT bike_status, COUNT(*) AS total_bikes
FROM Bike
GROUP BY bike_status;
