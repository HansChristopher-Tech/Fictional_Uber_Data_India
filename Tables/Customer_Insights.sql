/*

    1. Loyalty check (repeat high-spenders, top 10 customers).
    2. Average spend per customer.
    3. Ride frequency per customer.

*/

CREATE TABLE customer_insights AS
SELECT
    customer_id AS customer,
    COUNT(*) AS ride_frequency,
    SUM(booking_value) AS total_revenue,
    ROUND(AVG(booking_value), 2) AS avg_revenue_per_ride
FROM india_riders
WHERE booking_value IS NOT NULL
GROUP BY customer_id 

-- To Select the table and its contents
SELECT *
FROM Customer_insights

--Drops the table
DROP TABLE Customer_Insights
