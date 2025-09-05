/*

    1. Rank top 10 customers by total spending.
    2. Find average number of rides per customer.
    3. Check distribution of customer ratings → are most customers satisfied?

*/
-- All the data
SELECT
    *
FROM    
    india_riders
LIMIT
    10

--Goal 1
SELECT
    customer_id  AS customer,
    SUM(booking_value) AS Total_Expense
FROM    
    india_riders
WHERE
    booking_value IS NOT NULL
GROUP BY
    customer
ORDER BY
    Total_Expense DESC
LIMIT   
    10

--Goal 2
WITH ride_counts AS 
(
    SELECT
        customer_id AS customer,
        COUNT(*) AS customer_count
    FROM india_riders
    GROUP BY customer_id
)
SELECT
    ROUND(AVG(customer_count), 2) AS avg_rides_per_customer
FROM ride_counts;

--Goal 3
/* 
    -let 3 be OK Rating
    -bellow 3 is bad
    -above 3 is good
*/
SELECT
    COUNT(customer_ratings) AS All_Ratings,
    COUNT(*) FILTER (WHERE customer_ratings = 3) AS Average,
    COUNT(*) FILTER (WHERE customer_ratings < 3) AS Bad,
    COUNT(*) FILTER (WHERE customer_ratings > 3) AS Good
FROM    
    india_riders
WHERE   
    customer_ratings IS NOT NULL
-- Conclusion, since there are no customers rating the service below 3 then most customers enjoy the service and a few find it average


