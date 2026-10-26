-- Cyclistic Bike-Share Case Study - Google Data Analytics Capstone
-- Author: guerrierfrantz80-ai
-- Business Task: How to convert casual riders to annual members?

-- 1. Clean & Calculate ride_length
SELECT 
  member_casual,
  rideable_type,
  COUNT(*) as total_rides,
  AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)) as avg_minutes
FROM `cyclistic.divvy_12months`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 1
GROUP BY 1,2;

-- 2. When do casuals ride most? (Key insight for marketing)
SELECT 
  FORMAT_DATE('%A', DATE(started_at)) as day_of_week,
  member_casual,
  COUNT(*) as number_of_rides
FROM `cyclistic.divvy_12months`
GROUP BY 1,2
ORDER BY member_casual, number_of_rides DESC;

-- 3. Recommendation: Top stations for casuals
SELECT 
  start_station_name,
  COUNT(*) as casual_rides
FROM `cyclistic.divvy_12months`
WHERE member_casual = 'casual'
GROUP BY 1
ORDER BY casual_rides DESC
LIMIT 10;

-- FINAL INSIGHT: Casuals ride longer on weekends, for leisure.
-- STRATEGY: Launch "Weekend Explorer" annual membership with discount for weekend rides.
