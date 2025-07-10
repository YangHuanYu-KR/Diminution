{occur(A, T)} :- action_of(A), time(T).
:- time(T), #count{ A : occur(A,T) } != 1.

h(moved, T):- occur(A, T), time(T).

h(at(X,Y-1), T):- occur(left(X,Y), T), time(T), related_cell(X,Y).
:- occur(left(X,Y), T), not h(at(X,Y), T-1), time(T), related_cell(X,Y).

h(at(X,Y+1), T):- occur(right(X,Y), T), time(T), related_cell(X,Y).
:- occur(right(X,Y), T), not h(at(X,Y), T-1), time(T), related_cell(X,Y).

h(at(X-1,Y), T):- occur(up(X,Y), T), time(T), related_cell(X,Y).
:- occur(up(X,Y), T), not h(at(X,Y), T-1), time(T), related_cell(X,Y).

h(at(X+1,Y), T):- occur(down(X,Y), T), time(T), related_cell(X,Y).
:- occur(down(X,Y), T), not h(at(X,Y), T-1), time(T), related_cell(X,Y).

h(at(X,Y), T) :- h(at(X,Y), T-1), not h(moved, T), time(T), related_cell(X,Y).

goal_met(T):- h(at(X,Y), T), goal(at(X,Y)), time(T).

