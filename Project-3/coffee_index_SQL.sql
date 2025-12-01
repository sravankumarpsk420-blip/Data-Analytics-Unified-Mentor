-- Coffee Sales Analysis (Mar–Jul 2024)
-- Description: Key analytical queries for understanding sales, revenue, and customer trends.

SELECT *
FROM coffee
LIMIT 10;
# Total No. of transactions
SELECT COUNT(*) AS total_transactions
FROM coffee;
# Total Revenue during the period
SELECT 
    ROUND(SUM(amount), 2) AS total_revenue
FROM coffee;
# Daily total sales trend
SELECT 
    date,
    ROUND(SUM(amount), 2) AS daily_revenue
FROM coffee
GROUP BY date
ORDER BY date;
# Monthly sales trend
SELECT month,
    COUNT(*) AS total_sales,
    ROUND(SUM(amount), 2) AS total_revenue
FROM coffee
GROUP BY month
ORDER BY month;
# Top most popular coffee products by sales distribution
SELECT 
    product,
    COUNT(*) AS total_orders
FROM coffee
GROUP BY product
ORDER BY total_orders DESC
LIMIT 5;
# Revenue contribution by product
SELECT product,
    ROUND(SUM(amount), 2) AS total_revenue,
    ROUND(SUM(amount) * 100.0 / (SELECT SUM(amount) FROM coffee), 2) AS revenue_share_percent
FROM coffee
GROUP BY product
ORDER BY total_revenue DESC;
# Average transaction per order
SELECT 
    ROUND(AVG(amount), 2) AS avg_transaction_value
FROM coffee;
# Hourly distribution
SELECT 
    time AS hour_of_day,
    COUNT(*) AS total_orders,
    ROUND(SUM(amount), 2) AS total_revenue
FROM coffee
GROUP BY time
ORDER BY hour_of_day;
# Sales ditribution by mode of paymnet
SELECT 
    cash_type AS payment_mode,
    COUNT(*) AS total_orders,
    ROUND(SUM(amount), 2) AS total_revenue,
    ROUND(SUM(amount) * 100.0 / (SELECT SUM(amount) FROM coffee), 2) AS percent_share
FROM coffee
GROUP BY cash_type;
# Daily Avg sales per product
SELECT 
    date,
    product,
    ROUND(AVG(amount), 2) AS avg_sales
FROM coffee
GROUP BY date, product
ORDER BY date, avg_sales DESC;
# Highest revenue date
SELECT 
    date,
    ROUND(SUM(amount), 2) AS total_revenue
FROM coffee
GROUP BY date
ORDER BY total_revenue DESC
LIMIT 1;
# Product sales by month
SELECT 
    month AS month,
    product,
    COUNT(*) AS total_orders,
    ROUND(SUM(amount), 2) AS total_revenue
FROM coffee
GROUP BY month, product
ORDER BY month, total_revenue DESC;
# 
SELECT 
    product,
    COUNT(*) AS total_orders,
    ROUND(SUM(amount), 2) AS total_revenue
FROM coffee
GROUP BY product
HAVING COUNT(*) < (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM coffee
        GROUP BY product
    ) AS sub
)
ORDER BY total_orders ASC;
# Hourly Coffee Sales Pattern
SELECT 
    CASE 
        WHEN DAYOFWEEK(date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    HOUR(time) AS hour_of_day,
    ROUND(SUM(amount), 2) AS total_revenue
FROM coffee
GROUP BY day_type, hour_of_day
ORDER BY day_type, hour_of_day;
















