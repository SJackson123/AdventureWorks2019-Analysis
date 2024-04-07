-- find all tables with a column for personType
-- dbo table
-- Person table
--SELECT * FROM INFORMATION_SCHEMA.columns WHERE COLUMN_NAME='PersonType';

-- The different PersonTypes are: IN, EM, SP, SC, VC, GC
-- SC = Store Contact, 
-- IN = Individual (retail) customer, 
-- SP = Sales person,
-- EM = Employee (non-sales),
-- VC = Vendor contact,
-- GC = General contact
--SELECT 
--	DISTINCT  PersonType 
--  FROM [AdventureWorks2019].[Person].[Person]


SELECT 
	Person.BusinessEntityID,
	PersonType,
	JobTitle,
	SickLeaveHours
FROM Person.Person
LEFT JOIN HumanResources.Employee
ON Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID


--SELECT DISTINCT PersonType
--FROM HumanResources.Employee