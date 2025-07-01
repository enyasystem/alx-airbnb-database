-- FULL OUTER JOIN simulation using UNION
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
