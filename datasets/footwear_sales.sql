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
	* 
	FROM
		(SELECT
			YEAR(OrderDate) AS years,
			SUM(RevenueUSD) AS revenue_usd
		FROM footwear_sales
		GROUP BY YEAR(OrderDate))rev_year
		ORDER BY years
), -- Total Revenuew per year from 2018 to 2026

SoldByCategory AS
(
	SELECT
	*
	FROM
		(SELECT
			Category,
			YEAR(OrderDate) AS years,
			SUM(UnitSold) AS sold_by_category_per_year
		FROM footwear_sales
		GROUP BY Category, YEAR(OrderDate))c_sold
		ORDER BY years
), -- units sold by category per year

SoldByModel AS
(
	SELECT
	* 
	FROM
		(SELECT
			ModelName,
			SUM(UnitSold) AS sold_by_model
		FROM footwear_sales
		GROUP BY ModelName)md_sold
		ORDER BY sold_by_model DESC
), -- sold by models

SoldByBrand AS
(
	SELECT
	* 
	FROM
		(SELECT
			Brand, 
			SUM(UnitSold) AS units_sold
		FROM footwear_sales 
		GROUP BY Brand)b_sold
), -- sold by brands

SoldByGenderPerYear AS
(
	SELECT
	*
	FROM
		(SELECT
			Gender,
			YEAR(OrderDate) AS years,
			SUM(UnitSold) AS units_sold_by_gender
		FROM footwear_sales
		GROUP BY Gender, YEAR(OrderDate))gen_sold
		ORDER BY years
), -- sold by gender per year

CustomerRatingsPerYear AS
(
	SELECT
	*
	FROM 
		(SELECT
			YEAR(OrderDate) AS years,
			SUM(CustomerRating) AS customers_ratings
		FROM footwear_sales
		GROUP BY YEAR(OrderDate))c_ratings
		ORDER BY years
), -- customers ratings per year

CustomerRatingsByCountry AS
(
	SELECT
	*
	FROM
		(SELECT
			Country,
			YEAR(OrderDate) years,
			SUM(CustomerRating) AS customers_ratings
		FROM footwear_sales
		GROUP BY Country, YEAR(OrderDate))cc_ratings
		ORDER BY years
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
