#include <incmode>.

#const imax = 30.

num(0..imax).

time(0).

room_type(home_office).
room_type(kitchen).
room_type(living_room).
room_type(bathroom).
room_type(dining_room).
room_type(bedroom).
room_type(kids_bedroom).
room_type(entrance_hall).

id(O) :- is(O, R), room_type(R).
id(O) :- is(O, C), category(C).
id(O) :- is(O, character).
location(O) :- id(O).
location(-1).

sameloc(O, O) :- location(O), O != -1, id(O).
sameloc(O, L) :- relation(close, O, L), location(O), location(L), id(O), location(L).
sameloc(O, L) :- relation(on, O, L), location(O), location(L), id(O), location(L).
sameloc(O, L) :- relation(inside, O, L), location(O), location(L), not is_room(L), id(O), location(L).
sameloc(O, L) :- relation(holds_lh, O, L), location(O), location(L), id(O), location(L).
sameloc(O, L) :- relation(holds_rh, O, L), location(O), location(L), id(O), location(L).

sameloc(L1, L2) :- sameloc(L2, L1), location(L1), location(L2), location(L1), location(L2).
sameloc(L1, L2) :- sameloc(L1, O), sameloc(O, L2), location(L1), location(O), location(L2), location(L1), location(L2).

relation(close, O1, O2) :- sameloc(O1, O2), O1 != O2, id(O1), id(O2).

is_room(O) :- is(O, R), room_type(R).
inroom(L1, L2) :- relation(inside, O, L2), is_room(L2), sameloc(O, L1), location(L1), location(L1), location(L2).
sameroom(L1, L2) :- inroom(L1, R), inroom(L2, R), location(L1), location(L2), is_room(R), location(L1), location(L2).

has_property(O, knife) :- is(O, chefknife).
has_property(O, knife) :- is(O, knife).
has_property(O, knife) :- is(O, cutleryknife).

sameloc(O, C) :- is(O, face), id(O), is(C, character).

has_property(O, can_inside) :- has_property(O, containers), relation(inside, A, O), id(O).
has_property(O, can_inside) :- is_room(O), relation(inside, A, O), id(O).

%% initial state
h(at(O, O), 0) :- id(O), id(O).

h(open(O), 0) :- state(O, open), id(O).
h(closed(O), 0) :- state(O, closed), id(O).
h(closed(O), 0) :- has_property(O, can_open), not h(open(O), 0), id(O), id(O).
h(on(O), 0) :- state(O, on), id(O).
h(off(O), 0) :- state(O, off), id(O).
h(off(O), 0) :- has_property(O, has_switch), not h(on(O), 0), id(O), id(O).
h(plugged_in(O), 0) :- state(O, plugged_in), id(O).
h(plugged_in(O), 0) :- state(O, on), id(O).
h(plugged_out(O), 0) :- state(O, plugged_out), id(O).
h(plugged_out(O), 0) :- has_property(O, has_plug), not h(plugged_in(O), 0), id(O), id(O).

h(dirty(O), 0) :- state(O, dirty), id(O).
h(clean(O), 0) :- state(O, clean), id(O).

h(sitting(C), 0) :- state(C, sitting).
h(lying(C), 0) :- state(C, lying).

h(on(O1, O2), 0) :- relation(on, O1, O2), id(O1), id(O2).
h(inside(O1, O2), 0) :- relation(inside, O1, O2), id(O1), id(O2).
h(close(O1, O2), 0) :- relation(close, O1, O2), id(O1), id(O2).
h(facing(C, O), 0) :- relation(facing, C, O), id(O).
h(holds_rh(C, O), 0) :- relation(holds_rh, C, O).
h(holds_lh(C, O), 0) :- relation(holds_lh, C, O).

h(holds(C, O), 0) :- h(holds_rh(C, O), 0), is(C, character), id(O).
h(holds(C, O), 0) :- h(holds_lh(C, O), 0), is(C, character), id(O).
h(unempty_lh(C), 0) :- h(holds_lh(C, O), 0), is(C, character), id(O).
h(unempty_rh(C), 0) :- h(holds_rh(C, O), 0), is(C, character), id(O).
h(unreachable(O), 0) :- h(inside(O, O2), 0), h(closed(O2), 0), id(O), id(O2), id(O).
h(grabbed(O), 0) :- h(holds(C, O), 0), is(C, character), id(O), id(O).
h(facesomething(C), 0) :- h(facing(C, O), 0), is(C, character), id(O), O != C.
h(facing(C, C), 0) :- not h(facesomething(C), 0), is(C, character).
h(unstand(C), 0) :- h(sitting(C), 0), is(C, character).
h(unstand(C), 0) :- h(lying(C), 0), is(C, character).
h(stand(C), 0) :- not h(unstand(C), 0), is(C, character).

%% list of actions
action_of(C, find(O)) :- is(C, character), C != O, id(O), not is_room(O).
action_of(C, walk(O)) :- is(C, character), C != O, id(O).
action_of(C, run(O)) :- is(C, character), C != O, id(O).
action_of(C, walktowards(O)) :- is(C, character), C != O, id(O).
action_of(C, walkforward) :- is(C, character).
action_of(C, turnleft) :- is(C, character).
action_of(C, turnright) :- is(C, character).
action_of(C, sit(O)) :- is(C, character), C != O, id(O), has_property(O, sittable).
action_of(C, standup) :- is(C, character).
action_of(C, grab(O)) :- is(C, character), C != O, id(O), has_property(O, grabbable), not is(O, water).
action_of(C, open(O)) :- is(C, character), C != O, id(O), has_property(O, can_open).
action_of(C, close(O)) :- is(C, character), C != O, id(O), has_property(O, can_open).
action_of(C, putback(O1, O2)) :- is(C, character), C != O1, C != O2, id(O1), id(O2), has_property(O1, grabbable), has_property(O2, surfaces), O1 != O2.
action_of(C, put(O1, O2)) :- is(C, character), C != O1, C != O2, id(O1), id(O2), has_property(O1, grabbable), has_property(O2, surfaces), O1 != O2.
action_of(C, putin(O1, O2)) :- is(C, character), C != O1, C != O2, id(O1), id(O2), has_property(O1, grabbable), has_property(O2, containers), O1 != O2.
action_of(C, switchon(O)) :- is(C, character), C != O, id(O), has_property(O, has_switch).
action_of(C, switchoff(O)) :- is(C, character), C != O, id(O), has_property(O, has_switch).

has_property(O, can_drink) :- has_property(O, drinkable), id(O).
has_property(O, can_drink) :- has_property(O, recipient), id(O).

action_of(C, drink(O)) :- is(C, character), C != O, id(O), has_property(O, can_drink).
action_of(C, turnto(O)) :- is(C, character), C != O, id(O), not is_room(O).
action_of(C, lookat(O)) :- is(C, character), C != O, id(O), not is_room(O).
action_of(C, wipe(O)) :- is(C, character), C != O, id(O), not is_room(O).
action_of(C, puton(O)) :- is(C, character), C != O, id(O), has_property(O, clothes).
action_of(C, putoff(O)) :- is(C, character), C != O, id(O), has_property(O, clothes).
action_of(C, greet(C1)) :- is(C, character), is(C1, character), C != C1.
action_of(C, drop(O)) :- is(C, character), C != O, id(O), has_property(O, grabbable).
action_of(C, read(O)) :- is(C, character), C != O, id(O), has_property(O, readable).
action_of(C, touch(O)) :- is(C, character), C != O, id(O), not is_room(O).
action_of(C, lie(O)) :- is(C, character), C != O, id(O), has_property(O, lieable).

has_property(O, can_pour) :- has_property(O, pourable), id(O).
has_property(O, can_pour) :- has_property(O, drinkable), id(O).

action_of(C, pour(O1, O2)) :- is(C, character), C != O1, C != O2, id(O1), id(O2), has_property(O1, can_pour), has_property(O2, recipient).
action_of(C, type(O)) :- is(C, character), C != O, id(O), is(O, keyboard).

has_property(O, can_watch) :- is(O, television), id(O).
has_property(O, can_watch) :- is(O, computer), id(O).
has_property(O, can_watch) :- is(O, laptop), id(O).

action_of(C, watch(O)) :- is(C, character), C != O, id(O), has_property(O, can_watch).
action_of(C, push(O)) :- is(C, character), C != O, id(O), has_property(O, movable).
action_of(C, pull(O)) :- is(C, character), C != O, id(O), has_property(O, movable).
action_of(C, move(O)) :- is(C, character), C != O, id(O), has_property(O, movable).
action_of(C, wash(O)) :- is(C, character), C != O, id(O), not is_room(O).
action_of(C, squeeze(O)) :- is(C, character), C != O, id(O), has_property(O, clothes).
action_of(C, plugin(O)) :- is(C, character), C != O, id(O), has_property(O, has_plug).
action_of(C, plugout(O)) :- is(C, character), C != O, id(O), has_property(O, has_plug).
action_of(C, cut(O)) :- is(C, character), C != O, id(O), has_property(O, cuttable), has_property(O, eatable).
action_of(C, eat(O)) :- is(C, character), C != O, id(O), has_property(O, eatable).
action_of(C, sleep) :- is(C, character).
action_of(C, wakeup) :- is(C, character).

% action(find(O)) :- id(O), not is(O, character).
% action(walk(O)) :- id(O), not is(O, character).
% action(standup).
% action(open(O)) :- id(O), has_property(O, can_open), not is(O, character).
% action(close(O)) :- id(O), has_property(O, can_open), not is(O, character).
% action(switchon(O)) :- id(O), has_property(O, has_switch), not is(O, character).
% action(grab(O)) :- id(O), has_property(O, grabbable), not is(O, character).
% action(plugin(O)) :- id(O), has_property(O, has_plug), not is(O, character).
% action(turnto(O)) :- id(O), not is(O, character).
% action(putback(O1, O2)) :- id(O1), id(O2), has_property(O1, grabbable), has_property(O2, surfaces), O1 != O2.
% action(putin(O1, O2)) :- id(O1), id(O2), has_property(O1, grabbable), has_property(O2, containers), O1 != O2.
% action(puton(O)) :- id(O), has_property(O, clothes).
% action(putoff(O)) :- id(O), has_property(O, clothes).
% action(drop(O)) :- id(O), has_property(O, grabbable).