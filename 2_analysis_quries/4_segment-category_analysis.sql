/* Profit margin share accross segments & product categories */

-- AOV, order volume, total GMV and profit margin by segment
SELECT
    dc.Segment,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM
    fact_sale fs
JOIN
    dim_customer dc
ON fs.customer_id = dc.customer_id
GROUP BY
    dc.Segment
ORDER BY
    net_profit_margin DESC;

-- AOV, order volume, total GMV and profit margin across product categories
SELECT
    dp.Category,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM
    fact_sale fs
JOIN
    Dim_Product dp
ON fs.Product_ID = dp.Product_ID
GROUP BY
    dp.Category
ORDER BY
    net_profit_margin DESC;

-- AOV, order volume, total GMV and profit margin across customer segments & product categories
SELECT
    dc.Segment,
    dp.Category,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM
    fact_sale fs
JOIN
    Dim_Product dp ON fs.Product_ID = dp.Product_ID
JOIN
    dim_customer dc ON fs.Customer_ID = dc.Customer_ID
GROUP BY
    dp.Category, dc.Segment
ORDER BY
    net_profit_margin DESC;


