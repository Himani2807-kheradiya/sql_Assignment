use food_delivery_db;

-- Task 1: Find unique payment methods using DISTINCT

CREATE TABLE IF NOT EXISTS orders (
    order_id INT,
    user_name VARCHAR(100),
    amount DECIMAL(10,2),
    payment_method VARCHAR(50)
);

INSERT INTO orders VALUES
(1, 'Aarav', 450, 'UPI'),
(2, 'Priya', 800, 'Credit Card'),
(3, 'Rahul', 350, 'Cash'),
(4, 'Neha', 600, 'UPI'),
(5, 'Riya', 900, 'Debit Card'),
(6, 'Karan', 250, 'Cash'),
(7, 'Meera', 1200, 'Credit Card'),
(8, 'Ishaan', 500, 'UPI'),
(9, 'Ananya', 750, 'Wallet'),
(10, 'Dev', 400, 'Debit Card');

SELECT DISTINCT payment_method
FROM orders;

-- Task 2: Display unique cities in alphabetical order
SELECT DISTINCT city
FROM users
ORDER BY city ASC;

-- Task 3: Select the 5 most recent movie bookings

CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT,
    movie_name VARCHAR(100),
    customer_name VARCHAR(100),
    booking_date DATE
);


INSERT INTO bookings VALUES
(1, 'Jawan', 'Aarav', '2026-10-10'),
(2, 'Pathaan', 'Priya', '2026-10-15'),
(3, 'Animal', 'Rahul', '2026-10-12'),
(4, 'Leo', 'Neha', '2026-10-20'),
(5, 'Dangal', 'Riya', '2026-10-08'),
(6, 'Fighter', 'Karan', '2026-10-25'),
(7, 'Pushpa 2', 'Meera', '2026-10-22'),
(8, 'Drishyam', 'Ishaan', '2026-10-18'),
(9, '3 Idiots', 'Ananya', '2026-10-26'),
(10, 'PK', 'Dev', '2026-10-14');

SELECT *
FROM bookings
ORDER BY booking_date DESC
LIMIT 5;

-- Task 4: Find the 10 highest-selling products
SELECT product_name, stock
FROM products
ORDER BY stock DESC
LIMIT 10;




