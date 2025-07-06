#const maxColor = 6.

vertex(1..8).
edge(1,2; 1,3; 2,3; 3,4; 4,5; 5,6; 4,6; 5,7; 7,8).

vertex(9..104).
edge(8,9).
edge(X, X+1) :- X=9..103.

vertex(20..1000).
edge(2,20).
edge(X, X+1) :- X=20..999.

edge(1,2) :- edge(2,1), vertex(1), vertex(2).
edge(2,1) :- edge(1,2), vertex(1), vertex(2).
