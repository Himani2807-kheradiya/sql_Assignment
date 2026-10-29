-- Task 1: Top 3 most-followed Spotify artists

CREATE TABLE SpotifyArtists (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers INT
);

INSERT INTO SpotifyArtists VALUES
(1, 'Arijit Singh', 5000000),
(2, 'Taylor Swift', 8000000),
(3, 'Ed Sheeran', 6000000),
(4, 'Shreya Ghoshal', 4000000),
(5, 'Justin Bieber', 7000000);

WITH TopArtists AS (
    SELECT artist_id, name, followers
    FROM SpotifyArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT *
FROM TopArtists;

-- Task 2: Month with the highest Flipkart sales in 2023
CREATE TABLE FlipkartOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO FlipkartOrders VALUES
(1, 101, '2023-01-10', 5000),
(2, 102, '2023-01-15', 3000),
(3, 103, '2023-02-05', 8000),
(4, 104, '2023-02-20', 7000),
(5, 105, '2023-03-12', 4000),
(6, 106, '2023-03-25', 6000);

WITH MonthlyTotals AS (
    SELECT
        MONTH(order_date) AS month,
        SUM(total_amount) AS total_sales
    FROM FlipkartOrders
    WHERE YEAR(order_date) = 2023
    GROUP BY MONTH(order_date)
)
SELECT month, total_sales
FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;

-- Task 3: Recursive CTE to generate the next 7 days
WITH RECURSIVE CalendarDays AS (
    SELECT CURDATE() AS day_date

    UNION ALL

    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM CalendarDays
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT day_date
FROM CalendarDays;

-- Task 4: Restaurants in cities with average ratings above 4.0
CREATE TABLE ZomatoRestaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO ZomatoRestaurants VALUES
(1, 'Spice Garden', 'Ahmedabad', 4.5),
(2, 'Food Hub', 'Ahmedabad', 4.3),
(3, 'Tasty Corner', 'Mumbai', 3.5),
(4, 'Royal Dine', 'Mumbai', 3.8),
(5, 'Green Bowl', 'Delhi', 4.8),
(6, 'City Cafe', 'Delhi', 4.2);

WITH CityRatings AS (
    SELECT city, AVG(rating) AS avg_rating
    FROM ZomatoRestaurants
    GROUP BY city
)
SELECT r.id, r.name, r.city, r.rating
FROM ZomatoRestaurants r
JOIN CityRatings c
    ON r.city = c.city
WHERE c.avg_rating > 4.0;

-- Task 5: IPL teams scoring more than 2,000 runs in 2023
CREATE TABLE IPLMatches (
    match_id INT PRIMARY KEY,
    team VARCHAR(50),
    runs INT,
    match_year INT
);

INSERT INTO IPLMatches VALUES
(1, 'CSK', 450, 2023),
(2, 'CSK', 600, 2023),
(3, 'CSK', 550, 2023),
(4, 'MI', 700, 2023),
(5, 'MI', 650, 2023),
(6, 'MI', 750, 2023),
(7, 'GT', 500, 2023),
(8, 'GT', 600, 2023),
(9, 'GT', 550, 2023),
(10, 'CSK', 400, 2022);


WITH TeamRuns AS (
    SELECT
        team,
        SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT team, total_runs
FROM TeamRuns
WHERE total_runs > 2000
ORDER BY total_runs DESC;

use food_delivery_db;