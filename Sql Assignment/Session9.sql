-- 1. FULL OUTER JOIN — Influencers and Brands
use food_delivery_db;
CREATE TABLE influencers (
    id INT PRIMARY KEY,
    influencer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE brands (
    id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO influencers VALUES
(1, 'Rahul', 'Ahmedabad'),
(2, 'Priya', 'Mumbai'),
(3, 'Amit', 'Delhi');

INSERT INTO brands VALUES
(1, 'Nike', 'Mumbai'),
(2, 'Adidas', 'Ahmedabad'),
(3, 'Puma', 'Pune');

-- FULL OUTER JOIN using LEFT JOIN and RIGHT JOIN
SELECT i.influencer_name, b.brand_name
FROM influencers i
LEFT JOIN brands b
ON i.city = b.city

UNION

SELECT i.influencer_name, b.brand_name
FROM influencers i
RIGHT JOIN brands b
ON i.city = b.city;

-- 2. SELF JOIN — Playlists and Parent Playlists
CREATE TABLE playlist_hierarchy (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO playlist_hierarchy VALUES
(1, 'My Music', NULL),
(2, 'Workout Songs', 1),
(3, 'Chill Music', 1);

-- SELF JOIN to display each playlist and its parent
SELECT
    p.playlist_name AS playlist,
    parent.playlist_name AS parent_playlist
FROM playlist_hierarchy p
LEFT JOIN playlist_hierarchy parent
ON p.parent_playlist_id = parent.id;

-- 3. CROSS JOIN — Users and Offers


CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);


INSERT INTO offers VALUES
(1, '10% Discount'),
(2, 'Free Delivery'),
(3, 'Cashback Offer');

SELECT
    u.name,
    o.offer_title
FROM users u
CROSS JOIN offers o;

-- Flipkart could use these combinations to prepare
-- personalized offers for users before applying targeting rules.

-- 4. SELF JOIN — Employees and 

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Amit', NULL),
(2, 'Rahul', 1),
(3, 'Priya', 1),
(4, 'Neha', 2);

-- Display employees and their managers
SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

SELECT
    name AS employee_name
FROM employees
WHERE manager_id IS NULL;

-- 5. SELF JOIN — Users Living in the Same City
SELECT
    u1.name AS user1,
    u2.name AS user2,
    u1.city
FROM users u1
JOIN users u2
ON u1.city = u2.city
AND u1.id < u2.id;