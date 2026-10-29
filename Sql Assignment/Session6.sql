use food_delivery_db;

-- Task 1: Calculate total amount spent on food orders using SUM()

SELECT SUM(amount) AS total_amount_spent
FROM orders;

-- Task 2: Count songs in Spotify playlists using COUNT()
use music_streaming_db;

CREATE TABLE IF NOT EXISTS spotify_playlists (
    playlist_id INT,
    user_id INT,
    song_id INT
);

INSERT INTO spotify_playlists VALUES
(1, 101, 501),
(1, 101, 502),
(1, 101, 503),
(2, 102, 504),
(2, 102, 505),
(3, 103, 506),
(3, 103, 507),
(3, 103, 508),
(4, 101, 509),
(4, 101, 510);

-- Count the total songs added by each user
SELECT user_id, COUNT(song_id) AS total_songs
FROM spotify_playlists
GROUP BY user_id;

SELECT COUNT(song_id) AS total_songs
FROM spotify_playlists;


-- Task 3: Calculate the average movie rating using AVG() and ROUND()
CREATE TABLE IF NOT EXISTS bookmyshow_reviews (
    review_id INT,
    movie_id INT,
    rating DECIMAL(3,1)
);

INSERT INTO bookmyshow_reviews VALUES
(1, 101, 4.5),
(2, 101, 4.0),
(3, 102, 3.5),
(4, 102, 4.0),
(5, 103, 5.0),
(6, 101, 4.5),
(7, 103, 4.0),
(8, 102, 3.0),
(9, 104, 4.5),
(10, 104, 5.0);

SELECT movie_id,
       ROUND(AVG(rating), 1) AS average_rating
FROM bookmyshow_reviews
GROUP BY movie_id;

-- Task 4: Find minimum and maximum transaction values
CREATE TABLE IF NOT EXISTS paytm_transactions (
    txn_id INT,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO paytm_transactions VALUES
(1, 101, 500.00),
(2, 101, 1200.00),
(3, 102, 250.00),
(4, 102, 3000.00),
(5, 103, 150.00),
(6, 103, 2500.00),
(7, 101, 100.00),
(8, 102, 750.00),
(9, 103, 450.00),
(10, 101, 2000.00);

-- Find the smallest and largest transaction for each user
SELECT user_id,
       MIN(amount) AS minimum_transaction,
       MAX(amount) AS maximum_transaction
FROM paytm_transactions
GROUP BY user_id;

-- Task 5: Calculate order count, average value, and highest order value

CREATE TABLE IF NOT EXISTS myntra_orders (
    order_id INT,
    user_id INT,
    total_price DECIMAL(10,2)
);

INSERT INTO myntra_orders VALUES
(1, 101, 1500.00),
(2, 101, 2500.00),
(3, 102, 800.00),
(4, 102, 1200.00),
(5, 103, 3500.00),
(6, 101, 1000.00),
(7, 103, 2000.00),
(8, 102, 2200.00),
(9, 104, 1800.00),
(10, 104, 2800.00);

SELECT user_id,
       COUNT(order_id) AS total_orders,
       ROUND(AVG(total_price), 2) AS average_order_value,
       MAX(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;


