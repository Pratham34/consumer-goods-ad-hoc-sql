with cte1 as (
SELECT p.product_code, p.product, m.manufacturing_cost FROM 
dim_product p
join fact_manufacturing_cost m
using (product_code)
order by manufacturing_cost
limit 1
),
cte2 as (
SELECT p.product_code, p.product, m.manufacturing_cost FROM 
dim_product p
join fact_manufacturing_cost m
using (product_code)
order by manufacturing_cost desc
limit 1
)

select * from cte1
union
select * from cte2;

### or

select p.product_code, product, manufacturing_cost
from dim_product p
join fact_manufacturing_cost m
using (product_code)
where manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
or manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost);