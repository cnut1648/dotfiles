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
select *
from 1;
;-- -. . -..- - / . -. - .-. -.--
select 1,2,3;
;-- -. . -..- - / . -. - .-. -.--
select 1,2,3
from (select 5,7);
;-- -. . -..- - / . -. - .-. -.--
select *
from (select 5,7);
;-- -. . -..- - / . -. - .-. -.--
select *
from (select 5,7 from follow);
;-- -. . -..- - / . -. - .-. -.--
select 5,7
from follow;
;-- -. . -..- - / . -. - .-. -.--
use large;
;-- -. . -..- - / . -. - .-. -.--
select 5,7
from department;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select 5 from department) as a, (select 2 from department) as b;
;-- -. . -..- - / . -. - .-. -.--
select a,b
from (select 5 from department) as a, (select 2 from department) as b;
;-- -. . -..- - / . -. - .-. -.--
select a.`5`,b.`2`
from (select 5 from department) as a, (select 2 from department) as b;
;-- -. . -..- - / . -. - .-. -.--
select a.`5`,b.`2`
from (select 5 from department) as a, (select 2 from department) as b
order by a.`5` desc, b.`2` asc;
;-- -. . -..- - / . -. - .-. -.--
select *
from takes;
;-- -. . -..- - / . -. - .-. -.--
select sec_id, grade, ID
from takes
order by sec_id, grade;
;-- -. . -..- - / . -. - .-. -.--
select sec_id, grade, ID
from takes
order by sec_id desc, grade asc;
;-- -. . -..- - / . -. - .-. -.--
insert into course(course_id)
values ('MATH101');
;-- -. . -..- - / . -. - .-. -.--
delete from course
where course_id like 'MATH%';
;-- -. . -..- - / . -. - .-. -.--
select id
from instructor
where salary >= any (select salary from instructor);
;-- -. . -..- - / . -. - .-. -.--
select *
from (1,2,3);
;-- -. . -..- - / . -. - .-. -.--
select *
from (1,2,3) as T;
;-- -. . -..- - / . -. - .-. -.--
select *
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
# group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select *
from section natural join classroom c
where year between 2015 and 2019;
;-- -. . -..- - / . -. - .-. -.--
select *
from section natural join classroom c
where year between 2000 and 2019;
;-- -. . -..- - / . -. - .-. -.--
select *
from section natural join classroom c
where year = 2009;
;-- -. . -..- - / . -. - .-. -.--
select *
from section natural join classroom c;
;-- -. . -..- - / . -. - .-. -.--
select course_id,sec_id,max(capacity)
from section natural join classroom c
group by course_id,sec_id;
;-- -. . -..- - / . -. - .-. -.--
select course_id,sec_id,max(capacity),building,room_number
from section natural join classroom c
group by course_id,sec_id;
;-- -. . -..- - / . -. - .-. -.--
select maxc.course_id,maxc.sec_id, c1.building,c1.room_number
from (
     select s2.course_id,s2.sec_id,max(c2.capacity) as m
    from classroom as c2 natural join section as s2
    group by s2.course_id,s2.sec_id
         ) as maxc, classroom as c1 natural join section as s1
where maxc.course_id=s1.course_id and maxc.sec_id=s1.sec_id
and maxc.m = c1.capacity;
;-- -. . -..- - / . -. - .-. -.--
select course_id,sec_id,max(capacity),building,room_number
from section natural join classroom c
group by course_id,sec_id
order by room_number;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SELECT c.dept_name
FROM (SELECT max(c.cnt) AS maxc FROM c) AS m, c
WHERE c.cnt = m.maxc;
;-- -. . -..- - / . -. - .-. -.--
SELECT C.dept_name
FROM (SELECT max(C.cnt) AS maxc FROM C) AS m, C
WHERE C.cnt = m.maxc;
;-- -. . -..- - / . -. - .-. -.--
WITH C(dept_name, cnt) AS (SELECT i1.dept_name, count(i1.ID) FROM instructor AS i1 GROUP BY
dept_name)
SELECT C.dept_name
FROM (SELECT max(C.cnt) AS maxc FROM C) AS m, C
WHERE C.cnt = m.maxc;
;-- -. . -..- - / . -. - .-. -.--
with M(dept, ct) as (select i.dept_name, count(distinct i.ID)
from department join instructor i on department.dept_name = i.dept_name
    group by i.dept_name
)
select *
from M;
;-- -. . -..- - / . -. - .-. -.--
with M(dept, ct) as (select i.dept_name, count(distinct i.ID)
from department join instructor i on department.dept_name = i.dept_name
    group by i.dept_name
)
select dept
from M
where M >= all (select * from M);
;-- -. . -..- - / . -. - .-. -.--
select dept
from M
where M.ct >= all (select * from M);
;-- -. . -..- - / . -. - .-. -.--
with M(dept, ct) as (select i.dept_name, count(distinct i.ID)
from department join instructor i on department.dept_name = i.dept_name
    group by i.dept_name
)
select dept
from M
where M.ct >= all (select * from M);
;-- -. . -..- - / . -. - .-. -.--
with M(dept, ct) as (select i.dept_name, count(distinct i.ID)
from department join instructor i on department.dept_name = i.dept_name
    group by i.dept_name
)
select dept
from department join M on dept_name = M.dept
where ct  >= (select max(M.ct) from M);
;-- -. . -..- - / . -. - .-. -.--
select id
from instructor
where salary = (select max(salary) from instructor);
;-- -. . -..- - / . -. - .-. -.--
select id
from instructor
where salary >= all (select salary from instructor);
;-- -. . -..- - / . -. - .-. -.--
select *
from instructor join advisor a on instructor.ID = a.i_ID;
;-- -. . -..- - / . -. - .-. -.--
select *
from instructor natural join advisor a;
;-- -. . -..- - / . -. - .-. -.--
select *
from instructor natural join teaches;
;-- -. . -..- - / . -. - .-. -.--
select *
from instructor join teaches t on instructor.ID = t.ID;
;-- -. . -..- - / . -. - .-. -.--
select *
from student left outer join takes t where student.ID = t.ID;
;-- -. . -..- - / . -. - .-. -.--
select *
from student left outer join takes t
where student.ID = t.ID;
;-- -. . -..- - / . -. - .-. -.--
select *
from student left outer join takes t on student.ID = t.ID;
;-- -. . -..- - / . -. - .-. -.--
select *
from student left outer join takes on true
where student.ID = takes.ID;
;-- -. . -..- - / . -. - .-. -.--
select *
from student inner join takes t on student.ID = t.ID;
;-- -. . -..- - / . -. - .-. -.--
select d.dept_name name
from instructor join department d on instructor.dept_name = d.dept_name
where salary = (select max(salary) from instructor i2 natural join department d2 where d2.dept_name = d.dept_name );
;-- -. . -..- - / . -. - .-. -.--
select d.dept_name, name
from instructor join department d on instructor.dept_name = d.dept_name
where salary = (select max(salary) from instructor i2 natural join department d2 where d2.dept_name = d.dept_name );
;-- -. . -..- - / . -. - .-. -.--
select dept_name, salary
from instructor
group by dept_name, salary;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, max(salary)
from instructor
group by dept_name, salary;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, max(salary)
from instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select d.dept_name, name, salary
from instructor join department d on instructor.dept_name = d.dept_name
where salary = (select max(salary) from instructor i2 natural join department d2 where d2.dept_name = d.dept_name );
;-- -. . -..- - / . -. - .-. -.--
create table branch
   (branch_name 	varchar(15)	not null unique,
    branch_city 	varchar(15)	not null,
    assets 		number		not null,
    primary key(branch_name));
;-- -. . -..- - / . -. - .-. -.--
delete from depositor;
;-- -. . -..- - / . -. - .-. -.--
drop table depositor;
;-- -. . -..- - / . -. - .-. -.--
delete from borrower;
;-- -. . -..- - / . -. - .-. -.--
drop table borrower;
;-- -. . -..- - / . -. - .-. -.--
delete from account;
;-- -. . -..- - / . -. - .-. -.--
drop table account;
;-- -. . -..- - / . -. - .-. -.--
delete from branch;
;-- -. . -..- - / . -. - .-. -.--
drop table branch;
;-- -. . -..- - / . -. - .-. -.--
delete from loan;
;-- -. . -..- - / . -. - .-. -.--
drop table loan;
;-- -. . -..- - / . -. - .-. -.--
delete from customer;
;-- -. . -..- - / . -. - .-. -.--
drop table customer;
;-- -. . -..- - / . -. - .-. -.--
create table account
   (account_number 	varchar(15)	not null unique,
    branch_name		varchar(15)	not null,
    balance 		number		not null,
    primary key(account_number));
;-- -. . -..- - / . -. - .-. -.--
create table account
(
    account_number varchar(15) not null unique,
    branch_name    varchar(15) not null,
    balance        number      not null,
    primary key (account_number)
);
;-- -. . -..- - / . -. - .-. -.--
create table loan
   (loan_number 	varchar(15)	not null unique,
    branch_name		varchar(15)	not null,
    amount 		number		not null,
    primary key(loan_number));
;-- -. . -..- - / . -. - .-. -.--
create table account
(
    `account_number` varchar(15) not null unique,
    `branch_name`    varchar(15) not null,
    `balance`        number      not null,
    primary key (`account_number`)
);
;-- -. . -..- - / . -. - .-. -.--
create table large.account
(
    `account_number` varchar(15) not null unique,
    `branch_name`    varchar(15) not null,
    `balance`        number      not null,
    primary key (`account_number`)
);
;-- -. . -..- - / . -. - .-. -.--
create table `large`.`account`

(
    `account_number` varchar(15) not null unique,
    `branch_name`    varchar(15) not null,
    `balance`        number      not null,
    primary key (`account_number`)
);
;-- -. . -..- - / . -. - .-. -.--
create table `large`.`account`
(
    `account_number` varchar(15) not null unique,
    `branch_name`    varchar(15) not null,
    `balance`        int not null,
    primary key (`account_number`)
);
;-- -. . -..- - / . -. - .-. -.--
create table branch
   (branch_name 	varchar(15)	not null unique,
    branch_city 	varchar(15)	not null,
    assets 		int		not null,
    primary key(branch_name));
;-- -. . -..- - / . -. - .-. -.--
create table customer
   (customer_name 	varchar(15)	not null unique,
    customer_street 	varchar(12)	not null,
    customer_city 	varchar(15)	not null,
    primary key(customer_name));
;-- -. . -..- - / . -. - .-. -.--
create table loan
   (loan_number 	varchar(15)	not null unique,
    branch_name		varchar(15)	not null,
    amount   int not null,
    primary key(loan_number));
;-- -. . -..- - / . -. - .-. -.--
create table depositor
   (customer_name 	varchar(15)	not null,
    account_number 	varchar(15)	not null,
    primary key(customer_name, account_number),
    foreign key(account_number) references account(account_number),
    foreign key(customer_name) references customer(customer_name));
;-- -. . -..- - / . -. - .-. -.--
create table borrower
   (customer_name 	varchar(15)	not null,
    loan_number 	varchar(15)	not null,
    primary key(customer_name, loan_number),
    foreign key(customer_name) references customer(customer_name),
    foreign key(loan_number) references loan(loan_number));
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Jones',	'Main',		'Harrison');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Smith',	'Main',		'Rye');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Hayes',	'Main',		'Harrison');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Curry',	'North',	'Rye');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Lindsay',	'Park',		'Pittsfield');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Turner',	'Putnam',	'Stamford');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Williams',	'Nassau',	'Princeton');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Adams',	'Spring',	'Pittsfield');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Johnson',	'Alma',		'Palo Alto');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Glenn',	'Sand Hill',	'Woodside');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Brooks',	'Senator',	'Brooklyn');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Green',	'Walnut',	'Stamford');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Jackson',	'University',	'Salt Lake');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('Majeris',	'First',	'Rye');
;-- -. . -..- - / . -. - .-. -.--
insert into customer	values ('McBride',	'Safety',	'Rye');
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Downtown',	'Brooklyn',	 900000);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Redwood',	'Palo Alto',	2100000);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Perryridge',	'Horseneck',	1700000);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Mianus',	'Horseneck',	 400200);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Round Hill',	'Horseneck',	8000000);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Pownal',	'Bennington',	 400000);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('North Town',	'Rye',		3700000);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Brighton',	'Brooklyn',	7000000);
;-- -. . -..- - / . -. - .-. -.--
insert into branch	values ('Central',	'Rye',		 400280);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-101',	'Downtown',	500);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-215',	'Mianus',	700);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-102',	'Perryridge',	400);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-305',	'Round Hill',	350);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-201',	'Perryridge',	900);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-222',	'Redwood',	700);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-217',	'Brighton',	750);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-333',	'Central',	850);
;-- -. . -..- - / . -. - .-. -.--
insert into account	values ('A-444',	'North Town',	625);
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Johnson','A-101');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Smith',	'A-215');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Hayes',	'A-102');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Hayes',	'A-101');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Turner',	'A-305');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Johnson','A-201');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Jones',	'A-217');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Lindsay','A-222');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Majeris','A-333');
;-- -. . -..- - / . -. - .-. -.--
insert into depositor values ('Smith',	'A-444');
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-17',		'Downtown',	1000);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-23',		'Redwood',	2000);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-15',		'Perryridge',	1500);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-14',		'Downtown',	1500);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-93',		'Mianus',	500);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-11',		'Round Hill',	900);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-16',		'Perryridge',	1300);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-20',		'North Town',	7500);
;-- -. . -..- - / . -. - .-. -.--
insert into loan	values ('L-21',		'Central',	570);
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Jones',	'L-17');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Smith',	'L-23');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Hayes',	'L-15');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Jackson',	'L-14');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Curry',	'L-93');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Smith',	'L-11');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Williams','L-17');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Adams',	'L-16');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('McBride',	'L-20');
;-- -. . -..- - / . -. - .-. -.--
insert into borrower values ('Smith',	'L-21');
;-- -. . -..- - / . -. - .-. -.--
select distinct customer_name
from customer
except
select customer_name
from customer natural join depositor natural join account natural join branch
where branch_city <> 'Brooklyn';
;-- -. . -..- - / . -. - .-. -.--
select customer_name
from customer natural join depositor natural join account natural join branch
where branch_city <> 'Brooklyn';
;-- -. . -..- - / . -. - .-. -.--
select *
from customer natural join depositor natural join account natural join branch
where branch_city <> 'Brooklyn';
;-- -. . -..- - / . -. - .-. -.--
select *
from customer natural join depositor natural join account natural join branch;
;-- -. . -..- - / . -. - .-. -.--
select distinct customer_name
from customer natual join depositor
except
select customer_name
from customer natural join depositor natural join account natural join branch
where branch_city <> 'Brooklyn';
;-- -. . -..- - / . -. - .-. -.--
select distinct customer_name
from customer natural join depositor
except
select customer_name
from customer natural join depositor natural join account natural join branch
where branch_city <> 'Brooklyn';
;-- -. . -..- - / . -. - .-. -.--
select *
from customer natural join depositor natural join account natural join branch
order by customer_name;
;-- -. . -..- - / . -. - .-. -.--
select *
from book;
;-- -. . -..- - / . -. - .-. -.--
select *
from borrowed;
;-- -. . -..- - / . -. - .-. -.--
desc borrowed;
;-- -. . -..- - / . -. - .-. -.--
select b.member_no, count(*)
from member left join borrowed b on member.member_no = b.member_no
group by b.member_no;
;-- -. . -..- - / . -. - .-. -.--
select m.member_no, count(*)
from member m left join borrowed b on m.member_no = b.member_no
group by m.member_no;
;-- -. . -..- - / . -. - .-. -.--
select m.member_no, count(isb)
from member m left join borrowed b on m.member_no = b.member_no
group by m.member_no;
;-- -. . -..- - / . -. - .-. -.--
select m.member_no, avg(isbn)
from member m left join borrowed b on m.member_no = b.member_no
group by m.member_no;
;-- -. . -..- - / . -. - .-. -.--
select m.member_no, count(isbn)
from member m left join borrowed b on m.member_no = b.member_no
group by m.member_no;
;-- -. . -..- - / . -. - .-. -.--
select avg(t.ct)
from (
select m.member_no, count(isbn) as ct
from member m left join borrowed b on m.member_no = b.member_no
group by m.member_no) as t;
;-- -. . -..- - / . -. - .-. -.--
select *
from department join instructor i on department.dept_name = i.dept_name;
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*)
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name;
;-- -. . -..- - / . -. - .-. -.--
select ct.c
from (
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name) as ct
where ct.c = (select max(ct.c) from ct);
;-- -. . -..- - / . -. - .-. -.--
select ct.c
from (
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name) as ct
where ct.c = 3;
;-- -. . -..- - / . -. - .-. -.--
select ct.dept_name, ct.c
from (
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name) as ct
where ct.c = 3;
;-- -. . -..- - / . -. - .-. -.--
select ct.dept_name, ct.c
from (
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name) as ct
where ct.c = (select max(ct.c) from ct);
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having c = max(c);
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) = 3;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  c = 3;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  c = max(c);
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c,max(c)
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having   max(c);
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c,max(count(*))
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having   max(c);
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c,count(*)
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) < 5;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c,count(*)
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) = 5;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c,count(*)
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) = 3;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) < 3;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) <= 3;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) >= c;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) > c;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) = c;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) <= c;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
having  max(c) <= c;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
limit 1;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
order by c
limit 1;
;-- -. . -..- - / . -. - .-. -.--
select i.dept_name,count(*) c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
order by c desc
limit 1;
;-- -. . -..- - / . -. - .-. -.--
select ct.dept_name
from (
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name) as ct join department d on d.dept_name = ct.dept_name;
;-- -. . -..- - / . -. - .-. -.--
select ct.dept_name
from (
select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name) as ct join department d on d.dept_name = ct.dept_name
where ct.c = (select max(ct.c) from ct);
;-- -. . -..- - / . -. - .-. -.--
with ct(d,c) as (select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name)


select i.dept_name,count(*) c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name
order by c desc
limit 1;
;-- -. . -..- - / . -. - .-. -.--
select dept_name
from department, ct
where dept_name = ct.d;
;-- -. . -..- - / . -. - .-. -.--
with ct(d,c) as (select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name)
select dept_name
from department, ct
where dept_name = ct.d;
;-- -. . -..- - / . -. - .-. -.--
with ct(d,c) as (select i.dept_name,count(*) as c
from department join instructor i on department.dept_name = i.dept_name
group by i.dept_name)
select dept_name
from department, ct
where dept_name = ct.d and ct.c = (select max(ct.c) from ct);
;-- -. . -..- - / . -. - .-. -.--
select *
from instructor
group by id, `year`, course_id;
;-- -. . -..- - / . -. - .-. -.--
select *
from instructor natural join teaches t
group by id, `year`, course_id;
;-- -. . -..- - / . -. - .-. -.--
select ID
from instructor natural join teaches t
group by id, `year`, course_id
having count(*) >= 2;
;-- -. . -..- - / . -. - .-. -.--
select ID, name
from instructor natural join teaches t
group by id, `year`, course_id
having count(*) >= 2;
;-- -. . -..- - / . -. - .-. -.--
select course_id
from teaches
where (1= (select count(distinct section.sec_id) from section where section.semester='Spring'))
and (1= (select count(distinct section.sec_id) from section where section.semester='Fall'));
;-- -. . -..- - / . -. - .-. -.--
select course_id
from teaches
where exists (select * from section where section.semester='Spring' and section.course_id=teaches.course_id)
and exists (select * from section where section.semester='Fall' and section.course_id=teaches.course_id);
;-- -. . -..- - / . -. - .-. -.--
select course_id
from course
where exists (select * from section where section.semester='Spring' and section.course_id=teaches.course_id)
and exists (select * from section where section.semester='Fall' and section.course_id=teaches.course_id);
;-- -. . -..- - / . -. - .-. -.--
select course_id
from course
where exists (select * from section where section.semester='Spring' and section.course_id=course.course_id)
and exists (select * from section where section.semester='Fall' and section.course_id=course.course_id);
;-- -. . -..- - / . -. - .-. -.--
select course.course_id
from course
where exists (select * from section where section.semester='Spring' and section.course_id=course.course_id)
and exists (select * from section where section.semester='Fall' and section.course_id=course.course_id);
;-- -. . -..- - / . -. - .-. -.--
;;
;-- -. . -..- - / . -. - .-. -.--
select count(*) as ct
from department natural join instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, count(*) as ct
from department natural join instructor
group by dept_name;
;-- -. . -..- - / . -. - .-. -.--
select dept_name, count(*) as ct
from department natural join instructor
group by dept_name
having ct >= all (select
dept_name, count(*) as ct
from department natural join instructor
group by dept_name);
;-- -. . -..- - / . -. - .-. -.--
select dept_name, count(*) as ct
from department natural join instructor
group by dept_name
having ct >= all (select
count(*) as ct
from department natural join instructor
group by dept_name);
;-- -. . -..- - / . -. - .-. -.--
select count(*)
from takes
group by course_id;
;-- -. . -..- - / . -. - .-. -.--
select course_id,count(*)
from takes
group by course_id;
;-- -. . -..- - / . -. - .-. -.--
select *
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(email) as count
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(distinct follower) `followers ct`
from follow, user
where followee in (select email from celebrity)
    and user.email = followee
group by followee
order by `followers ct`;
;-- -. . -..- - / . -. - .-. -.--
select u.name
from celebrity c1 join user u on c1.email = u.email
where not exists (
    select follower
    from  follow
    where c1.email = follower
    );
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(distinct follower) `followers ct`
from follow, user
where followee in (select email from celebrity)
  and user.email = followee
group by followee
order by `followers ct`;
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
)  and  u3.email != u1.email and u2.email != u1.email and u3.email != u2.email;
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
select user.name, followee as email, count(*) as ct
from vendor_ambassador join vendor on vendor_ambassador.vendorid = vendor.id
                       join user on vendor_ambassador.email = user.email, follow
where followee = user.email
group by followee;
;-- -. . -..- - / . -. - .-. -.--
select t.id, t.description, count(email) as count
from topic t left outer join blurt_analysis ba
                             on t.id = ba.topicid
group by t.id
order by t.id;
;-- -. . -..- - / . -. - .-. -.--
select user.name, count(distinct follower) `followers ct`
from follow, user
where followee in (select email from celebrity)
  and user.email = followee
group by followee;
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