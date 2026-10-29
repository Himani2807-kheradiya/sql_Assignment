-- 1. Restaurants with ratings above the average

SELECT name, rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);

-- 2. Products with their category's average price

SELECT
    p.product_name,
    p.price,
    p.category,
    (
        SELECT AVG(p2.price)
        FROM Products p2
        WHERE p2.category = p.category
    ) AS avg_category_price
FROM Products p;

-- 3. Users who created more playlists than the average
use music_streaming_db;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50)
);

INSERT INTO Users VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha');

SELECT
    u.username,
    pc.playlist_count
FROM (
    SELECT user_id, COUNT(*) AS playlist_count
    FROM Playlists
    GROUP BY user_id
) AS pc
JOIN Users u
    ON u.user_id = pc.user_id
WHERE pc.playlist_count > (
    SELECT AVG(playlist_count)
    FROM (
        SELECT COUNT(*) AS playlist_count
        FROM Playlists
        GROUP BY user_id
    ) AS avg_counts
);

-- 4. Users who placed orders above the average order amount

use  food_delivery_db;

SELECT DISTINCT user_id
FROM Orders1
WHERE amount > (
    SELECT AVG(amount)
    FROM Orders1
);
 