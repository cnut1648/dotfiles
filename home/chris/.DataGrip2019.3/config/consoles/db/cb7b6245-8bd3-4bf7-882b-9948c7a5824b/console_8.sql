select sec_id, grade, ID
from takes
order by sec_id desc, grade asc

insert into course(course_id)
values ('MATH101')

select id
from instructor
where salary >= all (select salary from instructor)

select course_id,sec_id,max(capacity),building,room_number
from section natural join classroom c
group by course_id,sec_id
order by room_number;
select maxc.course_id, maxc.sec_id, c1.building, c1.room_number
from (
         select s2.course_id, s2.sec_id, max(c2.capacity) as m
         from classroom as c2
                  natural join section as s2
         group by s2.course_id, s2.sec_id
     ) as maxc,
     classroom as c1
         natural join section as s1
where maxc.course_id = s1.course_id
  and maxc.sec_id = s1.sec_id
  and maxc.m = c1.capacity;
order by c1.room_number

WITH C(dept_name, cnt) AS (SELECT i1.dept_name, count(i1.ID) FROM instructor AS i1 GROUP BY
dept_name)
SELECT C.dept_name
FROM (SELECT max(C.cnt) AS maxc FROM C) AS m, C
WHERE C.cnt = m.maxc;


with M(dept, ct) as (select i.dept_name, count(distinct i.ID)
from department join instructor i on department.dept_name = i.dept_name
    group by i.dept_name
)
select dept
from department join M on dept_name = M.dept
where ct  >= (select max(M.ct) from M)

select id
from instructor
where salary = (select max(salary) from instructor)


select id
from instructor
where salary >= all (select salary from instrucjt select *
                     from ;



select *
from instructor join teaches t on instructor.ID = t.ID

select *
from student inner join takes t on student.ID = t.ID;

select *
from student left outer join takes on true
where student.ID = takes.ID;

select d.dept_name, name, salary
from instructor join department d on instructor.dept_name = d.dept_name
where salary = (select max(salary) from instructor i2 natural join department d2 where d2.dept_name = d.dept_name )

select dept_name, max(salary)
from instructor
group by dept_name
large.borrowed

select avg(t.ct)
from (
select m.member_no, count(isbn) as ct
from member m left join borrowed b on m.member_no = b.member_no
group by m.member_no) as t

select ID, name
from instructor natural join teaches t
group by id, `year`, course_id
having count(*) >= 2;

select course.course_id
from course
where exists (select * from section where section.semester='Spring' and section.course_id=course.course_id)
and exists (select * from section where section.semester='Fall' and section.course_id=course.course_id)

select course_id,count(*)
from takes
group by course_id


