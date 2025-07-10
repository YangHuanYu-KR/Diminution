#program step(t).
1{occur(A, t) : action_of(A)}1.

h(moved, t):- occur(A, t).

h(at(X,Y-1), t):- occur(left(X,Y), t),related_cell(X,Y).
:- occur(left(X,Y), t), not h(at(X,Y), t-1),related_cell(X,Y).

h(at(X,Y+1), t):- occur(right(X,Y), t),related_cell(X,Y).
:- occur(right(X,Y), t), not h(at(X,Y), t-1),related_cell(X,Y).

h(at(X-1,Y), t):- occur(up(X,Y), t),related_cell(X,Y).
:- occur(up(X,Y), t), not h(at(X,Y), t-1),related_cell(X,Y).

h(at(X+1,Y), t):- occur(down(X,Y), t),related_cell(X,Y).
:- occur(down(X,Y), t), not h(at(X,Y), t-1),related_cell(X,Y).

h(at(X,Y), t) :- h(at(X,Y), t-1), not h(moved, t), related_cell(X,Y).

goal_met(t):- h(at(X,Y), t), goal(at(X,Y)).


