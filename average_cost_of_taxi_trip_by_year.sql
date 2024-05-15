SELECT
    EXTRACT(YEAR from DATE_TRUNC(CAST(trip_start_timestamp AS DATE), YEAR)) AS year,
    ROUND(AVG(trip_total),2) AS average_taxi_trip
FROM
    `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
GROUP BY
    year
ORDER BY
    year