with cte_2020 as (
	SELECT p.segment, 
	count(distinct(p.product_code)) as product_count_2020
	FROM dim_product p
    join fact_sales_monthly s
    using (product_code)
    where s.fiscal_year=2020
	group by segment
),
cte_2021 as (
	SELECT p.segment, 
	count(distinct(p.product_code)) as product_count_2021
	FROM dim_product p
    join fact_sales_monthly s
    using (product_code)
    where s.fiscal_year=2021
	group by segment
), 
cte as (
	select segment, product_count_2020, product_count_2021,
	(product_count_2021-product_count_2020) as difference
	from cte_2020
	join cte_2021
	using (segment)
)

select * from cte
order by difference desc;
