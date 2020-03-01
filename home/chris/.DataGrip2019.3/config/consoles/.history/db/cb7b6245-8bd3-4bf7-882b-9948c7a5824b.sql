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
;-- -. . -..- - / . -. - .-. -.--
select *
from employee e
where e.emp_id in (select e2.superior_emp_id from employee e2);
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where avail_balance > some (select a.avail_balance
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker');
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where avail_balance > any(select a.avail_balance

    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker');
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where avail_balance > some(select a.avail_balance
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker');
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where avail_balance > any(select a.avail_balance
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker');
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where avail_balance in (select a.avail_balance
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker');
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where (avail_balance,lname) in (select a.avail_balance, lname
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker');
;-- -. . -..- - / . -. - .-. -.--
select account_id
from account
where (avail_balance,pending_balance) in (select a.avail_balance,a.pending_balance
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker');
;-- -. . -..- - / . -. - .-. -.--
show databases;
;-- -. . -..- - / . -. - .-. -.--
use project;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`blurt_analysis` (
  `email` VARCHAR(45) NOT NULL,
  `blurtid` INT NOT NULL,
  `topicid` INT NOT NULL,
  `confidence` INT NULL,
  `sentiment` INT NULL,
  PRIMARY KEY(`email`,`blurtid`,`topicid`),
  FOREIGN KEY(`email`,`blurtid`) REFERENCES blurt(`email`,`blurtid`),
  FOREIGN KEY(`topicid`) REFERENCES topic(`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`advertisement` (
  `id` INT NOT NULL,
  `content` INT NULL,
  `vendorid` INT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY(`vendorid`) REFERENCES vendor(`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`user` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `data_of_birth` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`email`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`celebrity` (
  `email` VARCHAR(45) NOT NULL,
  `website` VARCHAR(45) NULL,
  `kind` VARCHAR(45) NULL,
  PRIMARY KEY (`email`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`blurt` (
  `blurtid` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `text` VARCHAR(100) NULL,
  `location` VARCHAR(45) NULL,
  `time` VARCHAR(45) NULL,
  PRIMARY KEY (`blurtid`,`email`),
  FOREIGN KEY (`email`) REFERENCES user(`email`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`hobby` (
  `email` VARCHAR(45) NOT NULL,
  `hobby` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`,`hobby`),
  FOREIGN KEY (`email`) REFERENCES user(`email`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`follow` (
  `follower` VARCHAR(45) NOT NULL,
  `followee` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`follower`,`followee`),
  FOREIGN KEY (`follower`) REFERENCES user(`email`),
  FOREIGN KEY (`followee`) REFERENCES user(`email`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`vendor` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`vendor_ambassador` (
  `vendorid` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  FOREIGN KEY (`email`) REFERENCES user(`email`),
  FOREIGN KEY (`vendorid`) REFERENCES vendor(`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`topic` (
  `id` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`vendor_topics` (
  `vendorid` INT NOT NULL,
  `topicid` INT NOT NULL,blurt_analysis
  PRIMARY KEY(`vendorid`,`topicid`),
  FOREIGN KEY(`vendorid`) REFERENCES vendor(`id`),
  FOREIGN KEY(`topicid`) REFERENCES topic(`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`blurt_analysis` (
  `email` VARCHAR(45) NOT NULL,
  `blurtid` INT NOT NULL,
  `topicid` INT NOT NULL,
  `confidence` INT NULL,
  `sentiment` INT NULL,
  PRIMARY KEY(`email`,`blurtid`,`topicid`),
  FOREIGN KEY(`email`) REFERENCES blurt(`email`),
  FOREIGN KEY(`blurtid`) REFERENCES blurt(`blurtid`),
  FOREIGN KEY(`topicid`) REFERENCES topic(`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`advertisement` (
  `id` INT NOT NULL,
  `content` varchar(50) NULL,
  `vendorid` INT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY(`vendorid`) REFERENCES vendor(`id`));
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`user_ad` (
  `email` VARCHAR(45) NOT NULL,
  `adid` INT NOT NULL,
  PRIMARY KEY(`email`,`adid`),
  FOREIGN KEY(`email`) REFERENCES user(`email`),
  FOREIGN KEY(`adid`) REFERENCES advertisement(`id`));
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description,
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description
from topic t join blurt_analysis ba on t.id = ba.topicid;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(*)
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id;
;-- -. . -..- - / . -. - .-. -.--
select sum(ct)
from
(select t.id, t.description, count(*) as ct
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id);
;-- -. . -..- - / . -. - .-. -.--
select sum(ct)
from
(
    select t.id, t.description, count(*) as ct
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id
    );
;-- -. . -..- - / . -. - .-. -.--
select sum(ct)
from (
    select t.id, t.description, count(*) as ct
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id
    );
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(*) as ct
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(*) as ct
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id
order by ct;
;-- -. . -..- - / . -. - .-. -.--
select *
from user
where type = "C";
;-- -. . -..- - / . -. - .-. -.--
select *
from user, follow
where type = "C";
;-- -. . -..- - / . -. - .-. -.--
select distinct email
from user, follow
where type = "C";
;-- -. . -..- - / . -. - .-. -.--
select followee, count(*)
from user, follow
where type = "C"
group by followee;
;-- -. . -..- - / . -. - .-. -.--
(select email from user where type = "C");
;-- -. . -..- - / . -. - .-. -.--
select
from follow, (select email celebrity from user where type = "C");
;-- -. . -..- - / . -. - .-. -.--
select *
from follow, (select email celebrity from user where type = "C");
;-- -. . -..- - / . -. - .-. -.--
select *
from follow, (select email celebrity
    from user where type = 'C');
;-- -. . -..- - / . -. - .-. -.--
select *
from follow, (select email celebrity
    from user where type = 'C') c;
;-- -. . -..- - / . -. - .-. -.--
select count()
from user,(select email celebrity
    from user where type = 'C') c;
;-- -. . -..- - / . -. - .-. -.--
select *
from user,(select email celebrity
    from user where type = 'C') c;
;-- -. . -..- - / . -. - .-. -.--
select *
from user,(select email celebrity
    from user where type = 'C') c
where user.email = c.celebrity;
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower)
from follow
where followee in (select email from celebrity)
group by followee;
;-- -. . -..- - / . -. - .-. -.--
select sum(CT)
    from(
    select followee, count(distinct follower) CT
                           from follow
where followee in (select email from celebrity)
group by followee
    ) t;
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower) CT
                           from follow
where followee in (select email from celebrity)
group by followee;
;-- -. . -..- - / . -. - .-. -.--
select *
from follow
where followee = 'Brad_Pitt@pitt.com';
;-- -. . -..- - / . -. - .-. -.--
select distinct(follower)
from follow
where followee = 'Brad_Pitt@pitt.com';
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower) CT
                           from follow
where followee in (select email from celebrity);
;-- -. . -..- - / . -. - .-. -.--
select followee
                           from follow
where followee in  (select email from celebrity);
;-- -. . -..- - / . -. - .-. -.--
select distinct followee
                           from follow
where followee in  (select email from celebrity);
;-- -. . -..- - / . -. - .-. -.--
select follower
                           from follow
where followee in  (select email from celebrity);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `blurts`.`vendor_topics` (
  `vendorid` INT NOT NULL,
  `topicid` INT NOT NULL,
  PRIMARY KEY(`vendorid`,`topicid`),
  FOREIGN KEY(`vendorid`) REFERENCES vendor(`id`),
  FOREIGN KEY(`topicid`) REFERENCES topic(`id`));
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower) CT
    from follow
    where followee in (select email from celebrity)
    group by followee;
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower) CT
    from follow natural join user
    where followee in (select email from celebrity)
    group by followee;
;-- -. . -..- - / . -. - .-. -.--
select name, count(distinct follower) CT
    from follow natural join user
    where followee in (select email from celebrity)
    group by followee;
;-- -. . -..- - / . -. - .-. -.--
with ct as
    (select count(*) from member)
select count(*) / ct
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(*) as ct
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(*) as ct
from topic t left outer join blurt_analysis ba
#     on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(*) as ct
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(t.id) as ct
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(1) as ct
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower) CT
from follow
where followee in (select email from celebrity)
group by followee;
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower) CT
from follow
where followee in (select email from celebrity)
group by followee
order by CT;
;-- -. . -..- - / . -. - .-. -.--
select followee, count(distinct follower) CT
from follow, user
where followee in (select email from celebrity)
group by followee
order by CT;
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(distinct follower) CT
from follow, user
where followee in (select email from celebrity)
group by followee
order by CT;
;-- -. . -..- - / . -. - .-. -.--
use blurts;
;-- -. . -..- - / . -. - .-. -.--
select *
from user, blurt
where type="C" and blurt.email=user.email;
;-- -. . -..- - / . -. - .-. -.--
select user.email, count(*) as ct
from user join blurt on user.email = blurt.email
where type='C'
group by user.email;
;-- -. . -..- - / . -. - .-. -.--
select user.email, count(*) as ct
from user join blurt on user.email = blurt.email
where type='C'
group by user.email
order by ct;
;-- -. . -..- - / . -. - .-. -.--
select user.email, count(*) as ct
from user join blurt on user.email = blurt.email
where type='C'
group by user.email
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select u.name
from celebrity c1 join user u on celebrity.email = u.email
where not exists (
    select c2.email
    from celebrity c2, follow
    where c1.email = follower
    );
;-- -. . -..- - / . -. - .-. -.--
select u.name
from celebrity c1 join user u on c1.email = u.email
where not exists (
    select c2.email
    from celebrity c2, follow
    where c1.email = follower
    );
;-- -. . -..- - / . -. - .-. -.--
select u.name
from celebrity c1 join user u on c1.email = u.email
where not exists (
    select follower
#     select c2.email
    from celebrity c2, follow
    where c1.email = follower
    );
;-- -. . -..- - / . -. - .-. -.--
select user.name, v.email, count(*) as count
from follow, user join
     (vendor_topics natural join vendor_ambassador) v
                on v.email = user.email
where followee = v.email
group by v.email;
;-- -. . -..- - / . -. - .-. -.--
select user.name, v.email
#      , count(*) as count
from follow, user join
     (vendor_topics natural join vendor_ambassador) v
                on v.email = user.email
where followee = v.email;
;-- -. . -..- - / . -. - .-. -.--
select user.name, v.email
#      , count(*) as count
from follow, user join
     (vendor_topics natural join vendor_ambassador) v
                on v.email = user.email;
;-- -. . -..- - / . -. - .-. -.--
select user.name, v.email
#      , count(*) as count
from follow, (user join
     (vendor_topics natural join vendor_ambassador) v
                on v.email = user.email);
;-- -. . -..- - / . -. - .-. -.--
select user.name, v.email
#      , count(*) as count
from follow join (user join
     (vendor_topics natural join vendor_ambassador) v
                on v.email = user.email);
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador natural join vendor;
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador natural join vendor on vendor_ambassador.vendorid = vendor.id;
;-- -. . -..- - / . -. - .-. -.--
select user.name, v.email
#      , count(*) as count
from follow,
     user join
    (vendor_ambassador join vendor ve on vendor_ambassador.vendorid = ve.id) v;
;-- -. . -..- - / . -. - .-. -.--
select *
    (vendor_ambassador join vendor ve on vendor_ambassador.vendorid = ve.id) v;
;-- -. . -..- - / . -. - .-. -.--
select *
 from   (vendor_ambassador join vendor  on vendor_ambassador.vendorid = vendor.id) v;
;-- -. . -..- - / . -. - .-. -.--
select *
 from   (vendor_ambassador join vendor  on vendor_ambassador.vendorid = vendor.id) as v;
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id;
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user;
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email;
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email, follow;
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email, follow
where followee = user.email;
;-- -. . -..- - / . -. - .-. -.--
select *
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email, follow
where followee = user.email
group by followee;
;-- -. . -..- - / . -. - .-. -.--
select user.name, followee, count(*)
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email, follow
where followee = user.email
group by followee;
;-- -. . -..- - / . -. - .-. -.--
select user.name, followee, count(*) as ct
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email, follow
where followee = user.email
group by followee
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select *
from blurt natural join blurt_analysis ba
using blurtid, email;
;-- -. . -..- - / . -. - .-. -.--
select *
from blurt natural join blurt_analysis ba
using (blurtid, email);
;-- -. . -..- - / . -. - .-. -.--
select *
from blurt natural join blurt_analysis ba;
;-- -. . -..- - / . -. - .-. -.--
select *
from blurt natural join blurt_analysis ba
join topic t on ba.topicid = t.id
group by topicid;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, location, count(*) as ct, avg(sentiment)
from blurt natural join blurt_analysis ba
join topic t on ba.topicid = t.id
group by topicid, location;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, location, count(*) as ct, avg(sentiment) as avg
from blurt natural join blurt_analysis ba
join topic t on ba.topicid = t.id
group by topicid, location
having avg < 0;
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name
and u2.email not in (select followee
    from follow where follower = u1.email)
and exists(select topicid
        from blurt_analysis ba
        where ba.email = u1.name
    intersect
        select topicid
    from blurt_analysis ba2
    where ba2.email = u2.name
    );
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name
and u2.email not in (select followee
    from follow where follower = u1.email);
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name
and u2.email not in (select followee
    from follow where follower = u1.email)
and exists(select ba.topicid
        from blurt_analysis ba
        where ba.email = u1.name
    intersect
        select ba2.topicid
    from blurt_analysis ba2
    where ba2.email = u2.name
    );
;-- -. . -..- - / . -. - .-. -.--
select *
from blurt_analysis
where email = 'Albert_Carey@msn.com';
;-- -. . -..- - / . -. - .-. -.--
select ba.topicid
from blurt_analysis ba
where email = 'Albert_Carey@msn.com'
intersect
select ba2.topicid
from blurt_analysis ba2
where email = 'Roger_Larson@yahoo.com';
;-- -. . -..- - / . -. - .-. -.--
select ba.topicid
from blurt_analysis ba
where ba.email = 'Albert_Carey@msn.com'
intersect
select ba2.topicid
from blurt_analysis ba2
where ba2.email = 'Roger_Larson@yahoo.com';
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name
# and u2.email not in (select followee
#     from follow where follower = u1.email)
and exists ((select ba.topicid
        from blurt_analysis ba
        where ba.email = u1.name )
    intersect
        (select ba2.topicid
    from blurt_analysis ba2
    where ba2.email = u2.name)
    );
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name
# and u2.email not in (select followee
#     from follow where follower = u1.email)
and not exists ((select ba.topicid
        from blurt_analysis ba
        where ba.email = u1.name )
    intersect
        (select ba2.topicid
    from blurt_analysis ba2
    where ba2.email = u2.name)
    );
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name
and u2.email not in (select followee
    from follow where follower = u1.email)
and exists ((select ba.topicid
        from blurt_analysis ba
        where ba.email = u1.name )
    intersect
        (select ba2.topicid
    from blurt_analysis ba2
    where ba2.email = u2.name)
    );
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name;
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name

and u2.email not in (select followee
    from follow where follower = u1.email)
and exists ((select ba.topicid
        from blurt_analysis ba
        where ba.email = u1.email)
    intersect
        (select ba2.topicid
    from blurt_analysis ba2
    where ba2.email = u2.email)
    );
;-- -. . -..- - / . -. - .-. -.--
select *
from user u1, user u2, user u3
where u2.email in (
    select followee
    from follow
    where follower = u1.email
    ) and u3.email in (
    select followee
    from follow
    where follower = u2.email
    ) and u3.email not in (
    select followee
    from follow
    where follower = u1.email

    );
;-- -. . -..- - / . -. - .-. -.--
select u1.email, u2.email, u3.email
from user u1, user u2, user u3
where u2.email in (
    select followee
    from follow
    where follower = u1.email
    ) and u3.email in (
    select followee
    from follow
    where follower = u2.email
    ) and u3.email not in (
    select followee
    from follow
    where follower = u1.email

    );
;-- -. . -..- - / . -. - .-. -.--
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid;
;-- -. . -..- - / . -. - .-. -.--
select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
group by vendorid;
;-- -. . -..- - / . -. - .-. -.--
select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid;
;-- -. . -..- - / . -. - .-. -.--
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid)
group by vendorid;
;-- -. . -..- - / . -. - .-. -.--
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid;
;-- -. . -..- - / . -. - .-. -.--
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
join vendor on vendorid
group by vendorid
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select name, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
join vendor on vendorid
group by vendorid
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select name, s.ct
from vendor join (
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid) s;
;-- -. . -..- - / . -. - .-. -.--
select name, s.ct
from vendor join (
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid) s using vendorid;
;-- -. . -..- - / . -. - .-. -.--
select name, s.ct
from vendor join (
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid) s on vendorid;
;-- -. . -..- - / . -. - .-. -.--
select name, s.ct
from vendor join (
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid) s on vendor.id = s.vendorid;
;-- -. . -..- - / . -. - .-. -.--
select vendorid,name, s.ct
from vendor join (
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid) s on vendor.id = s.vendorid
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(distinct follower) CT
from follow, user
where followee in (select email from celebrity)
    and user.email = followee
group by followee
order by CT;
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(distinct follower) `followers ct`
from follow, user
where followee in (select email from celebrity)
    and user.email = followee
group by followee
order by CT;
;-- -. . -..- - / . -. - .-. -.--
select user.name, followee, count(*) as ct
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email, follow
where followee = user.email
group by followee
order by ct;
;-- -. . -..- - / . -. - .-. -.--
select u1.name, u2.name
from user u1, user u2
where u1.name != u2.name
and u2.email not in (select followee
    from follow where follower = u1.email)
and exists ((select ba.topicid
        from blurt_analysis ba
        where ba.email = u1.email)
    intersect
        (select ba2.topicid
    from blurt_analysis ba2
    where ba2.email = u2.email)
    );
;-- -. . -..- - / . -. - .-. -.--
select 1<null;
;-- -. . -..- - / . -. - .-. -.--
with max budget (value) as
(select max(budget)
from department);
;-- -. . -..- - / . -. - .-. -.--
use large
with max budget (value) as

(select max(budget)
from department);
;-- -. . -..- - / . -. - .-. -.--
select budget
from department, max budget
where department.budget = max budget.value;
;-- -. . -..- - / . -. - .-. -.--
with max_budget (value) as
         (select max(budget)
          from department)
select budget
from department, max budget
where department.budget = max budget.value;
;-- -. . -..- - / . -. - .-. -.--
use large;
;-- -. . -..- - / . -. - .-. -.--
with T(ct) as (select count(*) from member)
select count(*)/T
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
with T(ct) as (select count(*) from member)
select count(*)/T.ct
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
with T as (select count(*) from member)
select count(*)/T
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
select distinct takes.ID
from takes, instructor, teaches
where takes.course_id = teaches.course_id
and takes.sec_id = teaches.sec_id
and takes.semester=teaches.semester
and takes.year = teaches.year
and teaches.ID = instructor.ID
and instructor.name='Einstein';
;-- -. . -..- - / . -. - .-. -.--
select *
from takes
where ID='1234';
;-- -. . -..- - / . -. - .-. -.--
select *
from takes
where ID='12345';
;-- -. . -..- - / . -. - .-. -.--
select grade
from takes
where ID='12345';
;-- -. . -..- - / . -. - .-. -.--
(select grade
    from takes
    where id = '1234');
;-- -. . -..- - / . -. - .-. -.--
with max_budget (value) as
         (select max(budget)
          from department)
select budget
from department, max_budget
where department.budget = max_budget.value;
;-- -. . -..- - / . -. - .-. -.--
with ct as (select count(*) from member)
select count(*)/ct
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(distinct follower) `followers ct`
from follow, user
where followee in (select email from celebrity)
    and user.email = followee
group by followee
order by `followers ct`;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(email) as count
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(*) as ct
from user join blurt on user.email = blurt.email
where type='C'
group by user.email
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select u.name
from celebrity c1 join user u on c1.email = u.email
where not exists (
    select follower
    from  follow
    where c1.email = follower
    );
;-- -. . -..- - / . -. - .-. -.--
select user.name, followee as email, count(*) as ct
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
join user on vendor_ambassador.email = user.email, follow
where followee = user.email
group by followee
order by ct;
;-- -. . -..- - / . -. - .-. -.--
select name, s.ct
from vendor join (
select vendorid, count(*) as ct
from (select vendorid, email
from vendor_topics join blurt_analysis ba on vendor_topics.topicid = ba.topicid
       except
select vendorid,email
from advertisement join user_ad ua on advertisement.id = ua.adid) s
group by vendorid) s on vendor.id = s.vendorid
order by ct desc;
;-- -. . -..- - / . -. - .-. -.--
select u1.name as A, u2.name as B
from user u1, user u2
where u1.name != u2.name
and u2.email not in (select followee
    from follow where follower = u1.email)
and exists ((select ba.topicid
        from blurt_analysis ba
        where ba.email = u1.email)
    intersect
        (select ba2.topicid
    from blurt_analysis ba2
    where ba2.email = u2.email)
    );
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, location as state, count(*) as ct, avg(sentiment) as avg
from blurt natural join blurt_analysis ba
join topic t on ba.topicid = t.id
group by topicid, location
having avg < 0;
;-- -. . -..- - / . -. - .-. -.--
select u1.email as A, u2.email as B, u3.email as C
from user u1, user u2, user u3
where u2.email in (
    select followee
    from follow
    where follower = u1.email
    ) and u3.email in (
    select followee
    from follow
    where follower = u2.email
    ) and u3.email not in (
    select followee
    from follow
    where follower = u1.email

    );
;-- -. . -..- - / . -. - .-. -.--
select u1.email as A, u2.email as B, u3.email as C
from user u1, user u2, user u3
where u2.email in (
    select followee
    from follow f1
    where follower = u1.email
    ) and u3.email in (
    select followee
    from follow f2
    where follower = u2.email
    ) and u3.email not in (
    select followee
    from follow f3
    where follower = u1.email
);
;-- -. . -..- - / . -. - .-. -.--
select u1.email as A, u2.email as B, u3.email as C
from user u1, user u2, user u3
where u2.email in (
    select followee
    from follow f1
    where follower = u1.email
    ) and u3.email in (
    select followee
    from follow f2
    where follower = u2.email
    ) and u3.email not in (
    select followee
    from follow f3
    where follower = u1.email
)  and u1.email != u2.email and u3.email != u1.email;
;-- -. . -..- - / . -. - .-. -.--
select u1.email as A, u2.email as B, u3.email as C
from user u1, user u2, user u3
where u2.email in (
    select followee
    from follow f1
    where follower = u1.email
) and u3.email in (
    select followee
    from follow f2
    where follower = u2.email
) and u3.email not in (
    select followee
    from follow f3
    where follower = u1.email
)  and u1.email != u2.email and u3.email != u1.email;
;-- -. . -..- - / . -. - .-. -.--
select u1.email as A, u2.email as B, u3.email as C
from user u1, user u2, user u3
where u2.email in (
    select followee
    from follow f1
    where follower = u1.email
) and u3.email in (
    select followee
    from follow f2
    where follower = u2.email
) and u3.email not in (
    select followee
    from follow f3
    where follower = u1.email
)  and  u3.email != u1.email;