
# 🚀 SQL Query Optimization Report

## Objective
Analyze and optimize a complex query to improve performance by reducing execution time and resource usage.

## 1️⃣ Initial Query
The original query retrieves all bookings with user, property, and payment details using multiple JOINs:

```sql
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
JOIN Payments pay ON b.booking_id = pay.booking_id;
```

## 2️⃣ Performance Analysis
- Used `EXPLAIN` to analyze the query plan.
- Observed possible full table scans and high cost due to joining large tables and possibly missing indexes.
- Noticed that some bookings may not have payments, so INNER JOIN on Payments could exclude some bookings.

## 3️⃣ Optimization Steps
- Added indexes on join columns: `user_id`, `property_id`, `booking_id`.
- Changed the JOIN on Payments to a `LEFT JOIN` to include all bookings, even those without payments.
- Selected only the necessary columns (avoided `SELECT *`).

## 4️⃣ Refactored Query

```sql
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
```

## 5️⃣ Results
- After optimization, `EXPLAIN` showed improved query plan with index usage and reduced cost.
- Query now returns all bookings, including those without payments.
- Execution time decreased, especially on large datasets.

## 💡 Lessons Learned
- Indexes on join/filter columns greatly improve performance.
- Use LEFT JOIN when not all related records exist.
- Always analyze queries with `EXPLAIN` before and after changes.
