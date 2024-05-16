SELECT
    company,
    ROUND(SUM(fare),2) AS revenue
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