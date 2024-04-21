select
salesperson.name as salesperson_name,
coalesce(sum(orders.amount), 0) as total_sales_amount
from
salesperson
left join orders on orders.salesperson_id=salesperson.id
group by salesperson.id
order by total_sales_amount desc;
