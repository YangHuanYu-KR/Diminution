n(1..10001).

%── 无向边 ──
connect(X,Y) :- connect(Y,X).
connect(1,2).  connect(2,3). connect(3,4). connect(4,5). connect(5,6).  connect(6,7).

connect(1,8).
connect(X,X+1) :- X = 8..10000.
connect(10001,7).

%── 路径端点与必经点 ──
start(1).
goal(7).
must(2).