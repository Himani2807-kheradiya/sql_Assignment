-- 1. Total amount of all orders using OVER()

CREATE TABLE total_Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_amount DECIMAL(10,2),
    app_name VARCHAR(50)
);

INSERT INTO total_Orders VALUES
(1, 101, 250, 'Zomato'),
(2, 102, 400, 'Swiggy'),
(3, 101, 150, 'Flipkart'),
(4, 103, 500, 'Zomato'),
(5, 104, 300, 'Swiggy'),
(6, 102, 200, 'Flipkart'),
(7, 103, 350, 'Zomato'),
(8, 101, 450, 'Swiggy'),
(9, 104, 600, 'Flipkart'),
(10, 102, 100, 'Zomato');

SELECT
    order_id,
    user_id,
    order_amount,
    app_name,
    SUM(order_amount) OVER() AS total_order_amount
FROM total_Orders;

-- 2. Average order amount for each user
SELECT
    user_id,
    order_id,
    order_amount,
    AVG(order_amount) OVER(
        PARTITION BY user_id
    ) AS user_avg_amount
FROM total_Orders;

-- 3. Total song duration for each user
use music_streaming_db;

SELECT
    song_id,
    user_id,
    duration,
    SUM(duration) OVER(
        PARTITION BY user_id
    ) AS total_duration_sec
FROM Playlist;

-- 4. Movie ratings, movie averages, and differences

CREATE TABLE MovieRatings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    movie_name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO MovieRatings VALUES
(1, 101, 'Inception', 5),
(2, 102, 'Inception', 4),
(3, 103, 'Inception', 3),
(4, 101, 'Interstellar', 5),
(5, 102, 'Interstellar', 4),
(6, 103, 'Interstellar', 5),
(7, 104, 'Inception', 4);

SELECT
    rating_id,
    user_id,
    movie_name,
    rating,
    AVG(rating) OVER(
        PARTITION BY movie_name
    ) AS avg_movie_rating,
    rating - AVG(rating) OVER(
        PARTITION BY movie_name
    ) AS rating_difference
FROM MovieRatings;

