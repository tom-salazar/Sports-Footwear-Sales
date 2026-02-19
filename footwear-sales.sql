CREATE TABLE Footwear_Sales (
	Order_ID VARCHAR(50), Order_Date DATE, Brand VARCHAR(50), Model_Name VARCHAR(50),
	Category VARCHAR(60), Gender VARCHAR(20), Foot_Size INT, Color VARCHAR(40),
	Base_Price_USD INT, Discount_Percent INT, Final_Price_USD NUMERIC, Units_Sold INT,
	Revenue_USD NUMERIC, Payment_Method VARCHAR(20), Sales_Channel VARCHAR(50),
	Country VARCHAR(30), Customer_Rating NUMERIC
);
SELECT * FROM Footwear_Sales ORDER BY Order_Date ASC;


-------- total revenue per year -----------------
SELECT
    EXTRACT(Year FROM Order_Date) AS Sales_Year,
    SUM(Revenue_USD) AS Yearly_Total_Sales
FROM Footwear_Sales
GROUP BY Sales_Year
ORDER BY Sales_Year;
--------------------------------------------------

SELECT DISTINCT Brand FROM Footwear_Sales;