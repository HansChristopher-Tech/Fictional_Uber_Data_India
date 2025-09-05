/* 
    Ratings Insights
    1. Ratings distribution (good/average/bad).
    2. Ratings differences by vehicle type.
    3. Ratings by payment method.
*/

-- Goal 1: Ratings distribution
CREATE TABLE ratings_distribution AS
SELECT
    CASE 
        WHEN customer_ratings < 3 THEN 'Bad'
        WHEN customer_ratings = 3 THEN 'Average'
        WHEN customer_ratings > 3 THEN 'Good'
    END AS rating_category,
    COUNT(*) AS rating_count
FROM india_riders
WHERE customer_ratings IS NOT NULL
GROUP BY rating_category
ORDER BY rating_count DESC;

SELECT * FROM ratings_distribution;


-- Goal 2: Ratings by vehicle type
CREATE TABLE ratings_by_vehicle AS
SELECT
    vehicle_type,
    ROUND(AVG(customer_ratings), 2) AS avg_ratings
FROM india_riders
WHERE customer_ratings IS NOT NULL
GROUP BY vehicle_type
ORDER BY avg_ratings DESC;

SELECT * FROM ratings_by_vehicle;


-- Goal 3: Ratings by payment method
CREATE TABLE ratings_by_payment AS
SELECT
    payment_method,
    ROUND(AVG(customer_ratings), 2) AS avg_ratings
FROM india_riders
WHERE customer_ratings IS NOT NULL 
  AND payment_method IS NOT NULL
GROUP BY payment_method
ORDER BY avg_ratings DESC;

SELECT * FROM ratings_by_payment;
