
-- 🎯 Objective: Practice with SQL Aggregations and Window Functions

-- 1️⃣ Aggregation: Find the total number of bookings made by each user
-- Explanation: We use COUNT to count bookings per user, and GROUP BY to group results by user_id.
-- (Assuming Bookings table has user_id, and Users table has user info.)
SELECT
  u.user_id,
  u.first_name,
  u.last_name,
  COUNT(b.booking_id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;


-- 2️⃣ Window Function: Rank properties based on total number of bookings
-- Explanation: We use COUNT to get bookings per property, then use RANK() window function to assign a rank.
-- (Assuming Bookings table has property_id, and Properties table has property info.)
SELECT
  p.property_id,
  p.property_name,
  COUNT(b.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Properties p
LEFT JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name;
