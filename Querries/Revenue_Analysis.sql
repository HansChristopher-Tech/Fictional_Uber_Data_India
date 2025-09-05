/*

    1. Monthly revenue trend (time series).
    2. Average booking value by vehicle type.
    3. Contribution of top 5 customers.

*/
-- Goal 1
SELECT 
    DATE_TRUNC('month', ride_date) AS month,
    SUM(booking_value) AS total_revenue
FROM india_riders
WHERE booking_value IS NOT NULL
GROUP BY month
ORDER BY month;


-- Goal 2
SELECT
    vehicle_type,
    ROUND(AVG(booking_value), 2) AS avg_booking_value
FROM india_riders
WHERE booking_value IS NOT NULL
GROUP BY vehicle_type
ORDER BY avg_booking_value DESC;


--Goal 3
WITH customer_revenue AS (
    SELECT
        customer_id AS customer,
        SUM(booking_value) AS revenue
    FROM india_riders
    WHERE booking_value IS NOT NULL
    GROUP BY customer
)
SELECT
    customer,
    revenue,
    ROUND((revenue * 100.0 / SUM(revenue) OVER ()), 2) AS percentage_of_total
FROM customer_revenue
ORDER BY revenue DESC
LIMIT 5;
