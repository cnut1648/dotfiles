with ct as
    (select count(*) from member)
select count(*) / ct
from borrowed