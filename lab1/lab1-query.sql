use lab1;

-- zadanie 1
select
	avg(pr.total_price) as avg_price
from (
	select
		sum(p.price * od.quantity) as total_price
	from
		orders as o
		join order_details as od on o.order_id = od.order_id
		join pizzas as p on od.pizza_id = p.pizza_id
	where
		o.date = '2015-02-18'
	group by o.order_id
) as pr;

-- zadanie 2
select
	oi.order_id
from (
	select
		od.order_id,
		string_agg(pt.ingredients, ',') as ingredients
	from
		order_details as od
		join pizzas as p on od.pizza_id = p.pizza_id
		join pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
	where
		ingredients not like '%Pineapple%'
	group by
		od.order_id
) as oi
order by 
	oi.order_id;


-- zadanie 3
with orders_price as (
	select
		o.order_id,
		sum(p.price * od.quantity) as total_price
	from
		orders as o
		join order_details as od on o.order_id = od.order_id
		join pizzas as p on od.pizza_id = p.pizza_id
	where
		o.date like '2015-02-%'
	group by o.order_id
)

select
	top(10) *,
	rank () over (order by total_price desc) as rank
from
	orders_price

-- zadanie 4
with avg_monthly_prices as (
	select
		mp.mm as month_no,
		avg(mp.total_price) as avg_price
	from (
		select
			od.order_id,
			right(left(o.date, 7), 2) as mm,
			sum(p.price * od.quantity) as total_price
		from
			orders as o
			join order_details as od on o.order_id = od.order_id
			join pizzas as p on od.pizza_id = p.pizza_id
		group by
			od.order_id, right(left(o.date, 7), 2)
	) as mp
	group by
		mp.mm
)

select
	o.order_id,
	sum(p.price * od.quantity) as order_amount,
	amp.avg_price as average_month_amount,
	o.date
from
	orders as o
	join order_details as od on o.order_id = od.order_id
	join pizzas as p on od.pizza_id = p.pizza_id
	join avg_monthly_prices as amp on right(left(o.date, 7), 2) = amp.month_no
group by o.order_id, o.date, amp.avg_price

-- zadanie 5
select
	count(o.order_id) as order_count, 
	o.date,
	left(o.time, 2) as hour
from
	orders as o
where
	o.date = '2015-01-01'
group by
	left(o.time, 2), o.date

-- zadanie 6
select
	pt.name,
	pt.category,
	sum(od.quantity) as count
from
	orders as o
	join order_details as od on o.order_id = od.order_id
	join pizzas as p on od.pizza_id = p.pizza_id
	join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
where
	o.date like '2015-01-%'
group by
	p.pizza_type_id, pt.name, pt.category

-- zadanie 7
select
	p.size,
	sum(od.quantity) as count
from
	orders as o
	join order_details as od on o.order_id = od.order_id
	join pizzas as p on od.pizza_id = p.pizza_id
where
	o.date >= '2015-02-01' and o.date <= '2015-03-31'
group by
	p.size

	





