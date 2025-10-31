-- "Summer Olympics Medals Analysis (1976-2008)"
## Objective: To analyze trends, performancd and participation patterns in Summer Olympic
## data using SQL queries for insightful decision-making. The project provies country-wise,
## gender-wise medal trends, highlights top performers and identifies evolving Olympic dominance.
-- Basic Data Exploration
# Counting total rows
SELECT COUNT(*)
AS total_records
FROM medals;
# Checking dISTINCT VALUES
SELECT COUNT(DISTINCT Country)
AS total_countries
FROM medals;
SELECT COUNT(DISTINCT Year)
AS total_olympic_years
FROM medals;
# Listing all uniques sports and disciplines
SELECT DISTINCT Sport 
FROM medals;
SELECT DISTINCT Discipline
FROM medals;
-- Medal Distribution Analysis
# Total Medals per country
SELECT Country,
COUNT(Medal) AS total_medals
FROM medals
GROUP BY Country
ORDER BY total_medals DESC;
# Medals by type
SELECT Country,
	SUM(CASE WHEN Medal='Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN MEdal='Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal='Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM medals
GROUP BY Country
ORDER BY Gold DESC;
# Top 3 Countries by total medals per year
SELECT Year, Country, total_medals
FROM (
    SELECT 
        Year,
        Country,
        COUNT(Medal) AS total_medals,
        RANK() OVER (PARTITION BY Year ORDER BY COUNT(Medal) DESC) AS rnk
    FROM medals
    GROUP BY Year, Country
) ranked
WHERE rnk <= 3
ORDER BY Year, rnk;
-- GENDER ANALYSIS
# Male vs Female Participants over years
SELECT Year, Gender, COUNT(DISTINCT Athlete) AS participants
FROM medals
GROUP BY Year, Gender
ORDER BY Year;
# Gender-wise medal share
SELECT Gender, COUNT(Medal) AS total_medals
FROM medals
GROUP BY Gender;
-- ATHLETE AND EVENT INSIGHTS
# Most decorated athletes
SELECT Athlete, Country,
COUNT(Medal) AS total_medals
FROM medals
GROUP BY Athlete, Country
ORDER BY total_medals DESC
LIMIT 10;
# Events with most medal oppurtunities
SELECT Sport, Discipline,
COUNT(DISTINCT Event) AS total_events
FROM medals
GROUP BY Sport, Discipline
ORDER BY total_events DESC;
-- TREND ANALYSIS
# Country's performance trend over years
SELECT Country, Year,
COUNT(Medal) AS total_medals
FROM medals
WHERE Country='India'
GROUP BY Country, Year
ORDER BY Year;
# Most improved country
WITH medal_count AS (
    SELECT 
        Country, 
        Year, 
        COUNT(Medal) AS total_medals
    FROM medals
    GROUP BY Country, Year
)
SELECT 
    Country,
    MAX(total_medals) - MIN(total_medals) AS medal_growth
FROM medal_count
GROUP BY Country
ORDER BY medal_growth DESC;
# Most Successful Athletes
SELECT Athlete, Country, COUNT(Medal) AS total_medals
FROM medals
GROUP BY Athlete, Country
ORDER BY total_medals DESC
LIMIT 10;
SELECT 
    Athlete,
    Country,
    COUNT(Medal) AS total_medals
FROM medals
WHERE Country = 'India'
GROUP BY Athlete, Country
ORDER BY total_medals DESC
LIMIT 10;
# Top Athletes from every country
SELECT 
    Country,
    Discipline,
    Athlete, 
    total_medals
FROM (
    SELECT 
        Country,
        Discipline,
        Athlete,
        COUNT(Medal) AS total_medals,
        RANK() OVER (PARTITION BY Country, Discipline ORDER BY COUNT(Medal) DESC) AS rnk
    FROM medals
    GROUP BY Country, Discipline, Athlete
) ranked
WHERE rnk = 1
ORDER BY total_medals DESC;
