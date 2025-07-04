-- 🎯 Objective: Create indexes to optimize query performance

-- 1️⃣ Identify high-usage columns
-- Common columns used in WHERE, JOIN, or ORDER BY clauses:
--   - Users: user_id, email
--   - Bookings: booking_id, user_id, property_id
--   - Properties: property_id, location

-- 2️⃣ Create indexes for these columns
CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_users_email ON Users(email);

CREATE INDEX idx_bookings_booking_id ON Bookings(booking_id);
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

CREATE INDEX idx_properties_property_id ON Properties(property_id);
CREATE INDEX idx_properties_location ON Properties(location);

-- Use EXPLAIN to analyze query plans:
-- Example (before and after creating indexes):
-- EXPLAIN SELECT * FROM Bookings WHERE user_id = 123;
-- EXPLAIN SELECT * FROM Properties WHERE location = 'Lagos';

-- You can also use EXPLAIN ANALYZE for more detailed performance metrics (if supported by your SQL database):
-- EXPLAIN ANALYZE SELECT * FROM Bookings WHERE user_id = 123;
-- EXPLAIN ANALYZE SELECT * FROM Properties WHERE location = 'Lagos';

-- After running EXPLAIN, compare the output to see if indexes are being used (look for 'Using index' in the Extra column).
