-- no order with samsonic
-- or no orders AT ALL
with samsonic_order_salespeople as (
select orders.salesperson_id
from orders
join customer on orders.customer_id=customer.id
where customer.name like 'Samsonic'
)
select salesperson.name as salesperson_name
from salesperson
-- the crucial thing here is to use a left join so you get all rows
-- from salesperson, regardless of whether they've got an entry in
-- samsonic_order_salespeople
left join samsonic_order_salespeople on samsonic_order_salespeople.salesperson_id=salesperson.id
-- not sure if the use of "not in" here is specific to SQLite;
-- you could also do this using a check for null on the joined columns (given the above use of a left join)
where salesperson.id not in samsonic_order_salespeople;
