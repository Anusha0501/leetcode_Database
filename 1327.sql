#1327. List the Products Ordered in a Period

Select p.product_name, sum(o.unit) as unit from
Products as p inner join Orders as o
on p.product_id = o.product_id
where order_date between '2020-02-01' and '2020-02-29'
group by o.product_id
having unit >= 100;

