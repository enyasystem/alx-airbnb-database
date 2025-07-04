# 📚 FULL OUTER JOIN Simulation in SQL with UNION

Welcome, 👋

This README explains how to simulate a FULL OUTER JOIN in SQL using the `UNION` operator, especially for databases like MySQL (before 8.0) that do not support FULL OUTER JOIN natively.

## 🧩 Why Simulate FULL OUTER JOIN?
- Some SQL databases do not have a direct FULL OUTER JOIN.
- We often need to combine all records from two tables, even if there is no match between them.

## 🏗️ How Does the Simulation Work?
We use two types of joins and combine their results:

1. **LEFT JOIN**: Gets all records from the first table (Users), and matching records from the second table (Bookings). If there is no match, the result is NULL on the Bookings side.
2. **RIGHT JOIN**: Gets all records from the second table (Bookings), and matching records from the first table (Users). If there is no match, the result is NULL on the Users side.
3. **UNION**: Combines the results of both joins and removes duplicates.

## 📝 Example Query
```sql
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
```

## 🔍 What Does This Achieve?
- ✅ All users, even those without bookings
- ✅ All bookings, even those without a matching user
- ✅ No duplicate rows (thanks to UNION)

## 💡 Tips
- Always use UNION (not UNION ALL) to avoid duplicate rows.
- You can add `ORDER BY` at the end if you want sorted results.

## 📖 Learn More
- [SQL JOIN Types Explained](https://www.sqltutorial.org/sql-join/)
- [MySQL Documentation on JOINs](https://dev.mysql.com/doc/refman/8.0/en/join.html)

## 🚀 Try It Out
