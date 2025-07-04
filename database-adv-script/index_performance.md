
# 🚀 Indexes for Database Performance

## Why Use Indexes?
Indexes help the database find and retrieve data faster, especially for columns used in WHERE, JOIN, or ORDER BY clauses. Without indexes, the database scans every row, which is slow for large tables.

## 🕵️‍♂️ How to Identify Columns for Indexing
- Look for columns that appear often in:
  - WHERE conditions (e.g., `WHERE user_id = ...`)
  - JOIN conditions (e.g., `ON Users.user_id = Bookings.user_id`)
  - ORDER BY clauses (e.g., `ORDER BY property_id`)

## 🛠️ Example: Creating Indexes
```sql
CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_properties_property_id ON Properties(property_id);
CREATE INDEX idx_properties_location ON Properties(location);
```

## 📏 Measuring Performance
You can use the `EXPLAIN` command to see how the database executes a query:

```sql
EXPLAIN SELECT * FROM Bookings WHERE user_id = 123;
```

Compare the output before and after adding indexes. If you see 'Using index' in the Extra column, the index is being used and your query should be faster!

## 💡 Tips
- Don’t over-index: Too many indexes can slow down INSERT/UPDATE operations.
- Indexes are most useful for large tables and frequent queries.

Happy optimizing! ⚡
