use food_delivery_db;
-- Step 1: Select the database and create tables
CREATE TABLE Users1 (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2)
);

INSERT INTO Users1 (user_id, username, city)
VALUES
(1, 'Amit', 'Ahmedabad'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Delhi'),
(4, 'Neha', 'Pune');

INSERT INTO Orders1 (order_id, user_id, product, amount)
VALUES
(101, 1, 'Pizza', 350),
(102, 1, 'Burger', 200),
(103, 2, 'Biryani', 300),
(104, 2, 'Sandwich', 150),
(105, 99, 'Pasta', 250);

-- Task 2: INNER JOIN — Users who have placed orders

SELECT Users1.username, Orders1.product
FROM Users1
INNER JOIN Orders1
ON Users1.user_id = Orders1.user_id;

-- Task 3: LEFT JOIN — All users and their products
SELECT Users1.username, Orders1.product
FROM Users1
LEFT JOIN Orders1
ON Users1.user_id = Orders1.user_id;

-- Task 4: RIGHT JOIN — All orders and their usernames
SELECT Orders1.order_id,
       Orders1.user_id,
       Orders1.product,
       Users1.username
FROM Users1
RIGHT JOIN Orders1
ON Users1.user_id = Orders1.user_id;

DELETE FROM Users1
WHERE user_id = 3;

-- Task 5: Customer segments and total order amount
CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);
INSERT INTO CustomerSegments (segment_id, segment_name)
VALUES
(1, 'Regular'),
(2, 'Premium'),
(3, 'New Customer');

ALTER TABLE Users1
ADD COLUMN segment_id INT;

ALTER TABLE Users1
ADD CONSTRAINT fk_user_segment
FOREIGN KEY (segment_id)
REFERENCES CustomerSegments(segment_id);

UPDATE Users1
SET segment_id = CASE user_id
    WHEN 1 THEN 2
    WHEN 2 THEN 1
    WHEN 3 THEN 3
    WHEN 4 THEN 3
END
WHERE user_id IN (1, 2, 3, 4);

SELECT
    Users1.username,
    CustomerSegments.segment_name,
    COALESCE(SUM(Orders1.amount), 0) AS total_order_amount
FROM Users1
INNER JOIN CustomerSegments
    ON Users1.segment_id = CustomerSegments.segment_id
LEFT JOIN Orders1
    ON Users1.user_id = Orders1.user_id
GROUP BY Users1.user_id,
         Users1.username,
         CustomerSegments.segment_name;
         
         