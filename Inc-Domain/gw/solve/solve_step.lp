#program step(t).

1{occur(A, t) : action_of(A)}1.

h(moved, t):- occur(A, t).

h(at(X,Y-1), t):- occur(left(X,Y), t).
:- occur(left(X,Y), t), not h(at(X,Y), t-1).

h(at(X,Y+1), t):- occur(right(X,Y), t).
:- occur(right(X,Y), t), not h(at(X,Y), t-1).

h(at(X-1,Y), t):- occur(up(X,Y), t).
:- occur(up(X,Y), t), not h(at(X,Y), t-1).

h(at(X+1,Y), t):- occur(down(X,Y), t).
:- occur(down(X,Y), t), not h(at(X,Y), t-1).

h(at(X,Y), t) :- h(at(X,Y), t-1), not h(moved, t).

goal_met(t):- h(at(X,Y), t), goal(at(X,Y)).

