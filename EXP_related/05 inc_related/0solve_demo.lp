{use(X,Y) : connect(X,Y)}.

in_deg(V,N) :- n(V), N = #count{U : use(U,V)}.
out_deg(V,N) :- n(V), N = #count{U : use(V,U)}.

:- start(S), out_deg(S,N), N != 1.
:- start(S), in_deg(S,N), N != 0.
:- goal(G), out_deg(G,N), N != 0.
:- goal(G),  in_deg(G,N), N != 1.

mid(V) :- n(V), in_deg(V, N1), out_deg(V, N2), N1 = 1, N2 = 1.
iso(V) :- n(V), in_deg(V, N1), out_deg(V, N2), N1 = 0, N2 = 0.
:- n(V), not start(V), not goal(V), not mid(V), not iso(V).

reach(S) :- start(S).
reach(Y) :- reach(X), use(X,Y).
reach(Y) :- reach(X), use(Y,X).
:- use(X, _), not reach(X).
:- use(_, Y), not reach(Y).


:- must(V), not reach(V).

#show use/2.



% #show in_deg/2.
% #show out_deg/2.
% #show reach/1.