with cte as (
select 
	*,
	case
		when month(date) in (9,10,11) then "Q1"
		when month(date) in (12,1,2) then "Q2"
		when month(date) in (3,4,5) then "Q3"
		else "Q4"
	end as quarter_2020
from fact_sales_monthly
where fiscal_year=2020
)

select 
quarter_2020 as Quarter, 
sum(sold_quantity) as total_sold_quantity
from cte
group by quarter_2020
order by total_sold_quantity desc;




-- select 
-- monthname(date) as 'Month',
-- quarter_2020 as Quarter, 
-- sum(sold_quantity) as total_sold_quantity
-- from cte
-- group by Month, quarter_2020;