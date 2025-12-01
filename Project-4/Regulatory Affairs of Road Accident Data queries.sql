USE project_db;

-- Total Number of cases recorded
SELECT COUNT(*) AS total_rows
FROM accident;

-- Total Number of Accidents recorded
SELECT SUM(count) AS total_accidents
FROM accident;

-- Total Accidents by cause Category
SELECT category, SUM(count) as total_accidents
FROM accident
GROUP BY category
ORDER BY total_accidents DESC;

-- Top 10 most common cause subcategories
SELECT subcategory, SUM(count) AS total_count
FROM accident
GROUP BY subcategory
ORDER BY total_count
LIMIT 10;

-- Outcomes distribution by Accidents
SELECT outcome, SUM(count) AS total_cases
FROM accident
GROUP BY outcome
ORDER BY total_cases;

-- Contribution % of Category-wise
SELECT category,
	SUM(count) AS total_accidents,
    ROUND((SUM(count)*100/(SELECT SUM(count) FROM accident)), 2) AS percent
FROM accident
GROUP BY category
ORDER BY percent DESC;

-- City wise break-up of accidents by outcomes
SELECT city, outcome, SUM(count) AS cases
FROM accident
GROUP BY city, outcome
ORDER BY city, cases DESC;

-- Cities with the most dangerous cause category in each city
SELECT city, category, total_accidents
FROM(
	SELECT
		city,
        category,
        SUM(count) AS total_accidents,
        ROW_NUMBER() OVER (PARTITION BY city ORDER BY SUM(count) DESC) AS rn
	FROM accident
    GROUP BY city, category
) AS ranked
WHERE rn=1;

-- Percentage of fatal accidents in each city
SELECT city,
		ROUND(
			(SUM(CASE WHEN outcome='Persons Killed' THEN count END)*100)/
            SUM(count), 2)
            AS fatal_percent
		FROM accident
        GROUP BY city
        ORDER BY fatal_percent DESC;
        
#######################        
-- City with highest number of accidents
SELECT city, SUM(count) AS total_accidents
FROM accident
GROUP BY city
ORDER BY total_accidents DESC
LIMIT 1;

SELECT category, subcategory, SUM(`count`) AS total_accidents
FROM accident
WHERE city = (
    SELECT city
    FROM accident
    GROUP BY city
    ORDER BY SUM(`count`) DESC
    LIMIT 1
)
GROUP BY category, subcategory
ORDER BY total_accidents DESC
LIMIT 5;

-- City with lowest number of accidents
SELECT city, SUM(count) AS total_accidents
FROM accident
GROUP BY city
ORDER BY total_accidents ASC
LIMIT 1;

SELECT category, subcategory, SUM(`count`) AS total_accidents
FROM accident
WHERE city = (
    SELECT city
    FROM accident
    GROUP BY city
    ORDER BY SUM(`count`) ASC
    LIMIT 1
)
GROUP BY category, subcategory
ORDER BY total_accidents ASC
LIMIT 5;