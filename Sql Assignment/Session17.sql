-- 1. FoodOrders — Classify order amounts

use food_delivery_db;
SELECT
    *,
    CASE
        WHEN amount < 300 THEN 'Small'
        WHEN amount < 1000 THEN 'Medium'
        ELSE 'Large'
    END AS order_category
FROM food_orders;

-- 2. Movies — Classify popularity by rating

SELECT
    *,
    CASE
        WHEN rating >= 8 THEN 'Blockbuster'
        WHEN rating >= 5 THEN 'Hit'
        ELSE 'Average'
    END AS popularity
FROM movies;

-- 3. FlipkartProducts — Categorize prices
SELECT
    *,
    CASE
        WHEN total_amount < 500 THEN 'Budget'
        WHEN total_amount <= 2000 THEN 'Standard'
        ELSE 'Premium'
    END AS price_category
FROM flipkartorders;

-- 4. SpotifyTracks — Categorize track duration
use music_streaming_db;
SELECT
    *,
    CASE
        WHEN duration < 180 THEN 'Short'
        WHEN duration <= 300 THEN 'Medium'
        ELSE 'Long'
    END AS duration_label
FROM playlist;
