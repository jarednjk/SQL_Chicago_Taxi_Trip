SELECT
    company,
    COUNT(*) AS total_trips
FROM
    `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
WHERE
    company IS NOT NULL
GROUP BY
    company
ORDER BY
    total_trips DESC
LIMIT
    10