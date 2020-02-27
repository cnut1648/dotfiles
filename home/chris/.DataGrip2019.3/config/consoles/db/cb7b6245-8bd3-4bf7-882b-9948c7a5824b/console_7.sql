with max_budget (value) as
         (select max(budget)
          from department)
select budget
from department, max_budget
where department.budget = max_budget.value;


with T(ct) as (select count(*) from member)
select cc/T.ct
from(select count(*) as cc
from borrowed) as i, T


