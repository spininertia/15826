-- Include any queries here needed to calculate your answers for Q4-7b
-- n * d_avg^2
select N * d_avg * d_avg 
from ( 
select avg(degree) as d_avg
from (
select count(*) as degree
from u_edges
group by src
)), 
(select count(distinct src) as N from u_edges);

-- sigma(di^2)
select sum(degree * degree)
from (
	select count(*) as degree
	from u_edges
	group by src
);

select max(degree) * max(degree)
from (
  select count(*) as degree
  from u_edges
  group by src
);
