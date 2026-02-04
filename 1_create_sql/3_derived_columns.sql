-- Create net revenue column
ALTER TABLE fact_sale
ADD COLUMN Net_Revenue NUMERIC(8, 2)

-- Upate net revenue column
UPDATE fact_sale
SET Net_Revenue = sales * (1 - discount)

-- Create year column
ALTER TABLE Dim_Date
ADD COLUMN Year INT

-- Update year column
UPDATE Dim_Date
SET Year = EXTRACT(YEAR FROM Order_Date)

-- Create quarter column
ALTER TABLE Dim_Date
ADD COLUMN Quarter VARCHAR(5)

-- Update quarter column
UPDATE Dim_Date
SET Quarter = 'Q' || CEIL(EXTRACT(MONTH FROM Order_Date) / 3)

-- Create month column
ALTER TABLE Dim_Date
ADD COLUMN Month INT

-- Update month column
UPDATE Dim_Date
SET Month = EXTRACT(MONTH FROM Order_Date)

-- Create day column
ALTER TABLE Dim_Date
ADD COLUMN Day INT

-- Update day column
UPDATE Dim_Date
SET Day = EXTRACT(DAY FROM Order_Date)

-- Create Week of year column
ALTER TABLE Dim_Date
ADD COLUMN Week_of_Year VARCHAR(5)

-- Update Week of year column
UPDATE Dim_Date
SET Week_of_Year = 'W' || TO_CHAR(Order_Date, 'IW');

SELECT * FROM Dim_Date