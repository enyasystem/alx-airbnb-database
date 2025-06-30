-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('uuid-user-1', 'Emeka', 'Okafor', 'emeka.okafor@gmail.com', 'hash123', '08034567891', 'guest'),
  ('uuid-user-2', 'Ngozi', 'Uche', 'ngozi.uche@yahoo.com', 'hash456', '08123456780', 'host'),
  ('uuid-user-3', 'Tunde', 'Akinwale', 'admin@airnaija.com', 'adminpass', NULL, 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('uuid-prop-1', 'uuid-user-2', 'Ikoyi Mansion', 'Luxury 3-bedroom apartment in Ikoyi, Lagos', 'Lagos', 55000.00),
  ('uuid-prop-2', 'uuid-user-2', 'Obudu Hills Retreat', 'A serene getaway spot in Cross River', 'Cross River', 30000.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('uuid-booking-1', 'uuid-prop-1', 'uuid-user-1', '2025-07-01', '2025-07-03', 110000.00, 'confirmed'),
  ('uuid-booking-2', 'uuid-prop-2', 'uuid-user-1', '2025-08-10', '2025-08-12', 60000.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('uuid-pay-1', 'uuid-booking-1', 110000.00, 'credit_card');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('uuid-review-1', 'uuid-prop-1', 'uuid-user-1', 5, 'Top-notch service! The place was clean and peaceful.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('uuid-msg-1', 'uuid-user-1', 'uuid-user-2', 'Good evening, is your Obudu retreat available next weekend?'),
  ('uuid-msg-2', 'uuid-user-2', 'uuid-user-1', 'Hi Emeka, yes it is. Feel free to book it before it’s taken.');
