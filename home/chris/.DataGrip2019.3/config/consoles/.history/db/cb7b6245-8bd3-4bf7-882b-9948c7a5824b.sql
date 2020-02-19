LOAD DATA LOCAL INFILE
'user.csv'
INTO TABLE user
    columns terminated by ','
    lines terminated by '\n'
(email, password, name, date_of_birth, address, type);
;-- -. . -..- - / . -. - .-. -.--
create table user (
    email varchar(40),
    password varchar(30),
    name varchar(20),
    date_of_birth DATE,
    address varchar(100),
    type ENUM('C','R'),
    CONSTRAINT pk_usr primary key (email),
    );
;-- -. . -..- - / . -. - .-. -.--
LOAD DATA LOCAL INFILE
'./user.csv'
INTO TABLE user
    columns terminated by ','
    lines terminated by '\n';
;-- -. . -..- - / . -. - .-. -.--
/course/122A;
;-- -. . -..- - / . -. - .-. -.--
LOAD DATA LOCAL INFILE
'~/data/untitled/sql/course/122A/user.csv'
INTO TABLE user
    columns terminated by ','
    lines terminated by '\n';
;-- -. . -..- - / . -. - .-. -.--
LOAD DATA LOCAL INFILE
'/home/chris/data/untitled/sql/course/122A/user.csv'
INTO TABLE user
    columns terminated by ','
    lines terminated by '\n'
(email, password, name, @custom_data, address, type)
set date_of_birth = STR_TO_DATE(@custom_data, '%m-%d-%Y');
;-- -. . -..- - / . -. - .-. -.--
LOAD DATA LOCAL INFILE
'/home/chris/data/untitled/sql/course/122A/celebrity.csv'
INTO TABLE user
    columns terminated by ','
    lines terminated by '\n';
;-- -. . -..- - / . -. - .-. -.--
use test;
;-- -. . -..- - / . -. - .-. -.--
drop table if exists user;
;-- -. . -..- - / . -. - .-. -.--
create table user (
    email varchar(40),
    password varchar(30),
    name varchar(20),
    date_of_birth DATE,
    address varchar(100),
    type ENUM('C','R'),
    CONSTRAINT pk_usr primary key (email)
    );
;-- -. . -..- - / . -. - .-. -.--
create table celebrity (
    email varchar(40),
    website varchar(40),
    kind varchar(20),
    CONSTRAINT pk_celebrity primary key (email)
    );
;-- -. . -..- - / . -. - .-. -.--
select T.name, S.course id
from instructor as T, teaches as S
where T.ID= S.ID;
;-- -. . -..- - / . -. - .-. -.--
show tables;
;-- -. . -..- - / . -. - .-. -.--
select T.name, S.course_id
from instructor as T, teaches as S
where T.ID= S.ID;
;-- -. . -..- - / . -. - .-. -.--
SELECT name
FROM student natural join (
      select id
      from takes NATURAL JOIN
          (
          select *
        from course where course.dept_name='Comp. Sci.'
              )


    );
;-- -. . -..- - / . -. - .-. -.--
select id
      from takes NATURAL JOIN
          (
          select *
        from course
          where course.dept_name='Comp. Sci.'
              );
;-- -. . -..- - / . -. - .-. -.--
select *
      from takes NATURAL JOIN (
          select *
        from course
          where course.dept_name='Comp. Sci.'
              );
;-- -. . -..- - / . -. - .-. -.--

# select *
#       from takes NATURAL JOIN
#;
;-- -. . -..- - / . -. - .-. -.--
select *
        from course
          where course.dept_name='Comp. Sci.';
;-- -. . -..- - / . -. - .-. -.--
select *
from takes NATURAL JOIN course c
where c.dept_name='Comp. Sci.';
;-- -. . -..- - / . -. - .-. -.--
select ID
from takes NATURAL JOIN course c
where c.dept_name='Comp. Sci.';
;-- -. . -..- - / . -. - .-. -.--
select name
from student natural join (
select ID
from takes NATURAL JOIN course c
where c.dept_name='Comp. Sci.');
;-- -. . -..- - / . -. - .-. -.--
select name
from student
natural join (
select ID
from takes NATURAL JOIN course c
where c.dept_name='Comp. Sci.');
;-- -. . -..- - / . -. - .-. -.--
select name
from student
natural join (
select ID
from takes NATURAL JOIN course c
where c.dept_name='Comp. Sci.') as t;
;-- -. . -..- - / . -. - .-. -.--
select distinct name
from student
natural join (
select ID
from takes NATURAL JOIN course c
where c.dept_name='Comp. Sci.') as t;
;-- -. . -..- - / . -. - .-. -.--
select *
from student
natural join (
select ID
from takes NATURAL JOIN course c
where c.dept_name='Comp. Sci.') as t;
;-- -. . -..- - / . -. - .-. -.--
select name
from student natural join takes natural join course
where course.dept_name='Comp. Sci.';
;-- -. . -..- - / . -. - .-. -.--
select distinct name
from student natural join takes natural join course
where course.dept_name='Comp. Sci.';
;-- -. . -..- - / . -. - .-. -.--
SHOW TABLES;
;-- -. . -..- - / . -. - .-. -.--
DESC STUDENT;
;-- -. . -..- - / . -. - .-. -.--
DESC student;
;-- -. . -..- - / . -. - .-. -.--
select *
from student takes;
;-- -. . -..- - / . -. - .-. -.--
select *
from student, instructor;
;-- -. . -..- - / . -. - .-. -.--
select salary
from student, instructor;
;-- -. . -..- - / . -. - .-. -.--
select name, course id
from instructor, teaches
where instructor.ID= teaches.ID;
;-- -. . -..- - / . -. - .-. -.--
select name, course_id
from instructor, teaches
where instructor.ID= teaches.ID;
;-- -. . -..- - / . -. - .-. -.--
select name, course_id
from instructor natural join teaches;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000
order by avg_salary;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000
order by avg_salary asc;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000
order by dept_name asc, avg_salary desc;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000
order by avg_salary desc;
;-- -. . -..- - / . -. - .-. -.--
select *
from (
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name)
where avg_salary > 42000;
;-- -. . -..- - / . -. - .-. -.--
# select *
# from (
# )
# where avg_salary > 42000
;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select *
from (
     select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
) as sub
where sub.avg_salary > 42000;
;-- -. . -..- - / . -. - .-. -.--
select building, avg(budget)
from department
group by building;
;-- -. . -..- - / . -. - .-. -.--
select building, avg(budget) as a
from department
group by building
having a != 80000;
;-- -. . -..- - / . -. - .-. -.--
select building, dept_name, avg(budget) as a
from department
group by building, dept_name;
;-- -. . -..- - / . -. - .-. -.--
select course_id
from section
where year = '2010';
;-- -. . -..- - / . -. - .-. -.--
select *
from section
where year = '2010' and semester = 'Spring';
;-- -. . -..- - / . -. - .-. -.--
DESC section;
;-- -. . -..- - / . -. - .-. -.--
select *
from section
where year = '2010' and semester = 'Spring'
union
select *
from section
where year = '2009' and semester = 'Fall';
;-- -. . -..- - / . -. - .-. -.--
select *
from section
where year = '2010' and semester = 'Spring'
and
      course_id in (select course_id
          from section
          where semester='Fall' and year = 2010);
;-- -. . -..- - / . -. - .-. -.--
select *
from section
where year = '2010' and semester = 'Spring'
and
      course_id in (select course_id
          from section
          where semester='Fall' and year = 2009);
;-- -. . -..- - / . -. - .-. -.--
select *
from section
where year = '2010' and semester = 'Spring'
and
      course_id in (select course_id
          from section
          where semester='Fall' and year = '2009');
;-- -. . -..- - / . -. - .-. -.--
select *
from section
where year ='2010' and semester = 'Spring'
union
select *
from section
where year = '2009' and semester = 'Fall';
;-- -. . -..- - / . -. - .-. -.--
select *
from section
where year ='2010' and semester = 'Spring'
intersect 
select *
from section
where year = '2009' and semester = 'Fall';
;-- -. . -..- - / . -. - .-. -.--
select course_id
from section
where year ='2010' and semester = 'Spring'
intersect
select course_id
from section
where year = '2009' and semester = 'Fall';
;-- -. . -..- - / . -. - .-. -.--
select distinct course_id
from section
where year = '2010' and semester = 'Spring'
and
      course_id in (select course_id
          from section
          where semester='Fall' and year = '2009');
;-- -. . -..- - / . -. - .-. -.--
select avg(budget) as a
from department
where a =all (
select avg(budget) as a
from department);
;-- -. . -..- - / . -. - .-. -.--
select *
from department
where avg(budget)  =all (
select avg(budget) as a
from department);
;-- -. . -..- - / . -. - .-. -.--
select distinct S.ID, S.name
from student as S
where not exists ((select course_id
from course
where dept_name = ’Biology’)
except
(select T.course_id
from takes as T
where S.ID = T.ID));
;-- -. . -..- - / . -. - .-. -.--
select distinct S.ID, S.name
from student as S
where not exists ((select course_id
from course
where dept_name = 'Biology')
except
(select T.course_id
from takes as T
where S.ID = T.ID));
;-- -. . -..- - / . -. - .-. -.--
select * from course
where dept_name = 'Biology';
;-- -. . -..- - / . -. - .-. -.--
select max (tot_salary)
from (select dept_name, sum(salary)
from instructor
group by dept_name) as dept_total (dept_name, tot_salary);
;-- -. . -..- - / . -. - .-. -.--
select max (tot_salary)
from (select dept_name, sum(salary)
from instructor
group by dept_name) as dept_total(dept_name, tot_salary);
;-- -. . -..- - / . -. - .-. -.--
select max(tot_salary)
from (select dept_name, sum(salary)
from instructor
group by dept_name) as dept_total(dept_name, tot_salary);
;-- -. . -..- - / . -. - .-. -.--
select max(tot_salary)
from (select dept_name, sum(salary)
      from instructor
      group by dept_name) as dept_total;
;-- -. . -..- - / . -. - .-. -.--
select max(salary)
from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name,max(salary)
from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select max(tot_salary)
from (select dept_name, sum(salary)
      from instructor
      group by dept_name) as dept_total(dept_name, tot_salary);
;-- -. . -..- - / . -. - .-. -.--
select max(tot_salary)
from (select dept_name, sum(salary)
      from instructor
      group by dept_name);
;-- -. . -..- - / . -. - .-. -.--
select *
from (select dept_name, sum(salary)
      from instructor
      group by dept_name);
;-- -. . -..- - / . -. - .-. -.--
select *
from (select dept_name, sum(salary)
      from instructor
      group by dept_name) as t;
;-- -. . -..- - / . -. - .-. -.--
select max(t.s)
from (select dept_name, sum(salary) as s
      from instructor
      group by dept_name) as t;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select dept_name, sum(salary) as s
      from instructor
      group by dept_name) as t;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select dept_name, max(salary) as s
      from instructor
      group by dept_name) as t;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select dept_name, max(salary) as s
      from instructor
      group by dept_name) as t(d,s);
;-- -. . -..- - / . -. - .-. -.--
select *
from (select dept_name, max(salary) as s
      from instructor
      group by dept_name) as t (d,s);
;-- -. . -..- - / . -. - .-. -.--
select *
from (select dept_name, max(salary) as s
      from instructor
      group by dept_name)  t (d,s);
;-- -. . -..- - / . -. - .-. -.--
select *
from lateral (select dept_name, max(salary) as s
      from instructor
      group by dept_name)  t (d,s);
;-- -. . -..- - / . -. - .-. -.--
select *
from lateral (select dept_name, max(salary) as s
      from instructor
      group by dept_name);
;-- -. . -..- - / . -. - .-. -.--
select min(s.m)
from (select dept_name, max(salary) as m
from instructor
group by dept_name) as s;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, max(salary)
from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select *
from student natural join takes natural join course;
;-- -. . -..- - / . -. - .-. -.--
select *
from student natural join takes join course on takes.course_id;
;-- -. . -..- - / . -. - .-. -.--
select *
from student natural join takes join course c on takes.course_id = c.course_id;
;-- -. . -..- - / . -. - .-. -.--
select c.dept_name, student.dept_name
from student natural join takes join course c on takes.course_id = c.course_id;
;-- -. . -..- - / . -. - .-. -.--
select c.dept_name, student.dept_name
from student natural join takes join course c on takes.course_id = c.course_id
where c.dept_name in ('Finance','Music');
;-- -. . -..- - / . -. - .-. -.--
select c.dept_name, student.dept_name
from student natural join takes join course c on takes.course_id = c.course_id
where student.name <> "hek";
;-- -. . -..- - / . -. - .-. -.--
select c.dept_name, student.dept_name
from student natural join takes join course c on takes.course_id = c.course_id
where name <> "hek";
;-- -. . -..- - / . -. - .-. -.--
select max(budget)
from department
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select min(t.m)
from
(select max(budget) as m
from department
group by dept_name) as t;
;-- -. . -..- - / . -. - .-. -.--
(select max(budget) as m
from department
group by dept_name) as t;
;-- -. . -..- - / . -. - .-. -.--
(select max(budget) as m
from department
group by dept_name);
;-- -. . -..- - / . -. - .-. -.--
select d,min(t.m)
from
(select dept_name as d, max(budget) as m
from department
group by dept_name) as t;
;-- -. . -..- - / . -. - .-. -.--
select t.d
from
(select dept_name as d, max(budget) as m
from department
group by dept_name) as t
where t.m = min(t.m);
;-- -. . -..- - / . -. - .-. -.--
select t.d
from (select dept_name as d, max(budget) as m
from department
group by dept_name
having m = min(m)) as t;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, sum(budget) from department
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name
from department
group by dept_name
having sum(budget) <= all
(select max(budget) as m
from department
group by dept_name);
;-- -. . -..- - / . -. - .-. -.--
select dept_name
from department
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name,count(*)
from department
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name,count(*)
from department;
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from department;
;-- -. . -..- - / . -. - .-. -.--
select *
from department;
;-- -. . -..- - / . -. - .-. -.--
select */dept_name
from department;
;-- -. . -..- - / . -. - .-. -.--
with ct as (select count(*) from department)
select *
from department
where budget > ct;
;-- -. . -..- - / . -. - .-. -.--
with ct as
    (select count(*) from department)
select *
from department
where budget > ct;
;-- -. . -..- - / . -. - .-. -.--
with ct as
    (select count(*) from department)
select *
from department;
;-- -. . -..- - / . -. - .-. -.--
with ct as
    (select count(*) from department)
select *
from ct;
;-- -. . -..- - / . -. - .-. -.--
with ct as
    (select count(*) from department)
select *
from department
where ct >= 7;
;-- -. . -..- - / . -. - .-. -.--
with c as
    (select count(*) from department)
select *
from department
where c >= 7;
;-- -. . -..- - / . -. - .-. -.--
with t as
    (select count(*) as c from department)
select *
from department
where t.c >= 7;
;-- -. . -..- - / . -. - .-. -.--
with t as
    (select count(*) as c from department)
select *
from t;
;-- -. . -..- - / . -. - .-. -.--
with t as
    (select count(*) as c from department)
select c
from t;
;-- -. . -..- - / . -. - .-. -.--
with t as
    (select count(*) as c from department)
select c
from department
where t.c >= 7;
;-- -. . -..- - / . -. - .-. -.--
with t as
    (select count(*) as c from department)
select *
from department
where exists(t);
;-- -. . -..- - / . -. - .-. -.--
with tablehhh as
    (select count(*) as c from department)
select *
from department
where exists(tablehhh);
;-- -. . -..- - / . -. - .-. -.--
with table (c) as
    (select count(*)  from department)
select *
from department
where exists(table);
;-- -. . -..- - / . -. - .-. -.--
with table (c) as
    (select count(*)  from department)
select *
from department
where exists table;
;-- -. . -..- - / . -. - .-. -.--
with tablehs (c) as
    (select count(*)  from department)
select *
from department
where exists tablehs;
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from instructor
group by id;
;-- -. . -..- - / . -. - .-. -.--
select * from instructor
group by id;
;-- -. . -..- - / . -. - .-. -.--
select * from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, * from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, salary from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select count(dept_name)  from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name  from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select count(dept_name) from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select count(tt) from (select dept_name as tt from instructor
group by dept_name) as d;
;-- -. . -..- - / . -. - .-. -.--
select count(d.tt) from (select dept_name as tt from instructor
group by dept_name) as d;
;-- -. . -..- - / . -. - .-. -.--
select count(d.hello) from (select dept_name as tt from instructor
group by dept_name) as d(hello);
;-- -. . -..- - / . -. - .-. -.--
select count(d)k from (select dept_name as tt from instructor
group by dept_name) as d(hello);
;-- -. . -..- - / . -. - .-. -.--
select count(d) from (select dept_name as tt from instructor
group by dept_name) as d(hello);
;-- -. . -..- - / . -. - .-. -.--
with allname as (select dept_name from instructor group by dept_name)
select * from allname;
;-- -. . -..- - / . -. - .-. -.--
with allname as (select dept_name d from instructor group by dept_name)
select count(d) from allname;
;-- -. . -..- - / . -. - .-. -.--
with allname as (select dept_name d from instructor group by dept_name)
select d from allname
where d = 'Finance';
;-- -. . -..- - / . -. - .-. -.--
create table member(
    member_no varchar(20), name varchar(20), age INT,
    primary key member_no


);
;-- -. . -..- - / . -. - .-. -.--
create table member(
    member_no varchar(20), name varchar(20), age INT,
    primary key (member_no)
);
;-- -. . -..- - / . -. - .-. -.--
create table borrowed(
    member_no varchar(20), isbn varchar(20)
    primary key (member_no, isbn), foreign key (member_no) reference member
);
;-- -. . -..- - / . -. - .-. -.--
create table borrowed(
    member_no varchar(20), isbn varchar(20),
    primary key (member_no, isbn), foreign key (member_no) reference member
);
;-- -. . -..- - / . -. - .-. -.--
create table borrowed(
    member_no varchar(20), isbn varchar(20),
    primary key (member_no, isbn), foreign key (member_no) references member
)j;
;-- -. . -..- - / . -. - .-. -.--
create table borrowed(
    member_no varchar(20), isbn varchar(20),
    primary key (member_no, isbn), foreign key (member_no) references member
);
;-- -. . -..- - / . -. - .-. -.--
create table borrowed(
    member_no varchar(20), isbn varchar(20),
    primary key (member_no, isbn), foreign key (member_no) references member(member_no)
);
;-- -. . -..- - / . -. - .-. -.--
insert into member (member_no, name, age) VALUE (1, 'chris', 20);
;-- -. . -..- - / . -. - .-. -.--
insert into member (member_no, name, age) value (2, 'carmen', 20);
;-- -. . -..- - / . -. - .-. -.--
insert into member (member_no, name, age) value (3, 'jjj', 20);
;-- -. . -..- - / . -. - .-. -.--
insert into borrowed (member_no, isbn)
values (2, '4231');
;-- -. . -..- - / . -. - .-. -.--
insert into borrowed (member_no, isbn) value (1, '3231');
;-- -. . -..- - / . -. - .-. -.--
insert into borrowed (member_no, isbn) value (1, '4324');
;-- -. . -..- - / . -. - .-. -.--
insert into borrowed (member_no, isbn)
values (2, '4234');
;-- -. . -..- - / . -. - .-. -.--
insert into borrowed (member_no, isbn)
values (1, '33');
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) from member)
select count(*)/memct
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) c from member)
select count(*)/memct
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) c from member)
select count(*)/memct.c
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) as c from member)
select *
from memct;
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) as c from member)
select count(*)/memct.c
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) as `c` from member)
select count(*)/memct.c
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) as `c` from member)
select count(*)/memct
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
memct;
;-- -. . -..- - / . -. - .-. -.--
with memct as (select count(*) as `c` from member)
select count(member_no)/memct
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
select avg(a.ct)
from (select count(*) * 1.0 as ct from member group by member_no) a;
;-- -. . -..- - / . -. - .-. -.--
select member_no, count(*) as tot
from borrowed
group by member_no;
;-- -. . -..- - / . -. - .-. -.--
select 1.0 * sum(totalborrowed)/count (distinct b.memb_no) as avg_per_member
from
(select memb_no, count(*) as totalborrowed
from borrowed
group by memb_no) t join borrowed b on t.membno = b.membno;
;-- -. . -..- - / . -. - .-. -.--
select avg (cnt)
from ( select count(isbn), member_no
from borrowed
roup by member_no
union
select 0, member_no
from member
where not exists ( select isbn from borrowed
where borrowed.member_no = member.memb_no) ) as books_count(cnt, memb_no);
;-- -. . -..- - / . -. - .-. -.--
select avg (cnt)
from ( select count(isbn), member_no
from borrowed
roup by member_no
union
select 0, member_no
from member
where not exists ( select isbn from borrowed
where borrowed.member_no = member.member_no) ) as books_count(cnt, member_no);
;-- -. . -..- - / . -. - .-. -.--
select avg (cnt)
from ( select count(isbn), member_no
from borrowed
group by member_no
union
select 0, member_no
from member
where not exists ( select isbn from borrowed
where borrowed.member_no = member.member_no) ) as books_count(cnt, member_no);
;-- -. . -..- - / . -. - .-. -.--
select *
from (
         (select member_no, count(isbn)
         from borrowed group by member_no)
        union
        (select member_no, 0 from member
            where not exists(select isbn from borrowed
            where member.member_no=borrowed.member_no)
         ) as mncmn;
;-- -. . -..- - / . -. - .-. -.--
select *
from (
         (select member_no, count(isbn)
         from borrowed group by member_no)
        union
        (select member_no, 0.0 from member
            where not exists(select isbn from borrowed
            where member.member_no=borrowed.member_no)
         ) as mncmn;
;-- -. . -..- - / . -. - .-. -.--
select avg(ct)
from (
         (select member_no, count(isbn)
         from borrowed group by member_no)
        union
        (select member_no, 0.0 from member
            where not exists(select isbn from borrowed
            where member.member_no=borrowed.member_no))
         ) as mncmn(mem, ct);
;-- -. . -..- - / . -. - .-. -.--
select avg(ct)
from (
         (select member_no, count(isbn)
         from borrowed group by member_no)
        union
        (select member_no, 0.0 from member
            where not exists(select isbn from borrowed
            where member.member_no=borrowed.member_no))
         ) as mncmn (mem, ct);
;-- -. . -..- - / . -. - .-. -.--
select avg(`count(isbn)`)
from (
         (select member_no, count(isbn)
         from borrowed group by member_no)
        union
        (select member_no, 0.0 from member
            where not exists(select isbn from borrowed
            where member.member_no=borrowed.member_no))
         ) as mncmn;
;-- -. . -..- - / . -. - .-. -.--
select avg(ct)
from (
         (select member_no, count(isbn)
         from borrowed group by member_no)
        union
        (select member_no, 0.0 from member
            where not exists(select isbn from borrowed
            where member.member_no=borrowed.member_no))
         ) as mncmn;
;-- -. . -..- - / . -. - .-. -.--
select *
from (
         (select member_no, count(isbn)
         from borrowed group by member_no)
        union
        (select member_no, 0.0 from member
            where not exists(select isbn from borrowed
            where member.member_no=borrowed.member_no))
         ) as mncmn;
;-- -. . -..- - / . -. - .-. -.--
select 1.0 * sum(totalborrowed)/count (distinct b.member_no) as avg_per_member
from
(select member_no, count(*) as totalborrowed
from borrowed
group by member_no) t join borrowed b on t.member_no = b.member_no;
;-- -. . -..- - / . -. - .-. -.--
select *
from department, instructor;
;-- -. . -..- - / . -. - .-. -.--
select *
from department join instructor;
;-- -. . -..- - / . -. - .-. -.--
select *
from department natural join instructor;
;-- -. . -..- - / . -. - .-. -.--
select *
from department inner join instructor;
;-- -. . -..- - / . -. - .-. -.--
select *
from department join instructor
    on department.dept_name = instructor.dept_name and department.dept_name='Fiance';
;-- -. . -..- - / . -. - .-. -.--
select *
from department join instructor
    on department.dept_name = instructor.dept_name;
;-- -. . -..- - / . -. - .-. -.--
select *
from department join instructor
    on department.dept_name = instructor.dept_name
where department.dept_name = '%inace';
;-- -. . -..- - / . -. - .-. -.--
select *
from department join instructor
    on department.dept_name = instructor.dept_name
where department.dept_name like '%inace';
;-- -. . -..- - / . -. - .-. -.--
select *
from department join instructor
    on department.dept_name = instructor.dept_name
where department.dept_name like 'F%';
;-- -. . -..- - / . -. - .-. -.--
show databases;
;-- -. . -..- - / . -. - .-. -.--
use try;
;-- -. . -..- - / . -. - .-. -.--
SELECT a.account_id, c.fed_id
-> FROM account a INNER JOIN customer c
->
 ON a.cust_id = c.cust_id
-> WHERE c.cust_type_cd = 'B';
;-- -. . -..- - / . -. - .-. -.--
SELECT a.account_id, c.fed_id
 FROM account a INNER JOIN customer c

 ON a.cust_id = c.cust_id
 WHERE c.cust_type_cd = 'B';
;-- -. . -..- - / . -. - .-. -.--
SELECT a.account_id, c.fed_id
FROM account a INNER JOIN customer c
ON a.cust_id = c.cust_id
WHERE c.cust_type_cd = 'B';
;-- -. . -..- - / . -. - .-. -.--
use large;
;-- -. . -..- - / . -. - .-. -.--
select salary
from instructor

(
    select


);
;-- -. . -..- - / . -. - .-. -.--
select salary
from instructor
);
;-- -. . -..- - / . -. - .-. -.--
select salary
from instructor;
;-- -. . -..- - / . -. - .-. -.--
select salary
from instructor
except;
;-- -. . -..- - / . -. - .-. -.--
select salary
from instructor
where salary not in (
select salary
from instructor i1, instructor i2
where i1.salary < i2.salary);
;-- -. . -..- - / . -. - .-. -.--
select instructor.salary
from instructor
where salary not in (
select salary
from instructor i1, instructor i2
where i1.salary < i2.salary);
;-- -. . -..- - / . -. - .-. -.--
select i.salary
from instructor i
where salary not in (
select salary
from instructor i1, instructor i2
where i1.salary < i2.salary);
;-- -. . -..- - / . -. - .-. -.--
select i.salary
from instructor i
where salary not in (
select i1.salary
from instructor i1, instructor i2
where i1.salary < i2.salary);
;-- -. . -..- - / . -. - .-. -.--
desc employee;
;-- -. . -..- - / . -. - .-. -.--
select *
from employee e join employee mg
    on e.emp_id = mg.superior_emp_id;
;-- -. . -..- - / . -. - .-. -.--
select e.fname, e.lname, e.emp_id
from employee e join employee mg
    on e.emp_id = mg.superior_emp_id;
;-- -. . -..- - / . -. - .-. -.--
select e.fname, e.lname, 'VS', e2.fname
from employee e, employee e2
where e.emp_id != e2.emp_id and e.title='Teller'
and e2.title='Teller';
;-- -. . -..- - / . -. - .-. -.--
select e.fname, e.lname, 'VS', e2.fname
from employee e, employee e2
where e.emp_id < e2.emp_id and e.title='Teller'
and e2.title='Teller';
;-- -. . -..- - / . -. - .-. -.--
(select i.salary
from instructor i)
except;
;-- -. . -..- - / . -. - .-. -.--
(select i1.salary
from instructor i1, instructor i2
where i1.salary < i2.salary);
;-- -. . -..- - / . -. - .-. -.--
select max(salary)
from instructor;
;-- -. . -..- - / . -. - .-. -.--
(select i.salary
from instructor i)
except
(select i1.salary
from instructor i1, instructor i2
where i1.salary < i2.salary);
;-- -. . -..- - / . -. - .-. -.--
select e.fname, e.lname, 'VS', e2.fname
from employee e, employee e2
where e.emp_id < e2.emp_id and e.title='Teller'
and e2.title='Teller'
limit 5;
;-- -. . -..- - / . -. - .-. -.--
desc tips;
;-- -. . -..- - / . -. - .-. -.--
select *, total_bill/tip as rate
from tips t
where time = 'Dinner' and tip> 1.0 or day is not null;
;-- -. . -..- - / . -. - .-. -.--
select *, total_bill/tip as rate
from tips t
where time = 'Dinner' and tip> 1.0 or day is not null
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, rate, day
from (select *, total_bill/tip as rate from tips) as t
where time = 'Dinner' and tip> 1.0 or day is not null
group by sex, size
# having
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select sex, size
from (select *, total_bill/tip as rate from tips) as t
where time = 'Dinner' and tip> 1.0 or day is not null
group by sex, size
# having
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select sex, size
from (select *, total_bill/tip as rate from tips) as t
where time = 'Dinner' and tip> 1.0 or day is not null
# group by sex, size
# having
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select *, total_bill/tip as rate from tips) as t
where time = 'Dinner' and tip> 1.0 or day is not null
# group by sex, size
# having
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate), count(*)
from (select *, total_bill/tip as rate from tips) as t
where time = 'Dinner' and tip> 1.0 or day is not null
group by sex, size
# having
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate), count(*)
from (select *, total_bill/tip as rate from tips) as t
where time = 'Dinner' and tip> 1.0 or day is not null
limit 10
group by sex, size
# having
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate), count(*)
from (select *, total_bill/tip as rate from tips) as t
where time = 'Dinner' and tip> 1.0 or day is not null
limit 10
group by sex, size;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate), count(*)
from (select *, total_bill/tip as rate from tips
      where time = 'Dinner' and tip> 1.0 or day is not null
    limit 10
    ) as t
limit 10
group by sex, size;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate), count(*)
from (select *, total_bill/tip as rate from tips
      where time = 'Dinner' and tip> 1.0 or day is not null
    limit 10
    ) as t;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate), count(*)
from (select *, total_bill/tip as rate from tips
      where time = 'Dinner' and tip> 1.0 or day is not null
    limit 10
    ) as t
group by sex, size;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate) as avg, count(*)
from (select *, total_bill/tip as rate from tips
      where time = 'Dinner' and tip> 1.0 or day is not null
    limit 10
    ) as t
group by sex, size;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate) as avg, count(*)
from (select *, total_bill/tip as rate from tips
      where time = 'Dinner' and tip> 1.0 or day is not null
    limit 10
    ) as t
group by sex, size
having avg > 10;
;-- -. . -..- - / . -. - .-. -.--
select sex, size, avg(rate) as avg, count(*)
from (select *, total_bill/tip as rate from tips
      where time = 'Dinner' and tip> 1.0 or day is not null
    order by tip, time
    limit 10
    ) as t
group by sex, size
having avg > 10;
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where account_id = max(account_id);
;-- -. . -..- - / . -. - .-. -.--
select max(account_id)
from account;