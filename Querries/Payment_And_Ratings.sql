/*

    1. Avg booking value by payment method.
    2. Compare ratings by payment method.
    3. Correlation between ride distance and ratings.

*/

--Goal 1
SELECT
    payment_method AS paid_where,
    ROUND(AVG(booking_value), 2) AS avg_cost
FROM india_riders
WHERE booking_value IS NOT NULL
GROUP BY payment_method
ORDER BY avg_cost DESC;

--Goal 2
--Customer Ratings vs. Payment Method
SELECT
    payment_method,
    ROUND(AVG(customer_ratings), 2) AS avg_customer_rating,
    ROUND(AVG(driver_ratings), 2)   AS avg_driver_rating
FROM india_riders
WHERE payment_method IS NOT NULL
GROUP BY payment_method
ORDER BY avg_customer_rating DESC;

--Goal 3
SELECT
    CORR(ride_distance, customer_ratings) AS correlation_distance_rating
FROM india_riders
WHERE ride_distance IS NOT NULL 
  AND customer_ratings IS NOT NULL;

