with cte1 as (
	SELECT count(distinct(product_code)) as unique_products_2020 FROM fact_sales_monthly
	where fiscal_year=2020
),
cte2 as (
	SELECT count(distinct(product_code)) as unique_products_2021 FROM fact_sales_monthly
	where fiscal_year=2021
)

select unique_products_2020, unique_products_2021,
((unique_products_2021-unique_products_2020)*100/unique_products_2020) as percentage_chg
from 
cte1,cte2;


