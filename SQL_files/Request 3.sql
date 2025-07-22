with cte1 as (
	SELECT segment, 
	count(distinct(product_code)) as product_count
	FROM dim_product
	group by segment
)

select * from cte1
order by product_count desc;    