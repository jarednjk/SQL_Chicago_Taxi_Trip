SELECT
    pickup_community_area,
    COUNT(*) as trip_count
FROM
    `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE
    pickup_community_area IS NOT NULL
GROUP BY
    pickup_community_area
ORDER BY
    trip_count DESC
LIMIT
    10