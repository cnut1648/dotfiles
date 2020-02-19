# select sex, size,
select sex, size, avg(rate) as avg, count(*)
from (select *, total_bill/tip as rate from tips
      where time = 'Dinner' and tip> 1.0 or day is not null
    order by tip, time
    limit 10
    ) as t
group by sex, size
having avg > 10;
# limit 10;


desc tips;