-- Create Dim_Customer table
CREATE TABLE Dim_Customer (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50)
);

-- Create Dim_Product table
CREATE TABLE Dim_Product (
    Product_ID VARCHAR(25) PRIMARY KEY,
    Product_Name VARCHAR(200),
    Category VARCHAR(100)
);

-- Create Dim_Date table
CREATE TABLE Dim_Date (
    Date_ID INT PRIMARY KEY,
    Order_Date DATE
);

-- Create Dim_Shipping table
CREATE TABLE Dim_Shipping (
    Ship_ID INT PRIMARY KEY,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50)
);

-- Create Fact_Sale table
CREATE TABLE Fact_Sale (
    Order_ID VARCHAR(25) PRIMARY KEY,
    Customer_ID VARCHAR(20),
    Product_ID VARCHAR(25),
    Date_ID INT,
    Ship_ID INT,
    Sales NUMERIC(12,2),
    Quantity INT,
    Discount NUMERIC(5,2),
    Profit NUMERIC(12,2),
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (Ship_ID) REFERENCES Dim_Shipping(Ship_ID)
);