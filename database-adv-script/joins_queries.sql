-- FULL OUTER JOIN simulation using UNION

-- In SQL, not all databases support FULL OUTER JOIN directly (e.g., MySQL < 8.0).
-- To get all records from both Users and Bookings, we combine LEFT JOIN and RIGHT JOIN using UNION.
-- This ensures we include:
--   1. All users (even those without bookings)
--   2. All bookings (even those without a matching user)
--   3. No duplicate rows (UNION removes duplicates)

SELECT 
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Bookings.booking_id,
  Bookings.property_id
FROM 
  Users
LEFT JOIN Bookings ON Users.user_id = Bookings.user_id

-- The above LEFT JOIN gets all users, with booking info if available (NULL if not).

UNION


SELECT 
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Bookings.booking_id,
  Bookings.property_id
FROM 
  Users
RIGHT JOIN Bookings ON Users.user_id = Bookings.user_id;


-- 1️⃣ INNER JOIN: Retrieve all bookings and the respective users who made those bookings
-- This query returns only bookings that are linked to a user (i.e., user_id matches in both tables).
SELECT
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Bookings.booking_id,
  Bookings.property_id
FROM
  Users
INNER JOIN Bookings ON Users.user_id = Bookings.user_id;


-- 2️⃣ LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
-- This query returns all properties, and if a property has reviews, those are included; otherwise, review columns will be NULL.
-- (Assuming you have a Properties and Reviews table. Please adjust table/column names if different.)
SELECT
  Properties.property_id,
  Properties.property_name,
  Reviews.review_id,
  Reviews.review_text
FROM
  Properties
LEFT JOIN Reviews ON Properties.property_id = Reviews.property_id;


-- 3️⃣ FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- MySQL (before 8.0) does not support FULL OUTER JOIN directly, so we simulate it using UNION of LEFT and RIGHT JOINs.
SELECT 
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Bookings.booking_id,
  Bookings.property_id
FROM 
  Users
LEFT JOIN Bookings ON Users.user_id = Bookings.user_id

UNION

SELECT 
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Bookings.booking_id,
  Bookings.property_id
FROM 
  Users
RIGHT JOIN Bookings ON Users.user_id = Bookings.user_id;
