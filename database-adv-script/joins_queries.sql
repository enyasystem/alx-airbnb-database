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

-- The RIGHT JOIN below gets all bookings, with user info if available (NULL if not).

SELECT 
  Users.user_id,
  Users.first_name,
  Users.last_name,
  Bookings.booking_id,
  Bookings.property_id
FROM 
  Users
RIGHT JOIN Bookings ON Users.user_id = Bookings.user_id;
