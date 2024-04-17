create table delivery(
	delivery_id serial primary key,
	address_id int references address(address_id) not null,
	delivery_date date not null,
	time_range text[] not null,
	staff_id int references staff(staff_id) not null,
	status del_status not null default 'в обработке',
	last_update timestamp,
	create_date timestamp default now(),
	deleted boolean not null default false
)

select * from delivery

alter table orders add constraint orders_delivery_fkey foreign key(delivery_id)
	references delivery(delivery_id)
	
insert into delivery(
	address_id,
	delivery_date,
	time_range,
	staff_id
)
values(102, '2022.02.25', array['10:00:00', '18:00:00'], 2),
	(34, '2022.02.25', array['10:00:00', '18:00:00'], 2),
	(12, '2022.02.25', array['10:00:00', '18:00:00'], 2),
	(12, '2022.02.25', array['10:00:00', '18:00:00'], 2),
	(78, '2022.02.25', array['10:00:00', '18:00:00'], 2),
	(78, '2022.02.25', array['10:00:00', '18:00:00'], 2),
	(55, '2022.02.25', array['10:00:00', '18:00:00'], 2),
	(34, '2022.02.25', array['10:00:00', '18:00:00'], 2)
	
update orders
set delivery_id = 1
where order_id = 1

update orders
set delivery_id = 2
where order_id = 2

update orders
set delivery_id = 3
where order_id = 3

update orders
set delivery_id = 4
where order_id = 4

update orders
set delivery_id = 5
where order_id = 5

update orders
set delivery_id = 6
where order_id = 6

update orders
set delivery_id = 7
where order_id = 7

update orders
set delivery_id = 8
where order_id = 8

select *
from orders


select 
count(amount)
from orders

select
	count(product) 
from product p
join category c
	on p.category_id = c.category_id 
where c.category = 'Игрушки'

select
	count(product) as prod_count,
	p.category_id 
from product p
group by p.category_id
having count(product) > 1
order by
prod_count desc
limit 1

select
concat(c.last_name, ' ', c.first_name) as customer_name,
p.product,
opl.amount 
from customer c 
join orders o 
	on c.customer_id = o.customer_id
join order_product_list opl
	on o.order_id = opl.order_id
join product p
	on opl.product_id = p.product_id
where c.last_name = 'Williams'
	and p.product = 'Черепаха'




