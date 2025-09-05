/*

Business Overview

    1. Measure total rides, completed rides, cancelled rides, incomplete rides.
    2. Calculate cancellation rate (%) and completion rate (%).
    3. Identify top 5 pickup locations and top 5 drop-off locations.

*/
--checks the whole table


-- Goal 1
WITH ride_metrics AS (
    SELECT
        COUNT(*) AS total_rides,
        COUNT(*) FILTER (WHERE booking_status = 'Completed') AS completed_rides,
        COUNT(*) FILTER (WHERE cancelled_by_customer = true OR cancelled_by_driver = true) AS cancelled_rides,
        COUNT(*) FILTER (WHERE incomplete_rides = true) AS incomplete_rides
    FROM india_riders
)

SELECT *
FROM india_riders
LIMIT 10

--Goal 2

WITH ride_metrics AS (
    SELECT
        COUNT(*) AS total_rides,
        COUNT(*) FILTER (WHERE booking_status = 'Completed') AS completed_rides,
        COUNT(*) FILTER (WHERE cancelled_by_customer = true OR cancelled_by_driver = true) AS cancelled_rides,
        COUNT(*) FILTER (WHERE incomplete_rides = true) AS incomplete_rides
    FROM india_riders
)
SELECT
    ROUND((cancelled_rides::NUMERIC / total_rides) * 100, 2) AS cancellation_rate_pct,
    ROUND((completed_rides::NUMERIC / total_rides) * 100, 2) AS completion_rate_pct
FROM ride_metrics

--Goal 3

--Pick-Up
SELECT
    pickup AS pickup_location,
    COUNT(*) AS pickup_count
FROM india_riders
GROUP BY pickup
ORDER BY pickup_count DESC
LIMIT 5;

--Drop
SELECT
    droploc AS drop_location,
    COUNT(*) AS dropoff_count
FROM india_riders
GROUP BY droploc
ORDER BY dropoff_count DESC
LIMIT 5;





