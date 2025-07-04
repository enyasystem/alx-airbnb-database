
# 🚀 Partitioning Performance Report

## Objective
Evaluate the impact of partitioning the Bookings table by start_date on query performance.

## 1️⃣ Before Partitioning
- Queries filtering by date (e.g., WHERE start_date BETWEEN ...) scanned the entire Bookings table.
- This resulted in slow performance, especially as the table grew larger.
- EXPLAIN showed full table scans and high I/O.

## 2️⃣ After Partitioning
- The Bookings table was partitioned by year using RANGE partitioning on start_date.
- Queries filtering by date now only scan the relevant partitions (e.g., just the 2023 partition for 2023 dates).
- EXPLAIN output showed partition pruning, meaning only necessary partitions were accessed.
- Query execution time improved significantly for date-based queries.

## 3️⃣ Example
```sql
EXPLAIN SELECT * FROM Bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
```
- Before: Full table scan
- After: Only the 2023 partition is scanned

## 💡 Conclusion
Partitioning large tables by date is a powerful optimization for time-based queries. It reduces I/O, speeds up query execution, and keeps performance high as your data grows! ⚡
