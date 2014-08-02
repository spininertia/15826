-- Find the total number of two hop away neighbors
select count(*)
from u_edges as e1, u_edges as e2
where e1.dst = e2.src;