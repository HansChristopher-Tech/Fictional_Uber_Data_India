/*

    1. Average ride distance by vehicle type.
    2. Compare driver-to-pickup vs. pickup-to-drop times.
    3. Peak hours and days of week analysis.

*/

--Goal 1
SELECT
    vehicle_type,
    ROUND(AVG(ride_distance), 2) AS avg_distance
FROM india_riders
WHERE ride_distance IS NOT NULL
GROUP BY vehicle_type
ORDER BY avg_distance DESC;


--Goal 2
SELECT
    ROUND(AVG(driver_to_pickup), 2) AS avg_driver_arrival_time,
    ROUND(AVG(pickup_to_drop), 2)   AS avg_travel_time
FROM india_riders
WHERE driver_to_pickup IS NOT NULL 
  AND pickup_to_drop IS NOT NULL;


-- Goal 3
--Peak Hours
SELECT
    EXTRACT(HOUR FROM ride_time) AS hour_of_day,
    COUNT(*) AS ride_count
FROM india_riders
GROUP BY hour_of_day
ORDER BY ride_count DESC;

-- Days of the week
SELECT
    TO_CHAR(ride_date, 'FMDay') AS weekday_name,
    COUNT(*) AS ride_count
FROM india_riders
GROUP BY weekday_name, EXTRACT(DOW FROM ride_date)
ORDER BY EXTRACT(DOW FROM ride_date);

    
