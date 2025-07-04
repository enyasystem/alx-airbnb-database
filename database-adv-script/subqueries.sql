
-- 🎯 Objective: Practice with subqueries in SQL

-- 1️⃣ Non-correlated subquery: Find all properties where the average rating is greater than 4.0
-- Explanation: The subquery calculates the average rating for each property. The outer query selects only those properties with an average rating above 4.0.
-- (Assuming you have a Reviews table with property_id and rating columns, and a Properties table.)
SELECT property_id, property_name
FROM Properties
WHERE property_id IN (
  SELECT property_id
  FROM Reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);


-- 2️⃣ Correlated subquery: Find users who have made more than 3 bookings
-- Explanation: The subquery counts bookings for each user, referencing the outer query's user_id. Only users with more than 3 bookings are selected.
-- (Assuming you have a Users table and a Bookings table with user_id.)
SELECT user_id, first_name, last_name
FROM Users u
WHERE (
  SELECT COUNT(*)
  FROM Bookings b
  WHERE b.user_id = u.user_id
) > 3;
