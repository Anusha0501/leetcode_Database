#601. Human Traffic of Stadium

#Use CTE (Common Table Expression): In the CTE, we calculate the next two (LEAD) and previous two (LAG) id values for each row using window functions.

#Filter by Consecutive IDs: In the outer query, we check if the current id is part of a consecutive sequence with the next or previous two visits.

#Condition on People: Ensure the number of people in the stadium is greater than or equal to 100 by filtering in the CTE.

with cte as (
    select id, 
        visit_date,
        people,
        lead(id, 1) over(order by id) id_lead1,
        lead(id, 2) over(order by id) id_lead2,
        lag(id, 1) over(order by id) id_lag1,
        lag(id, 2) over(order by id) id_lag2
    from stadium
    where people >= 100
)
select id,visit_date,people
from cte
WHERE (id+1 = id_lead1 AND id+2 = id_lead2)
OR
(id-1=id_lag1 AND id-2=id_lag2)
OR
(id-1=id_lag1 AND id+1 = id_lead1)

