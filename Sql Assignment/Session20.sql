-- Task 1. Import IPL CSV into MySQL
CREATE DATABASE IF NOT EXISTS ipl_db;
USE ipl_db;

USE ipl_db;
SELECT * FROM ipl_matches LIMIT 5;

USE ipl_db;

SELECT * FROM ipl_matches LIMIT 10;

SELECT COUNT(*) AS total_matches
FROM ipl_matches;

-- Task 2. Find Mumbai Indians matches and export to CSV

SELECT *
FROM ipl_matches
WHERE team1 = 'Mumbai Indians'
   OR team2 = 'Mumbai Indians';
   
-- Task 3. Connect Excel and count matches per team

SELECT team, COUNT(*) AS total_matches
FROM (
    SELECT team1 AS team FROM ipl_matches
    UNION ALL
    SELECT team2 AS team FROM ipl_matches
) AS teams
GROUP BY team
ORDER BY total_matches DESC;

-- Task 4. Connect Power BI and create a wins chart
USE ipl_db;

SELECT * FROM mi_wins;

SELECT COUNT(*) AS total_wins
FROM mi_wins;
