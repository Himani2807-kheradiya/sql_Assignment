use food_delivery_db;
-- Task 1: Select all columns from restaurants

CREATE TABLE IF NOT EXISTS restaurants (
    id INT,
    name VARCHAR(100),
    location VARCHAR(100),
    rating DECIMAL(2,1)
);


INSERT INTO restaurants VALUES
(1, 'Spice Garden', 'Ahmedabad', 4.5),
(2, 'Food Corner', 'Surat', 4.2);
INSERT INTO restaurants (id, name, location, rating)
VALUES
(3, 'The Grand Thali', 'Ahmedabad', 4.6),
(4, 'Pizza Palace', 'Surat', 4.1),
(5, 'Burger Hub', 'Vadodara', 4.0),
(6, 'Royal Dine', 'Rajkot', 4.7),
(7, 'Food Junction', 'Ahmedabad', 3.9),
(8, 'Spicy Treat', 'Gandhinagar', 4.3),
(9, 'Cafe Delight', 'Surat', 4.4),
(10, 'Urban Kitchen', 'Vadodara', 4.2),
(11, 'Tasty Bites', 'Bhavnagar', 3.8),
(12, 'Green Leaf', 'Ahmedabad', 4.5),
(13, 'The Noodle House', 'Rajkot', 4.1),
(14, 'BBQ Nation', 'Surat', 4.6),
(15, 'Sweet Cravings', 'Gandhinagar', 4.0),
(16, 'South Spice', 'Vadodara', 4.3),
(17, 'Pasta Corner', 'Ahmedabad', 4.2);

SELECT * FROM restaurants;

-- Task 2: Select only name and rating

CREATE TABLE IF NOT EXISTS zomato_reviews (
    name VARCHAR(100),
    rating DECIMAL(2,1),
    review VARCHAR(200)
);



INSERT INTO zomato_reviews VALUES
('Spice Garden', 4.5, 'Good food'),
('Food Corner', 4.2, 'Nice service');

SELECT name, rating
FROM zomato_reviews;

-- Task 3: Rename columns using AS

CREATE TABLE IF NOT EXISTS movies (
    movie_name VARCHAR(100),
    release_year INT
	genre VARCHAR(50),
    rating DECIMAL(2,1)
);
drop table movies;

CREATE TABLE IF NOT EXISTS movies (
    movie_name VARCHAR(100),
    release_year INT,
    genre VARCHAR(50),
    rating DECIMAL(2,1)
);


INSERT INTO movies VALUES
('3 Idiots', 2009, 'Comedy-Drama', 8.4),
('Dangal', 2016, 'Sports-Drama', 8.3),
('PK', 2014, 'Comedy-Drama', 8.1),
('Lagaan', 2001, 'Sports-Drama', 8.1),
('Sholay', 1975, 'Action', 8.1),
('Taare Zameen Par', 2007, 'Drama', 8.3),
('Drishyam', 2015, 'Thriller', 8.2),
('Chhichhore', 2019, 'Comedy-Drama', 8.3),
('Bajrangi Bhaijaan', 2015, 'Drama', 8.1),
('Queen', 2013, 'Comedy-Drama', 8.1),
('Andhadhun', 2018, 'Thriller', 8.2),
('Zindagi Na Milegi Dobara', 2011, 'Adventure', 8.2),
('Swades', 2004, 'Drama', 8.2),
('Barfi!', 2012, 'Romance-Drama', 8.1),
('Article 15', 2019, 'Crime-Drama', 8.1),
('Munna Bhai M.B.B.S.', 2003, 'Comedy', 8.1),
('Chak De! India', 2007, 'Sports-Drama', 8.1),
('Dil Chahta Hai', 2001, 'Comedy-Drama', 8.1),
('Kahaani', 2012, 'Thriller', 8.1),
('Bhaag Milkha Bhaag', 2013, 'Sports-Drama', 8.2);

SELECT
    movie_name AS Title,
    release_year AS 'Year Released'
FROM movies;

-- Task 4: Select all columns from products and add a comment

CREATE TABLE IF NOT EXISTS products (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 45000.00, 10),
(2, 'Mouse', 'Electronics', 500.00, 50),
(3, 'Keyboard', 'Electronics', 1200.00, 30),
(4, 'Smartphone', 'Electronics', 25000.00, 15),
(5, 'Headphones', 'Electronics', 1800.00, 25),
(6, 'T-Shirt', 'Clothing', 599.00, 100),
(7, 'Jeans', 'Clothing', 1499.00, 40),
(8, 'Jacket', 'Clothing', 2499.00, 20),
(9, 'Rice', 'Groceries', 800.00, 60),
(10, 'Cooking Oil', 'Groceries', 180.00, 80),
(11, 'Sugar', 'Groceries', 50.00, 100),
(12, 'Notebook', 'Stationery', 80.00, 70),
(13, 'Pen Pack', 'Stationery', 120.00, 90),
(14, 'Water Bottle', 'Accessories', 350.00, 35),
(15, 'Backpack', 'Accessories', 999.00, 25),
(16, 'Monitor', 'Electronics', 12000.00, 12),
(17, 'Shoes', 'Footwear', 1999.00, 30),
(18, 'Socks', 'Clothing', 150.00, 75),
(19, 'Tea Powder', 'Groceries', 250.00, 45),
(20, 'Desk Lamp', 'Electronics', 700.00, 18);

-- This query displays all columns from the products table
SELECT * FROM products;

