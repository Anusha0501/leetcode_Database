#182. Duplicate Emails

#SELECT parameters From Table Name
#GROUP BY the entity you want to group together, in this case emails;

select Email from Person
Group by Email
Having Count(*) > 1 ;
