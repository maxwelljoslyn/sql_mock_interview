pragma foreign_keys = ON;

create table salesperson (
id integer,
name text,
age integer,
salary integer,
primary key(id));

insert into salesperson
(id, name, age, salary)
values
(1, 'Abe', 61, 140000),
(2, 'Bob', 34, 44000),
(5, 'Chris', 34, 40000),
(7, 'Dan', 41, 52000),
(8, 'Ken', 57, 115000),
(11, 'Joe', 38, 38000);

-- NOTE if really using this I would want to make "city" an ID foreign
-- key into a "cities" table to better normalize the schema
-- and to prepare for the near-inevitable desire to add data about cities themselves

-- NOTE in the original data, the customer with ID 9, "Orange", had city "Jackson" -- but customer "Samony" had city "jackson"
-- presumably those are supposed to be the same.

-- NOTE capitalizing city names.
create table customer (
id integer,
name text,
city text,
industry_type text,
primary key(id));

insert into customer
(id, name, city, industry_type)
values
(4, 'Samsonic', 'Pleasant', 'J'),
(6, 'Panasung', 'Oaktown', 'J'),
(7, 'Samony', 'Jackson', 'B'),
(9, 'Orange', 'Jackson', 'B');

-- NOTE salesperson and customer are singular, orders is plural. not
-- important in this context, of course, but it's the kind of thing I try
-- to keep standardized in real life. IIRC, Ruby on Rails has its own
-- opinions about how to do this.

-- NOTE what appears to be the "ID" row here is called "number".
-- that's understandable given this database might be used by sales or
-- bizdev people who want certain terminology, but in a real-life
-- scenario I'd prefer "ID", both for standardization with the other
-- tables, and to prevent anyone confusing it with the "amount" column.

-- NOTE changing "cust_id" from the sample data to "customer_id"

-- NOTE using text for order_date 'cause SQLite doesn't have a datetime type;
-- in Postgres or similar I'd use an appropriate specialized type
create table orders (
number integer,
order_date text,
customer_id integer,
salesperson_id integer,
amount integer,
foreign key (customer_id) references customer(id),
foreign key (salesperson_id) references salesperson(id));

insert into orders
(number, order_date, customer_id, salesperson_id, amount)
values
(10, '1996-08-02', 4, 2, 2400),
(20, '1999-01-30', 4, 8, 1800),
(30, '1995-07-14', 9, 1, 460),
(40, '1998-01-29', 7, 2, 540),
(50, '1998-02-03', 6, 7, 600),
(60, '1998-03-02', 6, 7, 720),
(70, '1998-05-06', 9, 7, 150);
