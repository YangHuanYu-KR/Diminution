#const maxColor = 6.

% 原始节点与边
vertex(1..8).
edge(1,2; 1,3; 2,3; 3,4; 4,5; 5,6; 4,6; 5,7; 7,8).

% 延长 5-7-8 到长度为100的链
vertex(9..104).
edge(8,9).
edge(X, X+1) :- X=9..103.

% 从2延长出一条链到长度 51（共52个节点）
vertex(20..1000).
edge(2,20).
edge(X, X+1) :- X=20..999.

edge(1,2) :- edge(2,1), vertex(1), vertex(2).
edge(2,1) :- edge(1,2), vertex(1), vertex(2).
