SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM OrdersArchive;
SELECT * FROM Products;

SELECT 
o.OrderID, 
c.FirstName AS CustomerName ,
p.Product AS ProductName,
o.Sales AS Amount,
p.Price AS ProductPrice,
e.FirstName as SalesPerson
FROM Orders o 
LEFT JOIN Customers c SELECT 
	CustomerID ,
	Score,
	COALESCE(Score,0) Score2,
	AVG(Score) OVER () AvgScores,
	AVG(COALESCE(Score,0)) OVER() AvgScores2
FROM Customers
ON o.CustomerID = c.CustomerID 
LEFT JOIN Employees e 
ON o.SalesPersonID = e.EmployeeID 
LEFT JOIN Products p 
ON o.ProductID = p.ProductID 

SELECT  FirstName, LastName
FROM Customers

INTERSECT

SELECT  FirstName, LastName
FROM Employees

ORDER BY FirstName;

SELECT 
'Orders' AS SourceTable,
OrderID , ProductID
FROM Orders

UNION
 
SELECT 
'OrdersArchieve' AS SourceTable,
OrderID , ProductID
FROM OrdersArchive 

ORDER BY OrderID;

-- SQL FUNCTIONS

SELECT CONCAT(FirstName,' ' ,LastName) AS FullName
FROM Customers;

SELECT UPPER(CONCAT(FirstName,' ' ,LastName)) AS FullName
FROM Customers;

SELECT LOWER(CONCAT(FirstName,' ' ,LastName)) AS FullName
FROM Customers;
SELECT 
	CustomerID ,
	Score,
	COALESCE(Score,0) Score2,
	AVG(Score) OVER () AvgScores,
	AVG(COALESCE(Score,0)) OVER() AvgScores2
FROM Customers
SELECT 
UPPER(CONCAT(' ',FirstName,' ' ,LastName)) AS BeforeTrim,
LEN(UPPER(CONCAT('SELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID; ',FirstName,' ' ,LastName))) as Lengthh,
TRIM(UPPER(CONCAT(FirstName,' ' ,LastName))) AS FullName,
LEN(TRIM(UPPER(CONCAT(FirstName,' ' ,LastName))))
FROM Customers;

SELECT * FROM Customers;

SELECT 
'123-456-789-0',
REPLACE('123-456-789-0','-',' ') AS CleanedNumber
SELECT  LEFT(FirstName,2) AS FirstTwo, RIGHT(LastName,2) AS LastTwo
FROM Customers

SELECT FirstName,
SUBSTRING(TRIM(FirstName),2,LEN(FirstName)) AS SubString
FROM Customers

-- NUMBER FUNCTIONS

SELECT 3.14, ROUND(3.146,2)
SELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;
SELECT -10, ABS(-10), ABS(7) -- ABS function converts negative to positive

SELECT * FROM Orders;

-- DATE FUNCTIONS

SELECT OrderID, OrderDate, ShipDate, CreationTime
FROM Orders;


SELECT 
	OrderID ,
	CreationTime,
	'DAY: ' + FORMAT(OrderDate, 'ddd MMM')+
	' Q' + DATENAME(quarter,OrderDate) + ' '+
	FORMAT(OrderDate, 'yyyy hh:mm:ss tt') AS CustomFormat,
	FORMAT(OrderDatSELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;e,'dd - MMMM - yyyy'),
	FORMAT(OrderDate,'dd( dddd ) - MM( MMMM ) - yyyy'),
	FORMAT(OrderDate ,'dd/MM/yyyy','ja-JP') AS FormattedDate,
	FORMAT(1234,'D','fr-FR') AS NumberFormat,
	YEAR(CreationTime) AS Year,
	DATEPART(quarter,CreationTime) AS CreationDateQuarter,
	MONTH(CreationTime) AS Month,
	DAY(CreationTime) AS Day,
	DATEPART(weekday,CreationTime) AS CreationDateDay,
	DATEPART(week,CreationTime) AS CreationDateWeek,
	DATEPART(hh,CreationTime) AS CreationTimeHour,
	DATEPART(mm,CreationTime) AS CreationTimeMinute,
	DATEPART(ss,CreationTime) AS CreationTimeSecond,
	DATEPART(yyyy,OrderDate) AS OrderDateYear,
	DATEPART(mm,OrderDate) AS OrderDateMonth,
	DATEPART(dd,OrderDate) AS OrderDateDay,
	'2025-10-11' AS HardCoded,
	GETDATE() AS Today
FROM OrdersSELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;
ORDER BY CreationTime ASC;

SELECT FORMAT(OrderDate, 'MMM yyyy') AS OrderDate,
COUNT(*) AS NoOfOrders
FROM Orders
GROUP BY FORMAT(OrderDate, 'MMM yyyy');




SELECT 
	CONVERT(INT, '123') AS [String to Integer],
	CONVERT(DATE,'2025-08-20') AS [String to Date],
	CONVERT(DATE, CreationTime) AS [DATETIME to DATE],
	CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style 32],
	CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style 34]
FROM 	
	Orders; 

SELECT
	OrderDate,
	DATEADD(year, -10,OrderDate) AS UpdatedYear,
	DATEADD(month, 1SELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;4,OrderDate) AS UpdatedMonth,
	DATEADD(day,31,OrderDate) AS UpdatedDate
FROM 
	Orders;

SELECT *,
	DATEDIFF(year,BirthDate , GETDATE()) AS Age
FROM Employees;

SELECT 'FAILURE',
	DATEDIFF(day, '2025-06-27',GETDATE()) AS [Days Wasted];

SELECT OrderID,
	OrderDate,
	ShipDate,
	DATEDIFF( day,OrderDate ,ShipDate ) AS [Day to Ship]
FROM 
	Orders;SELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;

SELECT 
	MONTH(OrderDate) AS [Order Month],
	AVG(DATEDIFF(day, OrderDate, ShipDate))
FROM Orders
GROUP BY MONTH(OrderDate );

SELECT 
	OrderID,
	OrderDate AS [Current Order Date],
	LAG(OrderDate ) OVER (ORDER BY OrderDate ) AS [Previous Order Date],
	DATEDIFF(day, LAG(OrderDate ) OVER (ORDER BY OrderDate ), OrderDate) AS [Number of day]
FROM Orders;

SELECT 
CAST(OrderDate AS DATE) AS OrderDate
(
	ISDATE('123') AS OrderDate UNION
	ISDATE('12-03-2020') UNION
	ISDATE('2025/12/23') UNION
	ISDATE('2020/01/12') 
)	

SELECT 
	OrderDate,
	ISDATE(OrderDate),
	CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
		ELSE '9999-01-01'
	END NewOrderDate
FROM
(
	SELECT '12-03-2020' AS OrderDate UNION 
	SELECT '2025/12/23' UNION 
	SELECT '2020/01/12' UNION
	SELECT '123'
)t
WHERE ISDATE(OrderDate) = 0

SELECT * 
FROM 
	Orders
WHERE 
	ShipAddress IS NOT NULL AND BillAddress IS NOT NULL;

SELECT 
	CustomerID ,
	Score,
	COALESCE(Score,0) Score2,
	AVG(Score) OVER () AvgScores,
	AVG(COALESCE(Score,0)) OVER() AvgScores2
FROM Customers

SELECT * FROM Customers;

SELECT CustomerID,
	CONCAT(COALESCE(FirstName,' '),' ',COALESCE(LastName,' ')) AS FullName,
	COALESCE(Score,0) + 10 AS Score
	--SUM(Score2,10)
FROM 
	Customers;



SELECT CustomerID, Score,
CASE WHEN Score IS NULL THEN 1 ELSE 0 END Flag
FROM Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END,Score ASC;

SELECT OrderID, Sales,  Quantity,
Sales / COALESCE(Quantity,0) AS Rate
FROM Orders;

SELECT * FROM Employees;

SELECT 
	EmployeeID,
	FirstName, LastName,
	Gender,
	CASE 
		WHEN Gender = 'M' THEN 'MALE'
		WHEN Gender = 'F' THEN 'FEMALE'
		ELSE NULL
	END AS GenderE
FROM 
	Employees;

SELECT *
FROM Customers;

SELECT CustomerID,
	FirstName, LastName,
	Country,
	CASE
		WHEN Country = 'Germany' THEN 'GE'
		WHEN Country = 'USA' THEN 'US'
		ELSE 'n/a'
	END AS CountryCode	
FROM Customers;
	
SELECT *
FROM Customers;

SELECT CustomerID,
	FirstName, LastName,
	Score,
	AVG(Score) OVER() AS AvgCustomer,
	CASE
		WHEN Score IS NULL THEN 0
		ELSE Score
	END ScoreClean,
	AVG(CASE
			WHEN Score IS NULL THEN 0
			ELSE Score
		END) OVER () AvgCustomerClean
	
FROM Customers;

SELECT 
	CustomerID,
	SUM(CASE 
			WHEN Sales > 30 THEN 1
			ELSE 0
		END) TotalOrders
	
FROM Orders
GROUP BY CustomerID;SELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;

SELECT COUNT(*) [No of Orders], SUM(Sales) AS TotalSales,
	AVG(Sales) AverageSales,
	MAX(Sales) HighestSale,
	MIN(Sales) LowestSale
FROM Orders
GROUP BY CustomerID;

SELECT 
	OrderId,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM Orders;

SELECT o.Sales,p.Product ,p.Category,o.OrderDate,
	AVG(o.Sales) OVER(PARTITION BY o.ProductID ,p.Category 
						ORDER BY o.OrderDate 
						ROWS UNBOUNDED PRECEDING)
FROM Orders o
INNER JOIN Products p
ON o.ProductID = p.ProductID;

SELECT * FROM Orders;

SELECT CustomerID ,ProductID,Sales,
	SUM(Sales) OVER(PARTITION BY CustomerID ,ProductID) TotalSales
FROM Orders;

SELECT OrderID , OrderDate, ProductID, OrderStatus,  Sales,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER (PARTITION BY ProductID) TotalProductSales,
	SUM(Sales) OVER (PARTITION BY ProductID, OrderStatus) SalesByProductsAndStatus
FROM Orders;

SELECT OrderID , FORMAT(OrderDate, 'MMM yyyy') AS OrderDate
FROM Orders;

SELECT  FORMAT(OrderDate, 'MMM yyyy') AS OrderDate, ProductID,  Sales,
	RANK() OVER(PARTITION BY MONTH(OrderDate) ORDER BY Sales DESC) RANKS,
	SUM(Sales) OVER() TotalSales
	-- SUM(Sales) OVER (PARTITION BY ProductID) TotalProductSales,
	-- SUM(Sales) OVER (PARTITION BY ProductID, OrderStatus) SalesByProductsAndStatus
FROM Orders;

SELECT OrderID , FORMAT(OrderDate, 'MMM yyyy') AS OrderDate, Sales,
	RANK() OVER ( ORDER BY Sales ) [Rank Sales]
FROM Orders;

SELECT AVG(Sales) OVER (ORDER BY OrderDate
	ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AverageSales
FROM Orders;


	
 



























