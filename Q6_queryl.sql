-- Analyse relationship between trading duration and revenue
SELECT
	s.BusinessEntityID,
    s.Name AS StoreName,
	SquareFeet,
	NumberEmployees, 
    SUM(soh.TotalDue) AS TotalSales
FROM
    Sales.SalesOrderHeader soh
JOIN
    Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN
    Sales.Store s ON c.StoreID = s.BusinessEntityID
INNER JOIN Sales.vStoreWithDemographics
ON s.BusinessEntityID = Sales.vStoreWithDemographics.BusinessEntityID
GROUP BY
    s.Name,
	s.BusinessEntityID,
	SquareFeet,
	NumberEmployees