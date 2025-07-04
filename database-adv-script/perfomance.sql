
-- 🎯 Objective: Optimize complex queries for better performance


SELECT
  b.booking_id,
  b.booking_date,
  u.user_id,
  u.first_name,
  u.last_name,
  p.property_id,
  p.property_name,
  pay.payment_id,
  pay.amount,
  pay.payment_date
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE b.booking_date >= '2023-01-01' AND pay.amount > 0;

-- 2️⃣ Analyze performance using EXPLAIN
-- Run this to see the query plan and identify inefficiencies:
-- EXPLAIN SELECT ... (the above query)

-- 3️⃣ Refactored Query: Reduce unnecessary joins or use indexing
-- Tips for optimization:
--   - Only select columns you need (avoid SELECT *)
--   - Ensure indexes exist on join columns (user_id, property_id, booking_id)
--   - If not all bookings have payments, consider LEFT JOIN for Payments

-- Example refactored query (using LEFT JOIN for Payments):
SELECT
  b.booking_id,
  b.booking_date,
  u.user_id,
  u.first_name,
  u.last_name,
  p.property_id,
  p.property_name,
  pay.payment_id,
  pay.amount,
  pay.payment_date
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;

-- After refactoring, run EXPLAIN again to compare performance:
-- EXPLAIN SELECT ... (the refactored query)
