-- Yearly trend of GMV, profit margin & AOV
SELECT
    year,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM fact_sale fs
JOIN dim_date dd ON dd.date_id = fs.date_id
GROUP BY year
ORDER BY year;

-- Year & quarterly trend of GMV, profit margin & AOV
SELECT
    CONCAT(year, ' ', quarter) AS quarter_trend,
    ROUND(SUM(fs.sales)) AS total_gmv,
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM fact_sale fs
JOIN dim_date dd ON dd.date_id = fs.date_id
GROUP BY CONCAT(year, ' ', quarter)
ORDER BY CONCAT(year, ' ', quarter);


SELECT 
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin
FROM fact_sale fs

