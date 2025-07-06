#include <incmode>.

#program base.
#const imax = 100.

cell(X,Y) :- m(W), n(H), X=1..W, Y=1..H.
obstacle(X,Y) :- obstacle_box(X1,Y1,X2,Y2), X >= X1, X <= X2, Y >= Y1, Y <= Y2, cell(X,Y).

h(F, 0) :- init(F).

action_of(left(X,Y))   :- cell(X,Y), not obstacle(X,Y), cell(X,Y-1), not obstacle(X,Y-1).
action_of(right(X,Y))  :- cell(X,Y), not obstacle(X,Y), cell(X,Y+1), not obstacle(X,Y+1).
action_of(up(X,Y))     :- cell(X,Y), not obstacle(X,Y), cell(X-1,Y), not obstacle(X-1,Y).
action_of(down(X,Y))   :- cell(X,Y), not obstacle(X,Y), cell(X+1,Y), not obstacle(X+1,Y).

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

#program check(t).
:- query(t), not goal_met(t).
