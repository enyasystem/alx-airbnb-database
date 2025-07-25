
-- 🎯 Objective: Partition the Bookings table to optimize queries on large datasets


-- Example: Creating a partitioned Bookings table (MySQL syntax)
CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY,
  user_id INT,
  property_id INT,
  start_date DATE,
  end_date DATE,
  -- ... other columns ...
  INDEX idx_start_date (start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- 2️⃣ Test query performance on the partitioned table
-- Example: Fetch bookings in 2023
EXPLAIN SELECT * FROM Bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 3️⃣ Brief Report
-- Before partitioning, queries on Bookings scanned the entire table, resulting in slow performance for large datasets.
-- After partitioning by start_date, queries that filter by date range only scan relevant partitions, reducing I/O and improving speed.
-- EXPLAIN output should show partition pruning (only relevant partitions are accessed).
