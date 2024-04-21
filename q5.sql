pragma foreign_keys = ON;

drop table if exists high_achiever;

create table
high_achiever
(salesperson_id integer,
foreign key(salesperson_id) references salesperson(id));

with total_sales_by_salesperson as (
select
salesperson.id as salesperson_id,
salesperson.name as salesperson_name,
coalesce(sum(orders.amount), 0) as total_sales_amount
from
salesperson
left join orders on orders.salesperson_id=salesperson.id
group by salesperson.id
order by total_sales_amount desc)
insert into high_achiever (salesperson_id)
select salesperson_id from total_sales_by_salesperson as ts
where ts.total_sales_amount >= 1000;
