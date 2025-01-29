#196. Delete Duplicate Emails

DELETE p from Person p, Person q 
where p.Id>q.Id AND q.Email=p.Email 
