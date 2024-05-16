SELECT
  EXTRACT(MONTH from DATE_TRUNC(CAST(trip_start_timestamp AS DATE), MONTH)) AS month_number,
  FORMAT_DATETIME("%B", DATE_TRUNC(CAST(trip_start_timestamp AS DATE), MONTH)) AS month,
  ROUND(AVG(trip_total),2) AS average_taxi_trip
FROM
    `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
GROUP BY
    month,
    month_number
ORDER BY
    month_number