-- Find the average out degree for all nodes
-- select 1.0 * count(*) / (select count(distinct src) + (select count(distinct dst) from edges where dst not in (select src from edges)) from edges)
-- from edges;

select avg(degree) from
(
select count(*) as degree
from u_edges
group by src
);