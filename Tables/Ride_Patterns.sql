/*

    1. Correlation between ride distance & booking value.
    2. Hourly cancellations (cancellations by time of day).
    3. Completion vs. cancellation trends.

*/
-- Goal 1
SELECT
    CORR(ride_distance,booking_value) AS correlation_of_distance_and_booking_value
FROM india_riders

-- Goal 2
CREATE TABLE hourly_cancellations AS
SELECT
    EXTRACT(HOUR FROM ride_time) AS ride_hour,
    COUNT(*) FILTER (WHERE booking_status <> 'Completed') AS cancellations
FROM india_riders
WHERE ride_time IS NOT NULL
GROUP BY ride_hour
ORDER BY ride_hour;

-- Goal 3
CREATE TABLE completion_vs_cancellation AS
SELECT
    COUNT(*) FILTER (WHERE booking_status = 'Completed') AS completed_rides,
    COUNT(*) FILTER (WHERE booking_status <> 'Completed') AS cancelled_rides,
    ROUND(
        COUNT(*) FILTER (WHERE booking_status <> 'Completed')::NUMERIC 
        / COUNT(*) * 100, 2
    ) AS cancellation_rate_percent
FROM india_riders;

-- Calls the tables
SELECT *
FROM hourly_cancellations

SELECT *
FROM completion_vs_cancellation
