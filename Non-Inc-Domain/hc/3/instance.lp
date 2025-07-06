#const n=10.
node(1..n-1).
edge(0,1). 
edge(V1, V2) :- node(V1), node(V2).
