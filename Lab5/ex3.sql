--3
select student.ID, student.name, count(distinct course_id) as course_num, count(sec_id) as sec_num 
from student left outer join takes on student.ID=takes.ID 
group by student.ID, student.name
