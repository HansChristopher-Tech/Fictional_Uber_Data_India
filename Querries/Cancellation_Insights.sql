/*

    1. Cancellation reasons (customer vs. driver).
    2. Who cancels more often?
    3. Lost revenue = sum of booking_value for cancelled rides.

*/
-- Goal 1
--Customer Side
SELECT
    reason_for_canceling_customer as Customer_Reason,
    COUNT(reason_for_canceling_customer) as Frequency
FROM india_riders
WHERE reason_for_canceling_customer IS NOT NULL
GROUP BY
    Customer_Reason
ORDER BY
    Frequency DESC

--Driver Side
SELECT
    reason_for_canceling_driver as Driver_Reason,
    COUNT(reason_for_canceling_driver) as Frequency
FROM india_riders
WHERE reason_for_canceling_driver IS NOT NULL
GROUP BY
    Driver_Reason
ORDER BY
    Frequency DESC

-- Goal 2 
SELECT 
    COUNT(*) FILTER (WHERE cancelled_by_customer = TRUE) AS customer_cancels,
    COUNT(*) FILTER (WHERE cancelled_by_driver = TRUE)   AS driver_cancels
FROM india_riders;

-- Goal 3
SELECT 
    COALESCE(SUM(booking_value), 0) AS lost_revenue
FROM india_riders
WHERE cancelled_by_customer = true OR cancelled_by_driver = true;




