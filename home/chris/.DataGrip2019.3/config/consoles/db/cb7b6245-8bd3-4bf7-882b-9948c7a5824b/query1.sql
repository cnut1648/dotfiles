select t.id, t.description, count(*) as ct
from topic t join blurt_analysis ba on t.id = ba.topicid
group by t.id
order by t.id
