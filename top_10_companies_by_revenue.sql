SELECT
    company,
    SUM(fare) AS revenue
FROM
    `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
WHERE
    company IS NOT NULL
GROUP BY
    company
ORDER BY
    revenue DESC
LIMIT
    10