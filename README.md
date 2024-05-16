# sql-chicago-taxi-trip

Utilised BigQuery to analyse and transform over 100,000,000 rows of data from [BigQuery Chicago Taxi Trip public dataset](https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=chicago_taxi_trips&page=dataset).

Utilised Tableau to create an [interactive data visualisation dashboard](https://public.tableau.com/app/profile/jarednjk/viz/ChicagoTaxiTripsDataVisualisationA4portrait/Dashboard2) to uncover insights for Chicago taxi trips such as the:
* Top 10 companies by revenue
* Top 10 companies for most trips
* Average cost of taxi trip by year
* Average cost of taxi trip by month
* Top 10 pickup community area
* Top 10 dropoff community area

# Introduction
The [Chicago Taxi Trip](https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=chicago_taxi_trips&page=dataset) public dataset from BigQuery is a collection of data related to taxi trips taken in the city of Chicago, Illinois. The dataset contains information on over 100 million taxi trips, spanning from 01/01/2013 to 31/12/2023. It includes details such as pickup and drop-off locations, trip distances, fares, payment methods, and timestamps.

### The questions I wanted to answer through my SQL queries were:
1. Which are the top performing taxi companies by revenue and how much did they make?
2. Which taxi companies made the most trips?
3. How much has the average total cost of a taxi trip increased over the last decade?
4. Which are the cheapest and most expensive time of the year to take a taxi?
5. Where are the most popular pickup and dropoff places?

# Tools I Used
For my deep dive into the Chicago taxi trip public dataset, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **BigQuery:** The cloud-based big data analytics web service for processing very large read-only data sets.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
- **Tableau:** The data visualisation tool used for data analysis and business intelligence to share my insights via a dashboard.

# The Analysis
Each query for this project aimed at investigating specific aspects of the Chicago taxi trip dataset. Here’s how I approached each question:

### 1. Top Performing Taxi Companies by Revenue
To identify the companies with the highest revenue, I filtered by summing the fare for each company and order them by the highest revenue.

```
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
```

![Top 10 companies by revenue]()

### 2. Taxi Companies with the Most Trips

```
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
```

![Top 10 companies by most trips]()

### 3. Increase in Cost of Taxi Over the Last Decade

```
SELECT
    EXTRACT(YEAR from DATE_TRUNC(CAST(trip_start_timestamp AS DATE), YEAR)) AS year,
    ROUND(AVG(trip_total),2) AS average_taxi_trip
FROM
    `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
GROUP BY
    year
ORDER BY
    year
```

![Average cost of taxi trip by year]()

### 4. Cheapest and Most Expensive Months to Take a Taxi

```
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
```

![Average cost of taxi trip by month]()

### 5. Most Popular Pickup and Dropoff Places

```
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
```

![Top 10 pickup community area]()

```
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
```

![Top 10 dropoff community area]()

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **🕰️ Complex Datetime Conversion:** Devleoped strong mastery in datetime conversion in SQL, enabling me to efficiently handle and manipulate date and time data for more accurate and timely reporting.
- **🔢 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like SUM(), COUNT(), ROUND(), and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.
- **📊 Dashboard Mastery:** Enhanced my skills in Tableau, allowing me to create more complex visualizations and insightful data dashboards to improve data-driven decision-making processes.

# Conclusions

### Insights
From the analysis, several general insights emerged:

1. **Top Performing Taxi Companies by Revenue**: Flash Cab has the highest revenue at $141,540,183.95.
2. **Taxi Companies with the Most Trips**: Flash Cab made the most trips with a total of 10,706,978 times.
3. **Increase in Cost of Taxi Over the Last Decade**: SQL is the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Cheapest and Most Expensive Months to Take a Taxi**: Specialized skills, such as Spark and Looker, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Most Popular Pickup and Dropoff Places**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.
