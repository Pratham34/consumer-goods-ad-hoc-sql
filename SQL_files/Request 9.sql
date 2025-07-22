with cte as (
	select 
		c.channel,
		sum(s.sold_quantity*g.gross_price)/1000000 as gross_sales_mln
	from fact_sales_monthly s
	join fact_gross_price g
	using (product_code,fiscal_year)
	join dim_customer c
	using (customer_code)
	where s.fiscal_year=2021
	group by c.channel
)

select *,
gross_sales_mln*100/sum(gross_sales_mln) over() as percentage 
from cte;
