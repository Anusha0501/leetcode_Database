#1158. Market Analysis I

Select U.user_id as buyer_id,U.join_date, SUM(CASE WHEN order_date is not null then 1 ELSE 0 END) as orders_in_2019 from Users U
left join Orders O on U.user_id = O.buyer_id and YEAR(order_date) = '2019'
group by U.user_id
