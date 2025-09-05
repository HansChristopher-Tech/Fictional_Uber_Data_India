/*

    1. Loyalty check (repeat high-spenders, top 10 customers).
    2. Average spend per customer.
    3. Ride frequency per customer.

*/

-- Goal 1: Customer Insights (loyalty check)
CREATE TABLE customer_insights AS
SELECT
    customer_id AS customer,
    COUNT(*) AS ride_frequency,
    SUM(booking_value) AS total_revenue,
    ROUND(AVG(booking_value), 2) AS avg_revenue_per_ride
FROM india_riders
WHERE booking_value IS NOT NULL
GROUP BY customer_id;

-- Goal 2: Average spend per customer
CREATE TABLE avg_spend_per_customer AS
SELECT
    ROUND(AVG(total_revenue), 2) AS avg_spend_per_customer
FROM (
    SELECT
        customer_id,
        SUM(booking_value) AS total_revenue
    FROM india_riders
    WHERE booking_value IS NOT NULL
    GROUP BY customer_id
) AS per_customer;

-- Goal 3: Average rides per customer
CREATE TABLE avg_rides_per_customer AS
SELECT
    ROUND(AVG(ride_count), 2) AS avg_rides_per_customer
FROM (
    SELECT
        customer_id,
        COUNT(*) AS ride_count
    FROM india_riders
    GROUP BY customer_id
) AS per_customer;

-- ✅ View results for all 3 tables
SELECT * FROM customer_insights;
SELECT * FROM avg_spend_per_customer;
SELECT * FROM avg_rides_per_customer;

-- ❌ Optional: drop the tables when no longer needed
-- DROP TABLE customer_insights;
-- DROP TABLE avg_spend_per_customer;
-- DROP TABLE avg_rides_per_customer;
