-- Create the table
CREATE TABLE public.india_riders
(
    ride_date DATE,
    ride_time TIMESTAMP,
    booking_id VARCHAR(20),
    booking_status VARCHAR(50),
    customer_id VARCHAR(50),
    vehicle_type VARCHAR(20),
    pickup VARCHAR(50),
    droploc VARCHAR(50),
    driver_to_pickup INT,
    pickup_to_drop INT,
    cancelled_by_customer BOOLEAN,
    reason_for_canceling_customer VARCHAR(100),
    cancelled_by_driver BOOLEAN,
    reason_for_canceling_driver VARCHAR(100),
    incomplete_rides BOOLEAN,
    incomplete_rides_reason VARCHAR(100),
    booking_value INT,
    ride_distance NUMERIC,
    driver_ratings NUMERIC,
    customer_ratings NUMERIC,
    payment_method VARCHAR(20)
);

-- Assign table owner
ALTER TABLE public.india_riders OWNER TO postgres;
-- Remove quotes from booking_id and customer_id
UPDATE public.india_riders
SET booking_id = REPLACE(booking_id, '"', ''),
    customer_id = REPLACE(customer_id, '"', '');

--fix

ALTER TABLE public.india_riders
ALTER COLUMN ride_time TYPE TIME USING ride_time::TIME;

ALTER TABLE public.india_riders
ALTER COLUMN driver_to_pickup TYPE NUMERIC USING driver_to_pickup::NUMERIC;

ALTER TABLE public.india_riders
ALTER COLUMN pickup_to_drop TYPE NUMERIC USING pickup_to_drop::NUMERIC;

