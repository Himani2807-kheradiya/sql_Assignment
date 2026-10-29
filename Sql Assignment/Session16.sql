-- 1. Combine first and last names using CONCAT()


SELECT
    CONCAT(username, ' ', city) AS full_name
FROM users1;


-- 2. Display song titles in uppercase using UPPER()
use music_streaming_db;
SELECT UPPER(playlist_name) AS uppercase_title
FROM playlists;

select * from playlists;

INSERT INTO playlists (playlist_id, user_id, playlist_name)
VALUES
(1, 101, 'spotify_song_1'),
(2, 102, 'spotify_song_2'),
(3, 103, 'spotify_song_3');

-- 3. Remove extra spaces using TRIM()

CREATE TABLE food_items (
    item_id INT PRIMARY KEY,
    item_code VARCHAR(50)
);

INSERT INTO food_items VALUES
(1, '  ZOM101  '),
(2, ' SWG202 '),
(3, '  FD303  ');
	
    
SELECT item_id, TRIM(item_code) AS cleaned_item_code
FROM food_items;

-- 4. Extract the numeric part using RIGHT()
SELECT RIGHT(release_year, 7) AS movie_number
FROM movies;


-- 5. Replace dashes with underscores using REPLACE()
SELECT
    REPLACE(product_name, '-', '_') AS updated_sku_code
FROM products;

