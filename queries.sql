insert into customer (username, password, created_at) values
('user_one', 'pass', '2022-01-01'),
('user_two', 'pass_two', '2022-01-01'),
('user_three', 'pass_three', '2022-01-01'),
('user_four', 'pass_four', '2022-01-01'),
('user_five', 'pass_five', '2022-01-01');

insert into item (name, price) values 
('item_one', 10),
('item_two', 20),
('item_three', 30),
('item_four', 40),
('item_five', 50),
('item_six', 60),
('item_seven', 70),
('item_eight', 80),
('item_nine', 90),
('item_ten', 100);

insert into purchase (purchase_time, customer_id, item_id) values
('2022-01-20 11:00:00', 1, 1),
('2022-01-20 11:00:00', 1, 2),
('2022-01-20 11:00:00', 1, 6),
('2022-01-20 11:00:00', 1, 9),
('2022-01-20 11:00:00', 1, 10),
('2022-01-20 09:00:00', 2, 3),
('2022-01-20 09:00:00', 2, 5),
('2022-01-20 13:00:00', 3, 7),
('2022-01-20 17:00:00', 4, 1),
('2022-01-20 17:00:00', 4, 1),
('2022-01-20 17:00:00', 4, 3),
('2022-01-20 17:00:00', 4, 6),
('2022-01-20 13:30:00', 4, 8),
('2022-01-20 10:00:00', 4, 10),
('2022-01-20 12:00:00', 5, 1),
('2022-01-20 12:00:00', 5, 4),
('2022-01-20 12:00:00', 5, 9),
('2022-01-20 12:00:00', 5, 3),
('2022-01-20 11:30:00', 1, 2),
('2022-01-20 09:25:00', 1, 1);

select c.username, i.name, p.purchase_time 
from customer c inner join purchase p on p.customer_id = c.id
inner join item i on i.id=p.item_id 
order by p.purchase_time  desc
limit 5;


select c.username, count(c.id)
from customer c inner join purchase p on p.customer_id = c.id
inner join item i on i.id=p.item_id 
group by c.id;

call five_most_recent

call specific_customer_purchases(2);

call specific_customer_purchases(1);

call specific_customer_purchases(3);


CREATE PROCEDURE w18b.specific_customer_purchases(customer_id_input int unsigned)
begin
select c.username, count(c.id)
from customer c inner join purchase p on p.customer_id = c.id
inner join item i on i.id=p.item_id 
where c.id =customer_id_input
group by c.id;
END


CREATE PROCEDURE w18b.five_most_recent()
begin
select c.username, i.name, p.purchase_time 
from customer c inner join purchase p on p.customer_id = c.id
inner join item i on i.id=p.item_id 
order by p.purchase_time  desc
limit 5;
END