
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


-- 3️⃣ Window Function: Use ROW_NUMBER to assign a unique row number to each property based on bookings
-- Explanation: ROW_NUMBER() gives a unique sequential number to each row in the result set, ordered by total bookings (most booked property gets 1).
SELECT
  p.property_id,
  p.property_name,
  COUNT(b.booking_id) AS total_bookings,
  ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_row_number
FROM Properties p
LEFT JOIN Bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name;
