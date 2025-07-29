#include<incmode>.

dir( 1, 0). dir(-1, 0). dir( 0, 1). dir( 0,-1).

action_of (object(robot, R), action(move, (Dx , Dy))) :- init(object(robot, R), _), 
                                                         dir(Dx, Dy).
action_of (object(robot, R), action(pickup, ())) :- init(object(robot, R), _).
action_of (object(robot, R), action(putdown, ())) :- init(object(robot, R), _).
action_of (object(robot, R), action(deliver,(O, I, U))) :- init(object(robot, R), _), 
                                                           init(object(order, O), value(line, (I, Umax))),
                                                           related(object(product, I)),
                                                           U=1..Umax.
h(object(robot, R), V, 0):- init(object(robot, R), V).
h(object(shelf, S), V, 0):- init(object(shelf, S), V).
h(object(product, I), V, 0):- init(object(product, I), V).
h(object(order, O), value(line, P), 0):- init(object(order, O), value(line, P)).

related(object(robot, Robot)) :- init(object(robot ,Robot), _). 
related(object(pickingStation, PickingStation)):- init(object(order, _),value(pickingStation,(PickingStation))).
related(object(product, Product)):- init(object(order, _),value(line,(Product, _))).
related(object(shelf, Shelf)) :- init(object(product,Product), value(at,(Shelf, _))).
related_pos(pos(X, Y)) :- related(object(Type, O)), init(object(Type, O) ,value(at, (X, Y))).

related_x(X) :- related_pos(pos(X, _)).
related_y(Y) :- related_pos(pos(_, Y)).
min_x(MinX) :- MinX = #min {X : related_x(X)}.
max_x(MaxX) :- MaxX = #max {X : related_x(X)}.
min_y(MinY) :- MinY = #min {Y : related_y(Y)}.
max_y(MaxY) :- MaxY = #max {Y : related_y(Y)}.

related(pos,(X,Y)) :- init(object(node, _), value(at , (X ,Y))), related_x(X), min_x(MinX), max_x(MaxX), X >= MinX, X <= MaxX.
related(pos,(X,Y)) :- init(object(node, _), value(at , (X ,Y))), related_y(Y), min_y(MinY), max_y(MaxY), Y >= MinY, Y <= MaxY.

