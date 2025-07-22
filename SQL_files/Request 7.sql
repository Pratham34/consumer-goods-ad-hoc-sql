select 
	monthname(s.date) as 'Month',
	year(s.date) as 'Year',
	round(sum(g.gross_price*s.sold_quantity)/1000000,2) as gross_sales_amount
from fact_sales_monthly s
join fact_gross_price g
using (product_code,fiscal_year)
join dim_customer c
using (customer_code)
where c.customer="Atliq Exclusive"
group by Month,Year
order by Year;



SELECT CONCAT(MONTHNAME(FS.date), ' (', YEAR(FS.date), ')') AS 'Month', FS.fiscal_year,
       ROUND(SUM(G.gross_price*FS.sold_quantity), 2) AS Gross_sales_Amount
FROM fact_sales_monthly FS JOIN dim_customer C ON FS.customer_code = C.customer_code
						   JOIN fact_gross_price G ON FS.product_code = G.product_code and FS.fiscal_year = G.fiscal_year
WHERE C.customer = 'Atliq Exclusive'
GROUP BY  Month, FS.fiscal_year 
ORDER BY FS.fiscal_year ;



