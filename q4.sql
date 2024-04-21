select
salesperson.name as salesperson_name,
coalesce(sum(orders.amount), 0) / cast(salesperson.salary as real) as performance
from
salesperson
left join orders on orders.salesperson_id=salesperson.id
group by salesperson.id
order by performance desc;
