select
salesperson.name as salesperson_name, max(orders.amount) as highest_sale_amount
from
orders
join salesperson on orders.salesperson_id=salesperson.id
group by salesperson.id;
