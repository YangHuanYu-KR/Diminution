#include <incmode>.

cell(X,Y) :- m(X), n(Y).
obstacle(X,Y) :- obstacle_box(X1,Y1,X2,Y2), X >= X1, X <= X2, Y >= Y1, Y <= Y2, cell(X,Y).

h(F, 0) :- init(F).

action_of(left(X,Y))   :- cell(X,Y), not obstacle(X,Y), cell(X,Y-1), not obstacle(X,Y-1).
action_of(right(X,Y))  :- cell(X,Y), not obstacle(X,Y), cell(X,Y+1), not obstacle(X,Y+1).
action_of(up(X,Y))     :- cell(X,Y), not obstacle(X,Y), cell(X-1,Y), not obstacle(X-1,Y).
action_of(down(X,Y))   :- cell(X,Y), not obstacle(X,Y), cell(X+1,Y), not obstacle(X+1,Y).
