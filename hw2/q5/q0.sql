-- Create the table and import the data
create table edges(src int, dst int);
.separator ","
.import ./patents.csv edges
create index e_inedx on edges(src);

create table u_edges(src int, dst int);
.separator ","
.import ./undirected_patents.csv u_edges
create index u_index on u_edges(src);