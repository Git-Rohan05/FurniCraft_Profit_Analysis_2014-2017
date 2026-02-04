-- % profit margin, GMV & AOV by region
SELECT
    dm.region,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM
    fact_sale fs
JOIN
    dim_customer dm
ON fs.customer_id = dm.customer_id
GROUP BY
    dm.region
ORDER BY
    net_profit_margin DESC;

-- % profit margin, GMV, AOV and order volume by state and region
SELECT
    dc.region,
    dc.state,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM
    fact_sale fs
JOIN
    dim_customer dc
ON fs.customer_id = dc.customer_id
GROUP BY
    dc.region, dc.state
ORDER BY
    -- 1. Sort Regions by their TOTAL Profit Margin (Highest to Lowest)
    (SUM(SUM(fs.Profit)) OVER (PARTITION BY dc.region) / SUM(SUM(fs.Sales)) OVER (PARTITION BY dc.region)) DESC,
    -- 2. Sort States within those regions by their individual Profit Margin
    net_profit_margin DESC;

-- % profit margin, GMV, AOV and order volume by city, state and region
SELECT
    dc.region,
    dc.state,
    dc.city,
    ROUND(SUM(fs.sales)) AS total_gmv,    
    ROUND(SUM(fs.profit) / SUM(fs.net_revenue) * 100, 1) AS net_profit_margin,    
    ROUND(SUM(fs.net_revenue) / COUNT(DISTINCT fs.order_id)) AS avg_order_value_aov
FROM
    fact_sale fs
JOIN
    dim_customer dc
ON fs.customer_id = dc.customer_id
GROUP BY
    dc.region, dc.state, dc.city
ORDER BY
    -- 1. Sort Regions by their TOTAL Profit Margin (Highest to Lowest)
    (SUM(SUM(fs.Profit)) OVER (PARTITION BY dc.region) / SUM(SUM(fs.Sales)) OVER (PARTITION BY dc.region)) DESC,

    -- 2. Sort States by their TOTAL Profit Margin (Highest to Lowest)
    -- We use PARTITION BY state so SQL sums up all cities in that state to find the state's total
    (SUM(SUM(fs.Profit)) OVER (PARTITION BY dc.state) / SUM(SUM(fs.Sales)) OVER (PARTITION BY dc.state)) DESC,

    -- 3. Sort Cities by their individual Profit Margin (Highest to Lowest)
    net_profit_margin DESC;