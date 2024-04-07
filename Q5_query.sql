-- Analyze relationship between trading duration and revenue
SELECT
    s.Name AS StoreName,
	soh.TerritoryID,
	Sales.SalesTerritory.CountryRegionCode,
	Sales.SalesTerritory.name,
    DATEDIFF(day, MIN(soh.OrderDate), MAX(soh.OrderDate)) AS TradingDurationInDays,
	DATEDIFF(day, MIN(soh.OrderDate), MAX(soh.OrderDate)) / 365.0 AS TradingDurationInYears,
    SUM(soh.TotalDue) AS TotalSales
FROM
    Sales.SalesOrderHeader soh
JOIN
    Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN
    Sales.Store s ON c.StoreID = s.BusinessEntityID
INNER JOIN Sales.SalesTerritory
ON soh.TerritoryID = Sales.SalesTerritory.TerritoryID
GROUP BY
    s.Name, soh.TerritoryID, Sales.SalesTerritory.name, Sales.SalesTerritory.CountryRegionCode
ORDER BY
    TotalSales DESC;

