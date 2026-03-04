
SELECT * FROM footwear_sales;


SELECT DISTINCT(Category) FROM footwear_sales; -- shoes categories


SELECT YEAR(OrderDate) AS Years, SUM(RevenueUSD) AS TotalRevenue FROM footwear_sales
	GROUP BY YEAR(OrderDate) ORDER BY YEAR(OrderDate); -- total revenue per year


SELECT DISTINCT(PaymentMethod) FROM footwear_sales; -- payment methods


SELECT YEAR(OrderDate) AS Years, SUM(CustomerRating) AS YearlyRatings FROM footwear_sales
	GROUP BY YEAR(OrderDate) ORDER BY YEAR(OrderDate); -- yearly customer ratings


SELECT DISTINCT(Brand) FROM footwear_sales; -- brands


SELECT ModelName, SUM(UnitSold) AS UnitSolds FROM footwear_sales
	GROUP BY ModelName ORDER BY ModelName; -- sold by model


SELECT Category, YEAR(OrderDate) AS Years, SUM(UnitSold) Sold_by_Category FROM footwear_sales
	GROUP BY Category, YEAR(OrderDate) ORDER BY YEAR(OrderDate); -- sold by category per year


SELECT Brand, COUNT(OrderID) AS TotalCustomers FROM footwear_sales
	GROUP BY Brand; -- total units sold by brand


SELECT Gender, YEAR(OrderDate) AS Years, SUM(UnitSold) AS UnitSold FROM footwear_sales
	GROUP BY Gender, YEAR(OrderDate) ORDER BY YEAR(OrderDate); -- units sold by gender per year


SELECT SUM(UnitSold) AS TotalUnitsSold FROM footwear_sales; -- 75,006 unit sold from year 2018 to 2026


SELECT DISTINCT(SalesChannel) FROM footwear_sales;

SELECT DISTINCT(Color) FROM footwear_sales;


SELECT DISTINCT(Country), YEAR(OrderDate) AS Years, SUM(CustomerRating) AS CustomerRatings FROM footwear_sales
	GROUP BY Country, YEAR(OrderDate) ORDER BY YEAR(OrderDate); -- customers ratings by country per year