USE project_db;
SHOW TABLES;
## Check how many rows and missing values exist
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN sold IS NULL THEN 1 ELSE 0 END) AS missing_sold,
    SUM(CASE WHEN tag_text IS NULL THEN 1 ELSE 0 END) AS missing_tag
FROM furniture;
# Duplicate product_names
SELECT product_title, COUNT(*) 
FROM furniture
GROUP BY product_title
HAVING COUNT(*) > 1;
SELECT * FROM furniture LIMIT 5;
# Price and Profitability
SELECT 
  ROUND(AVG(price), 2) AS avg_price,
  ROUND(AVG(original_price), 2) AS avg_original_price,
  ROUND(AVG(original_price - price), 2) AS avg_discount
FROM furniture;
# Total & Average Sales
SELECT 
  ROUND(SUM(price * sold), 2) AS total_revenue,
  ROUND(AVG(price * sold), 2) AS avg_revenue_per_item
FROM furniture;
# Top selling products
SELECT 
  product_title, 
  sold, 
  price, 
  ROUND((price * sold), 2) AS revenue
FROM furniture
ORDER BY sold DESC
LIMIT 10;
# Discount Analysis
SELECT 
  product_title,
  original_price, 
  price, 
  ROUND((original_price - price) / original_price * 100, 2) AS discount_percent
FROM furniture
ORDER BY discount_percent DESC
LIMIT 10;
# Count of Shipping mode
SELECT 
    CASE 
        WHEN tag_text = 0.00 THEN 'Free Shipping'
        WHEN tag_text = 'NULL' THEN 'Others'
        ELSE 'Shipping Cost'
    END AS shipping_type,
    COUNT(*) AS num_products
FROM furniture
GROUP BY shipping_type;
# Avg. price & sales by shipping mode
SELECT 
    CASE 
        WHEN tag_text = 0.00 THEN 'Free Shipping'
        WHEN tag_text = 'Others' THEN 'Others'
        ELSE 'Shipping Cost'
    END AS shipping_type,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(sold), 2) AS avg_sold
FROM furniture
GROUP BY shipping_type;
# Correlation
SELECT 
  ROUND(
    (
      (AVG(price * sold) - AVG(price) * AVG(sold)) /
      (SQRT(
        (AVG(price * price) - POW(AVG(price), 2)) * 
        (AVG(sold * sold) - POW(AVG(sold), 2))
      ))
    ), 
  3) AS price_sales_correlation
FROM furniture;

SELECT 
    product_title,
    CASE 
        WHEN tag_text = 0.00 THEN 'Free Shipping'
        WHEN tag_text = 'Null' THEN 'Others'
        ELSE 'Shipping Cost'
    END AS shipping_type,
    ROUND(SUM(price * sold), 2) AS total_revenue,
    RANK() OVER (
        PARTITION BY 
            CASE 
                WHEN tag_text = 0.00 THEN 'Free Shipping'
                WHEN tag_text = 'Null' THEN 'Others'
                ELSE 'Shipping Cost'
            END 
        ORDER BY SUM(price * sold) DESC
    ) AS revenue_rank
FROM furniture
GROUP BY product_title, shipping_type;
################################
SELECT 
    CASE 
        WHEN tag_text = 0.00 THEN 'Free Shipping'
        WHEN tag_text = 'Others' THEN 'Others'
        ELSE 'Shipping Cost'
    END AS shipping_type,
    ROUND(SUM(price * sold), 2) AS total_revenue
FROM furniture
GROUP BY shipping_type
ORDER BY total_revenue DESC
LIMIT 1;
SELECT 
    ROUND(AVG(((original_price - price) / original_price) * 100), 2) 
    AS avg_discount_percentage
FROM furniture
WHERE original_price > 0;
SELECT 
  ROUND(
    (
      (AVG(price * sold) - AVG(price) * AVG(sold)) /
      (SQRT(
        (AVG(price * price) - POW(AVG(price), 2)) * 
        (AVG(sold * sold) - POW(AVG(sold), 2))
      ))
    ), 
  3) AS price_sales_correlation
FROM furniture;
SELECT 
    ROUND(
      (SUM(CASE WHEN tag_text = 0.00 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 
    2) AS free_shipping_percentage
FROM furniture;
SELECT 
    product_title,
    ROUND(SUM(price * sold), 2) AS total_revenue
FROM furniture
GROUP BY product_title
ORDER BY total_revenue DESC
LIMIT 10;



