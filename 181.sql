#181. Employees Earning More Than Their Managers

Select name as Employee from Employee e1 where 
salary > (select salary from Employee where id=e1.managerId)
