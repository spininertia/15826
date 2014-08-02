-- Find the out degree distribution for the graph
select freq, count(*)
from (
  select count(*) as freq
  from edges
  group by src
  )
group by freq;
