-- Find the maximum degree
select max(degree)
from (
  select count(*) as degree
  from u_edges
  group by src
);
