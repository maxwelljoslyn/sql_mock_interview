with samsonic_orders as (
select *
from orders
join customer on orders.customer_id=customer.id
where customer.name like 'Samsonic'
)
select salesperson.name as salesperson_name
from samsonic_orders
join salesperson on samsonic_orders.salesperson_id=salesperson.id;

