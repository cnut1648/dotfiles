select account_id
from account
where avail_balance > any(select a.avail_balance
    from account a inner join individual i on a.cust_id = i.cust_id
    where i.fname = 'Frank' and i.lname = 'Tucker')