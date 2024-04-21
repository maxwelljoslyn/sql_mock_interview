select
salesperson.name as salesperson_name, coalesce(max(orders.amount), 0) as highest_sale_amount
from
salesperson
left join orders on orders.salesperson_id=salesperson.id
group by salesperson.id;
