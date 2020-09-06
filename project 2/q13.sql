with recursive pr(src,dst) as (
with tchain as (select distinct emp1.title as src, emp2.title as dst 
from employees.titles as emp1, employees.titles as emp2 
where emp1.to_date = emp2.from_date 
and emp1.emp_no = emp2.emp_no 
and emp1.title <>emp2.title
and emp1.from_date<emp2.from_date)
(select * from tchain)
union
(select pr.src,tchain.dst from pr ,tchain
where pr.dst = tchain.src))
select t1.title as src,t2.title as dst from (select distinct title from employees.titles) as t1, (select distinct title from employees.titles) as t2 where not exists (select * from pr where pr.src = t1.title and pr.dst = t2.title)
order by t1.title,t2.title;