/*

    1. Loyalty check: repeat high-spenders.
    2. Correlation between ride distance & booking value.
    3. Hourly cancellation analysis.
    4. Rating differences by vehicle type.

*/

-- Goal 1
SELECT 
    customer_id AS customer,
    COUNT(customer_id) AS Frequency,
    ROUND(AVG(booking_value), 2) AS How_much_customer_spend 
FROM india_riders
WHERE 
    booking_value IS NOT NULL
GROUP BY
    customer
ORDER BY    
     --How_much_customer_spend DESC
     Frequency DESC
LIMIT 10

-- Goal 2
SELECT
    CORR(booking_value, ride_distance) AS Correlation_between_distance_and_booking_cost
FROM india_riders

-- Goal 3
SELECT
    EXTRACT(HOUR FROM ride_time) as Day_TIME,
    COUNT(booking_status) FILTER(WHERE booking_status<>'Completed') AS Frequency
FROM india_riders
GROUP BY
    Day_Time
ORDER BY
    Day_TIME

-- Goal 4
SELECT  
    vehicle_type,
    ROUND((AVG(customer_ratings)), 2) AS RatingVsVehicleType
FROM india_riders
GROUP BY
    vehicle_type
ORDER BY
    RatingVsVehicleType DESC