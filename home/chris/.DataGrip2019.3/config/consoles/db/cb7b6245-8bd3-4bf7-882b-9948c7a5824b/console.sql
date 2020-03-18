with ct as
    (select count(*) from member)
select count(*) / ct
from borrowed

# select t.id, t.description, count(email) as count
select *
from topic t left outer join blurt_analysis ba
    on t.id = ba.topicid
group by t.id
order by t.id;