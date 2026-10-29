-- 1. Display the current date and time using NOW()
SELECT NOW() AS CurrentDateTime;

-- 2. Extract year, month, and day from Orders
SELECT
    order_id,
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM Orders;

-- 3. Calculate expected pickup date

CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);

INSERT INTO Deliveries VALUES
(1, '2026-11-02'),
(2, '2026-11-05'),
(3, '2026-11-10');

SELECT
    delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY)
        AS expected_pickup_date
FROM Deliveries;

-- 4. Calculate subscription duration using DATEDIFF()
CREATE TABLE Subscriptions (
    user_id INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO Subscriptions VALUES
(101, '2026-01-01', '2026-02-01'),
(102, '2026-03-10', '2026-04-10'),
(103, '2026-05-01', '2026-05-15');

SELECT
    user_id,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS total_days
FROM Subscriptions;

-- 5. Find users who haven't logged in for more than 30 days

CREATE TABLE AppLogins (
    user_id INT,
    last_login_date DATETIME
);

INSERT INTO AppLogins VALUES
(101, DATE_SUB(NOW(), INTERVAL 45 DAY)),
(102, DATE_SUB(NOW(), INTERVAL 10 DAY)),
(103, DATE_SUB(NOW(), INTERVAL 60 DAY)),
(104, NOW());

SELECT
    user_id,
    last_login_date
FROM AppLogins
WHERE DATEDIFF(NOW(), last_login_date) > 30;

