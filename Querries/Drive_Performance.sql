/*

    1. Calculate average driver rating per pickup location.
    2. Find drivers (if proxy is pickup location or vehicle type) with the highest and lowest ratings.
    3. Identify how often drivers cancel compared to customers.

*/

--Goal 1
SELECT 
    pickup,
    ROUND(AVG(driver_ratings), 2) AS avg_driver_rating
FROM india_riders
WHERE driver_ratings IS NOT NULL
GROUP BY pickup
ORDER BY avg_driver_rating DESC;

--Goal 2
SELECT pickup, ROUND(AVG(driver_ratings), 2) AS avg_driver_rating
FROM india_riders
WHERE driver_ratings IS NOT NULL
GROUP BY pickup
ORDER BY avg_driver_rating DESC
LIMIT 1;   -- highest rated location

SELECT pickup, ROUND(AVG(driver_ratings), 2) AS avg_driver_rating
FROM india_riders
WHERE driver_ratings IS NOT NULL
GROUP BY pickup
ORDER BY avg_driver_rating ASC
LIMIT 1;   -- lowest rated location

--Goal 3
SELECT 
    COUNT(*) FILTER(WHERE cancelled_by_driver = true ) AS Count_of_Driver_Cancels,
    COUNT(*) FILTER(WHERE cancelled_by_customer = true ) AS Count_of_Customer_Cancels
FROM india_riders