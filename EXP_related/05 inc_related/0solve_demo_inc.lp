% clingo 0instance_demo.lp 0solve_demo_inc.lp 0 --project

#include <incmode>. 

dist(N, 0):- start(N).
dist(N, 0):- goal(N).
dist(N, 0):- must(N).
related(N, 0) :- dist(N, _).

#program step(t).
dist(Y, t) :- dist(X, t-1), connect(X, Y).
related(Y, t) :- dist(Y, t).

{use(X, Y, t) : connect(X,Y), related(X,t), related(Y,t)}.

related(Y, t) :- related(Y, t-1).

in_deg(V, N, t) :- n(V), N = #count{U : use(U, V, t)},related(V, t).
out_deg(V, N, t) :- n(V), N = #count{U : use(V, U, t)}, related(V, t).

:- start(S), out_deg(S, N, t), N != 1.
:- start(S), in_deg(S, N, t), N != 0.
:- goal(G), out_deg(G, N, t), N != 0.
:- goal(G),  in_deg(G, N, t), N != 1.

mid(V, t) :- n(V), in_deg(V, N1, t), out_deg(V, N2, t), N1 = 1, N2 = 1, related(V, t).
iso(V, t) :- n(V), in_deg(V, N1, t), out_deg(V, N2, t), N1 = 0, N2 = 0, related(V, t).
illegel(V,t) :- not start(V), not goal(V), not mid(V, t), not iso(V, t), related(V, t).

reach(S, t) :- start(S).
reach(G, t) :- goal(G).
reach(Y, t) :- reach(X, t), use(X, Y, t), related(X, t), related(Y, t).
reach(Y, t) :- reach(X, t), use(Y, X, t),  related(X, t), related(Y, t).

#program check(t).
:- use(X, Y, t), not reach(X, t), query(t), related(X, t), related(Y, t).
:- use(X, Y, t), not reach(Y, t), query(t), related(X, t), related(Y, t).
:- must(V), not reach(V, t), query(t).
:- illegel(V, t), related(V, t), query(t), related(V, t).
:- query(t), not use(_, _, t).
final(X,Y,t) :- use(X,Y,t), query(t).


#show final/3.
#project final/3.