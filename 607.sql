#607. Sales Person

select s.name
from salesPerson as s
where s.sales_id not in
(select o.sales_id from orders as o
left join company as c
on o.com_id=c.com_id
where name="RED")

