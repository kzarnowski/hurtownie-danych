--  zad 1
with dailySum as (SELECT
	[Date],
	sum([Amount]) as total
FROM [AdventureWorksDW2019].[dbo].[FactFinance]
GROUP BY [Date])


SELECT
	Date,
	avg(total) over (order by Date rows between 2 preceding and current row) as Avg3Day
FROM
	dailySum

-- zad 2
select 
	OrderMonth,
	isnull([0], 0) as [0], 
	isnull([1], 0) as [1],
	isnull([2], 0) as [2],
	isnull([3], 0) as [3],
	isnull([4], 0) as [4],
	isnull([5], 0) as [5],
	isnull([6], 0) as [6],
	isnull([7], 0) as [7],
	isnull([8], 0) as [8],
	isnull([9], 0) as [9],
	isnull([10], 0) as [10]
from  (
	select 
		SalesTerritoryKey,
		month(OrderDate) as OrderMonth,
		sum(SalesAmount) as SalesAmount
	from
		[AdventureWorksDW2019].[dbo].[FactInternetSales]
	where 
		year(OrderDate) = 2011
	group by 
		month(OrderDate), SalesTerritoryKey
) as SourceTable  
PIVOT  
(  
  sum(SalesAmount)  
  for SalesTerritoryKey IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]) 
) as PivotTable;

-- zad 3
select 
	OrganizationKey,
	DepartmentGroupKey,
	sum(amount) as amount
from 
	[AdventureWorksDW2019].[dbo].[FactFinance]
group by 
	rollup(OrganizationKey, DepartmentGroupKey)
order by OrganizationKey

-- zad 4
select 
	OrganizationKey,
	DepartmentGroupKey,
	sum(amount) as amount
from
	[AdventureWorksDW2019].[dbo].[FactFinance]
group by
	cube(OrganizationKey, DepartmentGroupKey)
order by
	OrganizationKey

-- zad 5, zad 6
with cte as(
	select 
		OrganizationKey, 
		sum(Amount) as amount
	from 
		[AdventureWorksDW2019].[dbo].[FactFinance]
	where 
		year(Date) = 2012
	group by
		OrganizationKey
)

select distinct
	cte.OrganizationKey,
	OrganizationName,
	cte.Amount,
	PERCENT_RANK() over (order by Amount) as percentile,
	stdev(cte.amount) over (order by cte.amount) AS std
from
	cte
join 
	DimOrganization on cte.OrganizationKey = DimOrganization.OrganizationKey
order by
	cte.OrganizationKey

