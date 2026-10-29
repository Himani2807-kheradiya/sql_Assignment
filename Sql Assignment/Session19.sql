select * from orders1;

ALTER TABLE orders1
MODIFY order_id INT NOT NULL AUTO_INCREMENT;

SET SESSION cte_max_recursion_depth = 10001;

INSERT INTO orders1 (user_id, product, amount)
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10000
)
SELECT
    MOD(n, 1000) + 1,
    CASE
        WHEN MOD(n, 4) = 0 THEN 'Laptop'
        WHEN MOD(n, 4) = 1 THEN 'Mobile'
        WHEN MOD(n, 4) = 2 THEN 'Headphones'
        ELSE 'Keyboard'
    END,
    MOD(n * 137, 5000) + 100
FROM numbers;

SELECT COUNT(*) FROM orders1;

-- 1. Run a SELECT query and measure execution time
SELECT *
FROM orders1
WHERE user_id = 101;

-- 2. Create an index and measure again
CREATE INDEX idx_user_id ON orders1(user_id);

SELECT *
FROM orders1
WHERE user_id = 101;

-- 3. Analyze the query using EXPLAIN
EXPLAIN
SELECT *
FROM orders1
WHERE user_id = 101;


EXPLAIN ANALYZE
SELECT *
FROM orders1
WHERE user_id = 101;

-- 4. Fetch products using an index on category

CREATE INDEX idx_category
ON products(category);

SELECT *
FROM products
WHERE category = 'Electronics';

EXPLAIN
SELECT *
FROM products
WHERE category = 'Electronics';

-- 5. Another optimization technique besides indexing
SELECT *
FROM orders1
WHERE user_id = 101;

SELECT order_id, user_id, amount
FROM orders1
WHERE user_id = 101;

EXPLAIN
SELECT order_id, user_id, amount
FROM orders1
WHERE user_id = 101;