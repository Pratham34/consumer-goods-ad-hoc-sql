select c.customer_code, c.customer, 
round(avg(pre_invoice_discount_pct),3) as average_discount_percentage
from dim_customer c
join fact_pre_invoice_deductions f
using (customer_code)
where fiscal_year=2021 and market="India"
group by c.customer_code, c.customer
order by average_discount_percentage desc
limit 5;