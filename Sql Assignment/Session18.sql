-- 1. Create TopRatedRestaurants view
use food_delivery_db;


INSERT INTO zomato_reviews (name, rating, review)
VALUES
('Food Palace', 4.5, 'Excellent food and service'),
('Spice Garden', 4.2, 'Tasty food and good ambience'),
('Pizza Corner', 3.8, 'Good pizza but slow service'),
('Burger Hub', 4.7, 'Delicious burgers and fast delivery'),
('Food Palace', 4.8, 'Amazing taste and friendly staff'),
('Spice Garden', 3.9, 'Good food but slightly expensive'),
('Pizza Corner', 4.3, 'Fresh pizza and great taste'),
('Burger Hub', 4.1, 'Nice burgers and quick service'),
('South Indian Cafe', 4.6, 'Authentic dosa and idli'),
('South Indian Cafe', 3.7, 'Food was good but seating was limited');

CREATE VIEW TopRatedRestaurants1 AS
SELECT
    name,
    AVG(rating) AS average_rating,
    COUNT(*) AS total_reviews
FROM zomato_Reviews
GROUP BY  name
HAVING AVG(rating) > 4.0;


select * from zomato_reviews;

-- 2. Update the view to include city
CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    r.name,
    r.location,
    AVG(z.rating) AS average_rating,
    COUNT(*) AS total_reviews
FROM Restaurants r
INNER JOIN zomato_reviews z
    ON r.name = z.name
GROUP BY r.id, r.name, r.location
HAVING AVG(z.rating) > 4.0;

SELECT * FROM TopRatedRestaurants;

-- 3. Try updating the average rating
UPDATE TopRatedRestaurants
SET average_rating = 4.5
WHERE name = 'Food Palace';
-- error : 3	23	11:58:15	SELECT * FROM TopRatedRestaurants LIMIT 0, 1000	5 row(s) returned	0.000 sec / 0.000 sec
SELECT * FROM TopRatedRestaurants;

-- 4. Create DailyOrderSummary view

CREATE VIEW DailyOrderSummary AS
SELECT
    DATE(order_date) AS order_day,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_revenue
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY
  AND order_date < CURDATE() + INTERVAL 1 DAY
GROUP BY DATE(order_date);

SELECT * FROM DailyOrderSummary
ORDER BY order_day DESC;