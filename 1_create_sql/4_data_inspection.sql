-- Check for duplicate order_id rows
SELECT 
    order_id,
    COUNT(*) AS total_count
FROM
    fact_sale
GROUP BY
    order_id
HAVING COUNT(*) > 1;
/* No records found */

-- Check for duplicate order_id rows
SELECT 
    order_id,
    COUNT(*) AS total_count
FROM
    fact_sale
GROUP BY
    order_id
HAVING COUNT(*) > 1;
/* No records found */


SELECT * FROM fact_sale LIMIT 10;

-- Check net revenue column
SELECT
    sales,
    discount,
    net_revenue
FROM
    fact_sale
WHERE
    net_revenue < 0

-- Inspect 5 rows from all tables using JOIN

SELECT 
    fs.order_id,
    fs.customer_id,
    fs.product_id,
    fs.date_id,
    fs.ship_id,
    fs.sales,
    fs.quantity,
    fs.discount,
    fs.profit,
    dc.customer_name,
    dc.segment,
    dc.city,
    dc.state,
    dc.postal_code,
    dc.region,
    dp.product_name,
    dp.category,
    dd.order_date,
    dd.year,
    dd.quarter,
    dd.month,
    dd.day,
    dd.week_of_year,
    ds.ship_date,
    ds.ship_mode
FROM fact_sale fs
LEFT JOIN dim_customer dc ON fs.customer_id = dc.customer_id
LEFT JOIN dim_product dp ON fs.product_id = dp.product_id
LEFT JOIN dim_date dd ON fs.date_id = dd.date_id
LEFT JOIN dim_shipping ds ON fs.ship_id = ds.ship_id
LIMIT 5;


SELECT
  sales,
  quantity,
  discount,
  profit
FROM fact_sale
LIMIT 10
