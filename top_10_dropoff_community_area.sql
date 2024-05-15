SELECT
    dropoff_community_area,
    COUNT(*) AS trip_count
FROM
    `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
    dropoff_community_area IS NOT NULL
GROUP BY
    dropoff_community_area
ORDER BY
    trip_count DESC
LIMIT
    10