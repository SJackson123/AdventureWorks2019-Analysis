-- I got the data from the view called 'vStoreWithDemographics'. 
-- This is data from the Sales.Store but stored in the link (what is the name of this link)
-- the data in the link is: 

--<StoreSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey">
--  <AnnualSales>800000</AnnualSales>
--  <AnnualRevenue>80000</AnnualRevenue>
--  <BankName>United Security</BankName>
--  <BusinessType>BM</BusinessType>
--  <YearOpened>1996</YearOpened>
--  <Specialty>Mountain</Specialty>
--  <SquareFeet>21000</SquareFeet>
--  <Brands>2</Brands>
--  <Internet>ISDN</Internet>
--  <NumberEmployees>13</NumberEmployees>
--</StoreSurvey>


--SELECT * FROM INFORMATION_SCHEMA.columns WHERE COLUMN_NAME='YearOpened';

--SELECT * FROM Sales.store

SELECT 
	Demographics.value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/AnnualSales)[1]', 'money') AS AnnualSales,
	Demographics.value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/SquareFeet)[1]', 'integer') AS [SquareFeet] 
FROM Sales.Store