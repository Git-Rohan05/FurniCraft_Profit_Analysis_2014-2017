/* Following commands are used in pgAdmin's PSQL TOOL to import the data into tables */

-- Import data to Dim_Customer
\copy Dim_Customer FROM 'C:\Users\Rohan Thorat\Documents\Portfolio Projects\Profit_Margin_Analysis\0_resources\Dim_Customer.csv' DELIMITER ',' CSV HEADER;

-- Import data to Dim_Product
\copy Dim_Product FROM 'C:\Users\Rohan Thorat\Documents\Portfolio Projects\Profit_Margin_Analysis\0_resources\Dim_Product.csv' DELIMITER ',' CSV HEADER;

-- Import data to Dim_Date
\copy Dim_Date FROM 'C:\Users\Rohan Thorat\Documents\Portfolio Projects\Profit_Margin_Analysis\0_resources\Dim_Date.csv' DELIMITER ',' CSV HEADER;

-- Import data to Dim_Shipping
\copy Dim_Shipping FROM 'C:\Users\Rohan Thorat\Documents\Portfolio Projects\Profit_Margin_Analysis\0_resources\Dim_Shipping.csv' DELIMITER ',' CSV HEADER;

-- Import data to Fact_Sale
\copy Fact_Sale FROM 'C:\Users\Rohan Thorat\Documents\Portfolio Projects\Profit_Margin_Analysis\0_resources\Fact_Sale.csv' DELIMITER ',' CSV HEADER;