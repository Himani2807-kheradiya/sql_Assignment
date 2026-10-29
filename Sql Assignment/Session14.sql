-- 1. ROW_NUMBER() — Number each user's orders
use food_delivery_db;
ALTER TABLE Orders
ADD COLUMN order_date DATE;

SELECT * FROM Orders;
ALTER TABLE Orders
ADD COLUMN order_date DATE;
SET SQL_SAFE_UPDATES = 0;

UPDATE Orders SET order_date = '2026-10-20' WHERE order_id = 1;
UPDATE Orders SET order_date = '2026-10-25' WHERE order_id = 2;
UPDATE Orders SET order_date = '2026-10-22' WHERE order_id = 3;
UPDATE Orders SET order_date = '2026-10-21' WHERE order_id = 4;
UPDATE Orders SET order_date = '2026-10-26' WHERE order_id = 5;
UPDATE Orders SET order_date = '2026-10-23' WHERE order_id = 6;
UPDATE Orders SET order_date = '2026-10-24' WHERE order_id = 7;
UPDATE Orders SET order_date = '2026-10-27' WHERE order_id = 8;
UPDATE Orders SET order_date = '2026-10-19' WHERE order_id = 9;
UPDATE Orders SET order_date = '2026-10-28' WHERE order_id = 10;

SELECT order_id, order_date
FROM Orders;
SELECT
    order_id,
    user_name,
    order_date,
    amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_name
        ORDER BY order_date DESC
    ) AS row_num
FROM Orders;

-- v2. RANK() — Rank songs by streams within each artist
CREATE TABLE Songs_stream (
    song_id INT PRIMARY KEY,
    artist VARCHAR(100),
    streams INT
);

INSERT INTO Songs_stream VALUES
(1, 'Arijit Singh', 5000),
(2, 'Arijit Singh', 8000),
(3, 'Arijit Singh', 8000),
(4, 'Taylor Swift', 9000),
(5, 'Taylor Swift', 6000);

SELECT
    song_id,
    artist,
    streams,
    RANK() OVER (
        PARTITION BY artist
        ORDER BY streams DESC
    ) AS song_rank
FROM Songs_stream;

-- 3. DENSE_RANK() — Rank movies within each genre
use food_delivery_db;
SELECT
    movie_name,
    genre,
    rating,
    DENSE_RANK() OVER (
        PARTITION BY genre
        ORDER BY rating DESC
    ) AS movie_rank
FROM Movies;

-- 4. ROW_NUMBER() — Top 3 influencers per platform
drop table influencers;
CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    platform VARCHAR(50),
    followers INT
);

INSERT INTO Influencers VALUES
(1, 'Instagram', 50000),
(2, 'Instagram', 90000),
(3, 'Instagram', 70000),
(4, 'Instagram', 30000),
(5, 'YouTube', 100000),
(6, 'YouTube', 80000),
(7, 'YouTube', 60000),
(8, 'YouTube', 40000);

WITH RankedInfluencers AS (
    SELECT
        id,
        platform,
        followers,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM Influencers
)
SELECT id, platform, followers, row_num
FROM RankedInfluencers
WHERE row_num <= 3
ORDER BY platform, row_num;