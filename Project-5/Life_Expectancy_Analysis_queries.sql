--- "COMPREHENSIVE SQL ANALYSIS OF GLOBAL LIFE EXPECTANCY AND HEALTH INDICATORS"
USE project_db;

--- "Basic Data Analysis"
--- 1. Total entries
SELECT COUNT(*) AS total_entries
FROM life_expectancy;
--- 2. Total Global Poulation
SELECT 
    SUM(population) AS total_global_population
FROM life_expectancy
WHERE year = (SELECT MAX(year) FROM life_expectancy);
--- 3. Average populstion for each Country
SELECT 
    country, 
    ROUND(AVG(population), 2) AS avg_population
FROM life_expectancy
GROUP BY country
ORDER BY avg_population DESC;
--- 4. Number of countries
SELECT COUNT(DISTINCT country) AS Countries
FROM life_expectancy;
SELECT COUNT(DISTINCT year) AS Years
FROM life_expectancy;

--- "Country level Analysis"
--- 1. Average life expectancy
SELECT country, ROUND(AVG(life_expectancy), 2) AS avg_life_expectancy
FROM life_expectancy
GROUP BY country
ORDER BY avg_life_expectancy DESC;
--- 2. Countries with lowest life expectancy
SELECT country, ROUND(AVG(life_expectancy), 2) AS avg_life_expectancy
FROM life_expectancy
GROUP BY country
ORDER BY avg_life_expectancy ASC
LIMIT 5;

--- "Yearly trends & Time series"
--- 1. Trend of global life expectancy over years
SELECT year, ROUND(AVG(life_expectancy), 2) AS global_life_exp
FROM life_expectancy
GROUP BY year
ORDER BY year;
--- 2. Country-wise life expectancy trend
SELECT country, year, life_expectancy
FROM life_expectancy
ORDER BY country, year;
--- 3. Years with highest mortality rate
SELECT year, ROUND(AVG(adult_mortality), 2) AS avg_mortality
FROM life_expectancy
GROUP BY year
ORDER BY avg_mortality DESC
LIMIT 5;

--- "Comparison b/w the developed & developing countries"
--- 1. Average life expectancy by status
SELECT status, ROUND(AVG(life_expectancy), 2) AS avg_life
FROM life_expectancy
GROUP BY status;
--- 2. Comparison of GDP
SELECT status, ROUND(AVG(GDP), 2) AS avg_gdp
FROM life_expectancy
GROUP BY status;
--- 3. Comparison of Disease rate
SELECT status, ROUND(AVG(HIV_AIDS), 2) AS avg_hiv_rate
FROM life_expectancy
GROUP BY status;

--- "Correlation type insights"
SELECT 
    CASE 
        WHEN GDP >= 10000 THEN 'High GDP'
        WHEN GDP >= 3000 THEN 'Medium GDP'
        ELSE 'Low GDP'
    END AS gdp_level,
    ROUND(AVG(life_expectancy), 2) AS avg_life_exp
FROM life_expectancy
GROUP BY gdp_level;
SELECT schooling, ROUND(AVG(life_expectancy), 2) AS avg_life_exp
FROM life_expectancy
GROUP BY schooling
ORDER BY schooling;
SELECT 
    CASE 
        WHEN alcohol < 2 THEN 'Low'
        WHEN alcohol BETWEEN 2 AND 6 THEN 'Moderate'
        ELSE 'High'
    END AS alcohol_level,
    ROUND(AVG(life_expectancy), 2) AS avg_life
FROM life_expectancy
GROUP BY alcohol_level;

--- "Health factor Analysis"
--- 1. Mortality rate
SELECT 
    CASE 
        WHEN adult_mortality BETWEEN 1 AND 200 THEN 'Low Mortality'
        WHEN adult_mortality BETWEEN 201 AND 400 THEN 'Medium Mortality'
        ELSE 'High Mortality'
    END AS mortality_level,
    COUNT(*) AS total_records,
    ROUND(AVG(life_expectancy), 2) AS avg_life_expectancy
FROM life_expectancy
WHERE adult_mortality IS NOT NULL
GROUP BY mortality_level
ORDER BY avg_life_expectancy DESC;
--- 2. Infant death rate
SELECT 
    CASE 
        WHEN infant_deaths BETWEEN 0 AND 50 THEN 'Low Infant Deaths'
        WHEN infant_deaths BETWEEN 51 AND 300 THEN 'Medium Infant Deaths'
        ELSE 'High Infant Deaths'
    END AS infant_death_level,
    COUNT(*) AS total_records,
    ROUND(AVG(life_expectancy), 2) AS avg_life_expectancy
FROM life_expectancy
WHERE infant_deaths IS NOT NULL
GROUP BY infant_death_level
ORDER BY avg_life_expectancy DESC;
--- 3. Immunization(POLIO) impact
 SELECT 
    CASE 
        WHEN polio BETWEEN 3 AND 50 THEN 'Low Immunization'
        WHEN polio BETWEEN 51 AND 80 THEN 'Medium Immunization'
        ELSE 'High Immunization'
    END AS polio_level,
    COUNT(*) AS total_records,
    ROUND(AVG(life_expectancy),2) AS avg_life_expectancy
FROM life_expectancy
WHERE polio IS NOT NULL
GROUP BY polio_level
ORDER BY avg_life_expectancy DESC;
