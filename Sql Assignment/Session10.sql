-- 1. Create tables and insert sample records

CREATE TABLE AppOrders (
    order_id INT,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE InStoreOrders (
    order_id INT,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO AppOrders VALUES
(1, 'Rahul', 250.00, '2026-10-20'),
(2, 'Priya', 400.00, '2026-10-21'),
(3, 'Amit', 300.00, '2026-10-22');

INSERT INTO InStoreOrders VALUES
(4, 'Priya', 350.00, '2026-10-20'),
(5, 'Neha', 200.00, '2026-10-21'),
(6, 'Rahul', 500.00, '2026-10-22');

-- 2. UNION — Display unique customer names
SELECT customer_name FROM AppOrders
UNION
SELECT customer_name FROM InStoreOrders;

-- 3. UNION ALL — Display every order
SELECT order_id, customer_name, amount, order_date
FROM AppOrders

UNION ALL

SELECT order_id, customer_name, amount, order_date
FROM InStoreOrders;

-- 4. Demonstrate the difference between UNION and UNION ALL
INSERT INTO AppOrders VALUES
(7, 'Neha', 150.00, '2026-10-23');

INSERT INTO InStoreOrders VALUES
(8, 'Neha', 220.00, '2026-10-23');

SELECT customer_name FROM AppOrders
UNION
SELECT customer_name FROM InStoreOrders;

SELECT customer_name FROM AppOrders
UNION ALL
SELECT customer_name FROM InStoreOrders;

