with
     select account_id
from account
where (avail_balance,pending_balance) in (select a.avail_balance,a.pending_balance
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker')