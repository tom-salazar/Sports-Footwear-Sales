/* Footwear Sales from 2018 to 2026 */
/* Naming Conventions:
	CTE and Table column names: PascalCase - EveryFirstWordLetterInUpperCase
	SQL Queries: Uppercase
	Alias names: snake_case - lower case and word separated by underscore
*/


-- total revenue per year
-- sold by category per year
-- sold by model
-- units sold by brand
-- units sold by gender per year
-- yearly customer ratings
-- yearly customer ratings by country
-- total units sold from 2018 to 2026

-- shoes categories
-- sales channel
-- payment methods
-- brands
-- colors


WITH TotalRevenuePerYear AS
(
	SELECT
		YEAR(OrderDate) AS order_years,
		SUM(RevenueUSD) AS revenue_usd
	FROM footwear_sales
	GROUP BY YEAR(OrderDate)

), -- Total Revenuew per year from 2018 to 2026

SoldByCategory AS
(
	SELECT
		Category,
		YEAR(OrderDate) AS order_years,
		SUM(UnitSold) AS sold_by_category_per_year
	FROM footwear_sales
	GROUP BY Category, YEAR(OrderDate)

), -- units sold by category per year

SoldByModel AS
(
	SELECT
		ModelName,
		SUM(UnitSold) AS sold_by_model
	FROM footwear_sales
	GROUP BY ModelName
), -- sold by models

SoldByBrand AS
(
	SELECT
		Brand, 
		SUM(UnitSold) AS units_sold
	FROM footwear_sales 
	GROUP BY Brand
), -- sold by brands

SoldByGenderPerYear AS
(
	SELECT
		Gender,
		YEAR(OrderDate) AS order_years,
		SUM(UnitSold) AS units_sold_by_gender
	FROM footwear_sales
	GROUP BY Gender, YEAR(OrderDate)
), -- sold by gender per year

CustomerRatingsPerYear AS
(
	SELECT
		YEAR(OrderDate) AS order_years,
		SUM(CustomerRating) AS customers_ratings
	FROM footwear_sales
	GROUP BY YEAR(OrderDate)
), -- customers ratings per year

CustomerRatingsByCountry AS
(
	SELECT
		Country,
		YEAR(OrderDate) AS order_years,
		SUM(CustomerRating) AS customers_ratings
	FROM footwear_sales
	GROUP BY Country, YEAR(OrderDate)
), -- customers ratings by Country per year

TotalUnitsSold AS
(
	SELECT 
		SUM(UnitSold) As total_units_sold
	FROM footwear_sales
), -- total units sold from 2018 to 2026: 75,006

ShoesCategories AS
(
	SELECT 
		Category
	FROM footwear_sales
	GROUP BY Category
), -- Shoes Categories: Gym, Training, Running, Basketball, Lifestyle

SalesChannel AS 
(
	SELECT
		SalesChannel
	FROM footwear_sales
	GROUP BY SalesChannel
), -- Sales Channel: Online, Retail Store

PaymentMethods AS
(
	SELECT
		PaymentMethod
	FROM footwear_sales
	GROUP BY PaymentMethod
), -- Payment Methods: Bank Transfer, Wallet, Cash, Card

Brands AS
(
	SELECT
		Brand
	FROM footwear_sales
	GROUP BY Brand
), -- Brands: Nike, ASICS, New Balance, Adidas, Reebok, Puma

Colors AS
(
	SELECT
		Color
	FROM footwear_sales
	GROUP BY Color
) -- shoes colors: Grey, Red, Black, Blue, White

SELECT * FROM footwear_sales;
