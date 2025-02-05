#3421. Find Students Who Improved

select f.student_id,f.subject,f.score as first_score,l.score as latest_score
from scores f join scores l on f.student_id = l.student_id and f.subject = l.subject and f.exam_date != l.exam_date
and f.exam_date = (select min(exam_date) from scores where f.student_id = student_id and f.subject = subject)
and l.exam_date = (select max(exam_date) from scores where l.student_id = student_id and l.subject = subject)
where f.score < l.score
order by f.student_id,f.subject;

