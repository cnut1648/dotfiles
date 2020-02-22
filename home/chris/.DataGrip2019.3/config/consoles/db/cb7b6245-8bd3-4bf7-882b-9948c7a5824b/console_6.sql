select *
from follow,(select email celebrity
    from user where type = 'C') c
where followee = c.celebrity

    select name, count(distinct follower) CT
    from follow natural join user
    where followee in (select email from celebrity)
    group by followee


select distinct(follower)
from follow
where followee = 'Brad_Pitt@pitt.com'


select follower
                           from follow
where followee in  (select email from celebrity)
select
from blurt
where email in (select email from celebrity)
group by email


