-- Task 1: Find restaurants whose names end with 'Cafe'


INSERT INTO restaurants VALUES
(1, 'Sunrise Cafe', 'Ahmedabad', 4.5),
(2, 'Royal Restaurant', 'Surat', 4.2),
(3, 'Green Leaf Cafe', 'Vadodara', 4.6),
(4, 'Food Corner', 'Surat', 4.1),
(5, 'City Cafe', 'Rajkot', 4.3),
(6, 'Spice Garden', 'Ahmedabad', 4.7),
(7, 'Moonlight Cafe', 'Surat', 4.4),
(8, 'Pizza Palace', 'Vadodara', 4.0),
(9, 'Dream Cafe', 'Gandhinagar', 4.2),
(10, 'Urban Kitchen', 'Ahmedabad', 4.1);
SELECT *
FROM restaurants
WHERE name LIKE '%Cafe';

Select * from restaurants;

-- Task 2: Products priced between ₹500 and ₹1,500

SELECT *
FROM products
WHERE price BETWEEN 500 AND 1500;

-- Task 3: Users from Ahmedabad, Surat, or Vadodara

SELECT *
FROM users
WHERE city IN ('Ahmedabad', 'Surat', 'Vadodara');

-- Task 4: Songs where the artist name contains 'ar'

use music_streaming_db;

CREATE TABLE IF NOT EXISTS songs (
    song_name VARCHAR(100),
    artist_name VARCHAR(100)
);
INSERT INTO songs VALUES
('Kesariya', 'Arijit Singh'),
('Tum Hi Ho', 'Arijit Singh'),
('Shape of You', 'Ed Sheeran'),
('Believer', 'Imagine Dragons'),
('Perfect', 'Ed Sheeran'),
('Hawayein', 'Arijit Singh'),
('Roar', 'Katy Perry'),
('Channa Mereya', 'Arijit Singh'),
('Love Me Like You Do', 'Ellie Goulding'),
('Cheap Thrills', 'Sia');

SELECT *
FROM songs
WHERE artist_name LIKE '%ar%';

