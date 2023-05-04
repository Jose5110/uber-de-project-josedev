-- trips count per passenger count

SELECT a.passenger_count, COUNT(b.passenger_count_id) as trip_count
FROM fit-heaven-385515.uber_data_engineering.passenger_count_dim a
INNER JOIN fit-heaven-385515.uber_data_engineering.fact_table b
ON a.passenger_count_id = b.passenger_count_id
GROUP BY a.passenger_count
ORDER BY trip_count DESC;

-- average fare amount per hour of the day

SELECT b.pick_hour, ROUND(AVG(a.fare_amount), 2) as average_fare_amount
FROM fit-heaven-385515.uber_data_engineering.fact_table a
INNER JOIN fit-heaven-385515.uber_data_engineering.datetime_dim b
ON a.datetime_id = b.datetime_id
GROUP BY b.pick_hour
ORDER BY b.pick_hour ASC;

-- number of transactions by payment type and total amount of tips per payment type

SELECT a.payment_type_name, COUNT(b.payment_type_id) as count, ROUND(SUM(tip_amount), 2) as tip_amount_total
FROM fit-heaven-385515.uber_data_engineering.payment_type_dim a
INNER JOIN fit-heaven-385515.uber_data_engineering.fact_table b
ON a.payment_type_id = b.payment_type_id
GROUP BY a.payment_type_name
ORDER BY count DESC;

-- average trip distance per rate code (name)

SELECT r.rate_code_name, ROUND(AVG(t.trip_distance), 2) AS avg_trip_distance
FROM fit-heaven-385515.uber_data_engineering.fact_table f
JOIN fit-heaven-385515.uber_data_engineering.trip_distance_dim t ON f.trip_distance_id = t.trip_distance_id
JOIN fit-heaven-385515.uber_data_engineering.rate_code_dim r ON f.rate_code_id = r.rate_code_id
GROUP BY r.rate_code_name;