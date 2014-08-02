-- Calculate the number of nodes
select count(distinct src) + (select count(distinct dst) from edges where dst not in (select src from edges))
from edges;
