use project_prod

--- porównanie sprzeda¿y 3 dostawców dla ka¿dego miesi¹ca i roku
select 
	SalesYear,
	SalesMonth,
	isnull([Bolt], 0) as Bolt, 
	isnull([Uber], 0) as Uber,
	isnull([Volt], 0) as Volt
from  (
	select 
		dc.carrier_name as CarrierName,
		dd.Year as SalesYear,
		dd.Month as SalesMonth,
		sum(cast([amount] AS DECIMAL(10,2))) as SalesAmount
	from
		FactSales fs
	join
		DIMCarrier dc on fs.CarrierKey = dc.CarrierKey
	join
		DIMDate dd on fs.DateKey = dd.DateKey
	group by 
		dd.Year, dd.Month, dc.carrier_name
) as SourceTable  
PIVOT  
(  
  sum(SalesAmount)  
  for CarrierName IN ([Bolt],[Uber],[Volt]) 
) as PivotTable
order by SalesYear, SalesMonth;


-- œrednia krocz¹ca z sumarycznej sprzeda¿y z ostatniego tygodnia
select
	[WeekOfYear],
	[Date],
	avg(amount) over (order by [Date] rows between 6 preceding and current row) WeeklyAmount 
from (
	select
		sum(cast([amount] as decimal(10,2))) amount,
		[Date],
		[WeekOfYear]
	from
		FactSales s
	left join DIMDate d on s.DateKey = d.DateKey
	group by [Date], [WeekOfYear]
) DailyAmount;


-- ranking stanów w USA na podstawie sumarycznej sprzeda¿y gdzie dostawc¹ by³ Bolt
select
	rank() over (partition by dr.carrier_name order by sum(cast([amount] AS DECIMAL(10,2))) desc) as No,
	dc.state as State,
	sum(cast([amount] AS DECIMAL(10,2))) as sales_amount
from 
	FactSales fs
inner join 
	DIMCustomer dc on fs.CustomerKey = dc.CustomerKey
inner join
	DIMCarrier dr on fs.CarrierKey = dr.CarrierKey
inner join 
	DIMDate dd on fs.DateKey = dd.DateKey
where 
	dc.country='United States' and dr.carrier_name = 'Bolt'
group by dc.state, dr.carrier_name;


