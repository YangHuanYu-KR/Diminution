#include <incmode>.

cell(X,Y) :- m(X), n(Y).
obstacle(X,Y) :- obstacle_box(X1, Y1, X2, Y2), X >= X1, X <= X2, Y >= Y1, Y <= Y2, cell(X,Y).

h(F, 0) :- init(F).

related_coord(X,Y) :- init(at(X,Y)).
related_coord(X,Y) :- goal(at(X,Y)).
related_coord(X1,Y1) :- obstacle_box(X1,Y1,_,_).
related_coord(X1,Y2) :- obstacle_box(X1,_,_,Y2).
related_coord(X2,Y1) :- obstacle_box(_,Y1,X2,_).
related_coord(X2,Y2) :- obstacle_box(_,_,X2,Y2).
related_x(X) :- related_coord(X,_).
related_y(Y) :- related_coord(_,Y).
min_x(MinX) :- MinX = #min {X : related_x(X)}.
max_x(MaxX) :- MaxX = #max {X : related_x(X)}.
min_y(MinY) :- MinY = #min {Y : related_y(Y)}.
max_y(MaxY) :- MaxY = #max {Y : related_y(Y)}.


related_cell(X,Y) :- related_x(X), cell(X,Y), min_x(MinX), max_x(MaxX),  X >= MinX, X <= MaxX.
related_cell(X,Y) :- related_y(Y), cell(X,Y), min_y(MinY), max_y(MaxY), Y >= MinY, Y <= MaxY.

h(F, 0) :- init(F).

action_of(left(X,Y))   :- related_cell(X,Y), not obstacle(X,Y), related_cell(X,Y-1), not obstacle(X,Y-1).
action_of(right(X,Y))  :- related_cell(X,Y), not obstacle(X,Y), related_cell(X,Y+1), not obstacle(X,Y+1).
action_of(up(X,Y))     :- related_cell(X,Y), not obstacle(X,Y), related_cell(X-1,Y), not obstacle(X-1,Y).
action_of(down(X,Y))   :- related_cell(X,Y), not obstacle(X,Y), related_cell(X+1,Y), not obstacle(X+1,Y).

