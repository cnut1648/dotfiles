select *
from employee e
where e.emp_id in (select e2.superior_emp_id from employee e2);