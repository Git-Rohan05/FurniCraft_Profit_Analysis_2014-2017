/* fill up with something */

-- Check for discount ranges distribution and % share in fact sale
SELECT 
    CASE
        WHEN discount = 0.10 THEN '10%'
        WHEN discount = 0.15 THEN '15%'
        WHEN discount = 0.20 THEN '20%'
        WHEN discount = 0.30 THEN '30%'
        WHEN discount = 0.32 THEN '32%'
        WHEN discount = 0.40 THEN '40%'
        WHEN discount = 0.45 THEN '45%'
        WHEN discount = 0.50 THEN '50%'
        WHEN discount = 0.60 THEN '60%'
        WHEN discount = 0.70 THEN '70%'
        ELSE 'No Discount'
        END AS discount_rate,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.sales) * 100) AS net_profit_margin,    
    COUNT(DISTINCT fs.order_id) AS order_volume
FROM
    fact_sale fs
GROUP BY
    Discount
ORDER BY net_profit_margin DESC;


-- Total profit and order volume rank by discount rates
SELECT
    CASE
        WHEN discount = 0.10 THEN '10%'
        WHEN discount = 0.15 THEN '15%'
        WHEN discount = 0.20 THEN '20%'
        WHEN discount = 0.30 THEN '30%'
        WHEN discount = 0.32 THEN '32%'
        WHEN discount = 0.40 THEN '40%'
        WHEN discount = 0.45 THEN '45%'
        WHEN discount = 0.50 THEN '50%'
        WHEN discount = 0.60 THEN '60%'
        WHEN discount = 0.70 THEN '70%'
        ELSE 'No Discount'
        END AS discount_rate,
    category,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    COUNT(DISTINCT fs.order_id) AS order_volume
FROM fact_sale fs
JOIN dim_product dp
ON fs.product_id = dp.product_id
GROUP BY discount_rate, category
ORDER BY net_profit_margin DESC;

-- Testing metrics
select
    discount,
    sum(sales) as sales,
    sum(net_revenue) as revenue,
    sum(profit) as profit,
    round(sum(fs.profit) / sum(fs.net_revenue) * 100, 1) AS new_net_profit_margin,    
    round(sum(fs.profit) / sum(fs.sales) * 100, 1) AS net_profit_margin
from fact_sale fs
group by discount
limit 10
