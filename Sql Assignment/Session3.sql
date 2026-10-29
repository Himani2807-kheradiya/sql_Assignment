-- Task 1  Find restaurants with a rating of 4.5 or higher
SELECT *
FROM restaurants
WHERE rating >= 4.5;

-- TASK:2 Find Action movies released after 2020
INSERT INTO movies VALUES
('Pathaan', 2023, 'Action', 5.9),
('Jawan', 2023, 'Action', 7.0),
('Animal', 2023, 'Action', 6.1),
('War', 2019, 'Action', 6.5),
('Fighter', 2024, 'Action', 6.2),
('Brahmastra', 2022, 'Fantasy', 5.6),
('Leo', 2023, 'Action', 7.2),
('Dangal', 2016, 'Sports', 8.3),
('Pushpa 2', 2024, 'Action', 6.1),
('Bhool Bhulaiyaa 3', 2024, 'Comedy', 5.2);

SELECT *
FROM movies
WHERE release_year > 2020
AND genre = 'Action';

-- Task 3: Products not in Electronics OR priced below 500

SELECT *
FROM products
WHERE category <> 'Electronics'
OR price < 500;

select * from products;

-- Task 4: Users not from Ahmedabad with more than 1000 followers
CREATE TABLE IF NOT EXISTS users (
    id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    followers INT
);


INSERT INTO users VALUES
(1, 'Aarav', 'Ahmedabad', 1500),
(2, 'Priya', 'Surat', 2500),
(3, 'Rahul', 'Mumbai', 800),
(4, 'Neha', 'Vadodara', 1800),
(5, 'Riya', 'Ahmedabad', 3000),
(6, 'Karan', 'Delhi', 1200),
(7, 'Meera', 'Rajkot', 900),
(8, 'Ishaan', 'Pune', 5000),
(9, 'Ananya', 'Surat', 1400),
(10, 'Dev', 'Ahmedabad', 700);

SELECT *
FROM users
WHERE NOT city = 'Ahmedabad'
AND followers > 1000;
