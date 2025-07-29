#include<incmode>.

dir( 1, 0). dir(-1, 0). dir( 0, 1). dir( 0,-1).

action_of (object(robot, R), action(move, (Dx , Dy))) :- init(object(robot, R), _), 
                                                         dir(Dx, Dy).
action_of (object(robot, R), action(pickup, ())) :- init(object(robot, R), _).
action_of (object(robot, R), action(putdown, ())) :- init(object(robot, R), _).
action_of (object(robot, R), action(deliver,(O, I, U))) :- init(object(robot, R), _), 
                                                           init(object(order, O), value(line, (I, Umax))),
                                                           U=1..Umax.
h(object(robot, R), V, 0):- init(object(robot, R), V).
h(object(shelf, S), V, 0):- init(object(shelf, S), V).
h(object(product, I), V, 0):- init(object(product, I), V).
h(object(order, O), value(line, P), 0):- init(object(order, O), value(line, P)).
