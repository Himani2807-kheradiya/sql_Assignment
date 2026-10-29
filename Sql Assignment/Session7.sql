use food_delivery_db;

-- 1. Total orders placed by each user

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO food_orders (order_id, user_id, amount)
VALUES
(1, 101, 250),
(2, 102, 400),
(3, 101, 300),
(4, 103, 150),
(5, 102, 200),
(6, 101, 500);

SELECT user_id, COUNT(*) AS total_orders
FROM food_orders
GROUP BY user_id;

-- 2. Total amount spent by each payment method
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30)
);

INSERT INTO transactions
(transaction_id, user_id, amount, payment_method)
VALUES
(1, 101, 500, 'UPI'),
(2, 102, 300, 'Card'),
(3, 101, 200, 'UPI'),
(4, 103, 700, 'Cash'),
(5, 102, 400, 'Card'),
(6, 104, 600, 'UPI');

SELECT payment_method, SUM(amount) AS total_amount
FROM transactions
GROUP BY payment_method;


-- 3. Genres with total box office collection above 10 crore

select * from movies;

ALTER TABLE movies
ADD COLUMN box_office_collection DECIMAL(10,2);
SET SQL_SAFE_UPDATES = 0;
UPDATE movies
SET box_office_collection = CASE movie_name
    WHEN '3 Idiots' THEN 400
    WHEN 'Dangal' THEN 2000
    WHEN 'PK' THEN 800
    WHEN 'Lagaan' THEN 65
    WHEN 'Sholay' THEN 50
    WHEN 'Taare Zameen Par' THEN 100
    WHEN 'Drishyam' THEN 100
    WHEN 'Chhichhore' THEN 200
    WHEN 'Bajrangi Bhaijaan' THEN 900
    WHEN 'Queen' THEN 100
    WHEN 'Andhadhun' THEN 450
    WHEN 'Zindagi Na Milegi Dobara' THEN 150
    WHEN 'Swades' THEN 30
    WHEN 'Barfi!' THEN 175
    WHEN 'Article 15' THEN 100
    WHEN 'Munna Bhai M.B.B.S.' THEN 100
    WHEN 'Chak De! India' THEN 100
    WHEN 'Dil Chahta Hai' THEN 60
    WHEN 'Kahaani' THEN 100
    WHEN 'Bhaag Milkha Bhaag' THEN 200
    WHEN 'Pathaan' THEN 1050
    WHEN 'Jawan' THEN 1100
    WHEN 'Animal' THEN 900
    WHEN 'War' THEN 475
    WHEN 'Fighter' THEN 350
    WHEN 'Brahmastra' THEN 430
    WHEN 'Leo' THEN 600
    WHEN 'Pushpa 2' THEN 1800
    WHEN 'Bhool Bhulaiyaa 3' THEN 400
    ELSE 0
END;

SET SQL_SAFE_UPDATES = 1;

SELECT genre,
       SUM(box_office_collection) AS total_collection
FROM movies
GROUP BY genre
HAVING SUM(box_office_collection) > 10;

-- 4. Users with combined playlist duration above 2 hours

use  music_streaming_db;

CREATE TABLE playlist (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    song_id INT,
    duration INT
);

INSERT INTO playlist (playlist_id, user_id, song_id, duration)
VALUES
(1, 101, 201, 2400),
(2, 101, 202, 2600),
(3, 101, 203, 2500),
(4, 102, 204, 1800),
(5, 102, 205, 2000),
(6, 103, 206, 3000),
(7, 103, 207, 2800),
(8, 104, 208, 1500);

SELECT user_id,
       SUM(duration) AS total_duration
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;