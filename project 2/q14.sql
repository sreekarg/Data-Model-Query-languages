with recursive pr(src,dst,years) as (
with tchain as (select emp1.title as src, emp2.title as dst, avg(year(emp1.to_date)-year(emp1.from_date)+1) as years
from employees.titles as emp1, employees.titles as emp2 
where emp1.to_date = emp2.from_date 
and emp1.emp_no = emp2.emp_no 
and emp1.title <>emp2.title
and emp1.from_date<emp2.from_date
group by src, dst)
(select * from tchain)
union distinct
(select pr.src,tchain.dst, pr.years+tchain.years as years from pr ,tchain
where pr.dst = tchain.src
and pr.src <> tchain.dst
and pr.years+tchain.years <100
))
select src,dst,min(years) as years from pr
group by src,dst
order by src,dst;