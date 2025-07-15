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

sameloc(O, O) :- location(O), O != -1, related(O).
sameloc(O, L) :- relation(close, O, L), location(O), location(L), related(O), related(L).
sameloc(O, L) :- relation(on, O, L), location(O), location(L), related(O), related(L).
sameloc(O, L) :- relation(inside, O, L), location(O), location(L), not is_room(L), related(O), related(L).
sameloc(O, L) :- relation(holds_lh, O, L), location(O), location(L), related(O), related(L).
sameloc(O, L) :- relation(holds_rh, O, L), location(O), location(L), related(O), related(L).

sameloc(L1, L2) :- sameloc(L2, L1), location(L1), location(L2), related(L1), related(L2).
sameloc(L1, L2) :- sameloc(L1, O), sameloc(O, L2), location(L1), location(O), location(L2), related(L1), related(L2).

relation(close, O1, O2) :- sameloc(O1, O2), O1 != O2, id(O1), id(O2), related(O1), related(O2).

is_room(O) :- is(O, R), room_type(R).
inroom(L1, L2) :- relation(inside, O, L2), is_room(L2), sameloc(O, L1), location(L1), related(L1), related(L2).
sameroom(L1, L2) :- inroom(L1, R), inroom(L2, R), location(L1), location(L2), is_room(R), related(L1), related(L2).

has_property(O, knife) :- is(O, chefknife).
has_property(O, knife) :- is(O, knife).
has_property(O, knife) :- is(O, cutleryknife).

sameloc(O, C) :- is(O, face), related(O), is(C, character), related(C).

has_property(O, can_inside) :- has_property(O, containers), relation(inside, A, O), related(O).
has_property(O, can_inside) :- is_room(O), relation(inside, A, O), related(O).

% related
related(O1) :- relation(on, O1, O2), related(O2).
related(O2) :- relation(on, O1, O2), related(O1).
related(O2) :- relation(inside, O1, O2), related(O1).
related(O) :- h(holds(C, O), 0), related(C).
related(O) :- h(facing(C, O), 0), related(C).
related(O) :- has_property(O, knife), id(O).

related_id(O) :- related(O), id(O).
related_loc(L) :- related(L), location(L).
related_loc(-1).

% initial state
h(at(O, O), 0) :- id(O), related(O).

h(open(O), 0) :- state(O, open), related(O).
h(closed(O), 0) :- state(O, closed), related(O).
h(closed(O), 0) :- has_property(O, can_open), not h(open(O), 0), id(O), related(O).
h(on(O), 0) :- state(O, on), related(O).
h(off(O), 0) :- state(O, off), related(O).
h(off(O), 0) :- has_property(O, has_switch), not h(on(O), 0), id(O), related(O).
h(plugged_in(O), 0) :- state(O, plugged_in), related(O).
h(plugged_in(O), 0) :- state(O, on), related(O).
h(plugged_out(O), 0) :- state(O, plugged_out), related(O).
h(plugged_out(O), 0) :- has_property(O, has_plug), not h(plugged_in(O), 0), id(O), related(O).

h(dirty(O), 0) :- state(O, dirty), related(O).
h(clean(O), 0) :- state(O, clean), related(O).

h(sitting(C), 0) :- state(C, sitting), related(C).
h(lying(C), 0) :- state(C, lying), related(C).

h(on(O1, O2), 0) :- relation(on, O1, O2), related(O1), related(O2).
h(inside(O1, O2), 0) :- relation(inside, O1, O2), related(O1), related(O2).
h(close(O1, O2), 0) :- relation(close, O1, O2), related(O1), related(O2).
h(facing(C, O), 0) :- relation(facing, C, O), related(C), related(O).
h(holds_rh(C, O), 0) :- relation(holds_rh, C, O), related(C).
h(holds_lh(C, O), 0) :- relation(holds_lh, C, O), related(C).

h(holds(C, O), 0) :- h(holds_rh(C, O), 0), is(C, character), id(O), related(C).
h(holds(C, O), 0) :- h(holds_lh(C, O), 0), is(C, character), id(O), related(C).
h(unempty_lh(C), 0) :- h(holds_lh(C, O), 0), is(C, character), id(O), related(C).
h(unempty_rh(C), 0) :- h(holds_rh(C, O), 0), is(C, character), id(O), related(C).
h(unreachable(O), 0) :- h(inside(O, O2), 0), h(closed(O2), 0), id(O), id(O2), related(O).
h(grabbed(O), 0) :- h(holds(C, O), 0), is(C, character), id(O), related(O).
h(facesomething(C), 0) :- h(facing(C, O), 0), is(C, character), id(O), O != C, related(C).
h(facing(C, C), 0) :- not h(facesomething(C), 0), is(C, character), related(C).
h(unstand(C), 0) :- h(sitting(C), 0), is(C, character), related(C).
h(unstand(C), 0) :- h(lying(C), 0), is(C, character), related(C).
h(stand(C), 0) :- not h(unstand(C), 0), is(C, character), related(C).

% list of actions
action_of(C, find(O)) :- is(C, character), C != O, related_id(O), not is_room(O), related(C).
action_of(C, walk(O)) :- is(C, character), C != O, related_id(O), related(C).
action_of(C, run(O)) :- is(C, character), C != O, related_id(O), related(C).
action_of(C, walktowards(O)) :- is(C, character), C != O, related_id(O), related(C).
action_of(C, walkforward) :- is(C, character), related(C).
action_of(C, turnleft) :- is(C, character), related(C).
action_of(C, turnright) :- is(C, character), related(C).
action_of(C, sit(O)) :- is(C, character), C != O, related_id(O), has_property(O, sittable), related(C).
action_of(C, standup) :- is(C, character), related(C).
action_of(C, grab(O)) :- is(C, character), C != O, related_id(O), has_property(O, grabbable), not is(O, water), related(C).
action_of(C, open(O)) :- is(C, character), C != O, related_id(O), has_property(O, can_open),  related(C).
action_of(C, close(O)) :- is(C, character), C != O, related_id(O), has_property(O, can_open), related(C).
action_of(C, putback(O1, O2)) :- is(C, character), C != O1, C != O2, related_id(O1), related_id(O2), has_property(O1, grabbable), has_property(O2, surfaces), O1 != O2, related(C).
action_of(C, put(O1, O2)) :- is(C, character), C != O1, C != O2, related_id(O1), related_id(O2), has_property(O1, grabbable), has_property(O2, surfaces), O1 != O2, related(C).
action_of(C, putin(O1, O2)) :- is(C, character), C != O1, C != O2, related_id(O1), related_id(O2), has_property(O1, grabbable), has_property(O2, containers), O1 != O2, related(C).
action_of(C, switchon(O)) :- is(C, character), C != O, related_id(O), has_property(O, has_switch), related(C).
action_of(C, switchoff(O)) :- is(C, character), C != O, related_id(O), has_property(O, has_switch), related(C).

has_property(O, can_drink) :- has_property(O, drinkable), related_id(O).
has_property(O, can_drink) :- has_property(O, recipient), related_id(O).

action_of(C, drink(O)) :- is(C, character), C != O, related_id(O), has_property(O, can_drink), related(C).
action_of(C, turnto(O)) :- is(C, character), C != O, related_id(O), not is_room(O), related(C).
action_of(C, lookat(O)) :- is(C, character), C != O, related_id(O), not is_room(O), related(C).
action_of(C, wipe(O)) :- is(C, character), C != O, related_id(O), not is_room(O), related(C).
action_of(C, puton(O)) :- is(C, character), C != O, related_id(O), has_property(O, clothes), related(C).
action_of(C, putoff(O)) :- is(C, character), C != O, related_id(O), has_property(O, clothes), related(C).
action_of(C, greet(C1)) :- is(C, character), is(C1, character), C != C1, related(C), related(C1).
action_of(C, drop(O)) :- is(C, character), C != O, related_id(O), has_property(O, grabbable), related(C).
action_of(C, read(O)) :- is(C, character), C != O, related_id(O), has_property(O, readable), related(C).
action_of(C, touch(O)) :- is(C, character), C != O, related_id(O), not is_room(O), related(C).
action_of(C, lie(O)) :- is(C, character), C != O, related_id(O), has_property(O, lieable), related(C).

has_property(O, can_pour) :- has_property(O, pourable), related_id(O).
has_property(O, can_pour) :- has_property(O, drinkable), related_id(O).

action_of(C, pour(O1, O2)) :- is(C, character), C != O1, C != O2, related_id(O1), related_id(O2), has_property(O1, can_pour), has_property(O2, recipient), related(C).
action_of(C, type(O)) :- is(C, character), C != O, related_id(O), related(C), is(O, keyboard).

has_property(O, can_watch) :- is(O, television), related(O).
has_property(O, can_watch) :- is(O, computer), related(O).
has_property(O, can_watch) :- is(O, laptop), related(O).

action_of(C, watch(O)) :- is(C, character), C != O, related_id(O), has_property(O, can_watch), related(C).
action_of(C, push(O)) :- is(C, character), C != O, related_id(O), has_property(O, movable), related(C).
action_of(C, pull(O)) :- is(C, character), C != O, related_id(O), has_property(O, movable), related(C).
action_of(C, move(O)) :- is(C, character), C != O, related_id(O), has_property(O, movable), related(C).
action_of(C, wash(O)) :- is(C, character), C != O, related_id(O), not is_room(O), related(C).
action_of(C, squeeze(O)) :- is(C, character), C != O, related_id(O), has_property(O, clothes), related(C).
action_of(C, plugin(O)) :- is(C, character), C != O, related_id(O), has_property(O, has_plug), related(C).
action_of(C, plugout(O)) :- is(C, character), C != O, related_id(O), has_property(O, has_plug), related(C).
action_of(C, cut(O)) :- is(C, character), C != O, related_id(O), has_property(O, cuttable), has_property(O, eatable), related(C).
action_of(C, eat(O)) :- is(C, character), C != O, related_id(O), has_property(O, eatable), related(C).
action_of(C, sleep) :- is(C, character), related(C).
action_of(C, wakeup) :- is(C, character), related(C).

% related_action(find(O)) :- related_id(O), not is(O, character).
% related_action(walk(O)) :- related_id(O), not is(O, character).
% related_action(standup).
% related_action(open(O)) :- related_id(O), has_property(O, can_open), not is(O, character).
% related_action(close(O)) :- related_id(O), has_property(O, can_open), not is(O, character).
% related_action(switchon(O)) :- related_id(O), has_property(O, has_switch), not is(O, character).
% related_action(grab(O)) :- related_id(O), has_property(O, grabbable), not is(O, character).
% related_action(plugin(O)) :- related_id(O), has_property(O, has_plug), not is(O, character).
% related_action(turnto(O)) :- related_id(O), not is(O, character).
% related_action(putback(O1, O2)) :- related_id(O1), related_id(O2), has_property(O1, grabbable), has_property(O2, surfaces), O1 != O2.
% related_action(putin(O1, O2)) :- related_id(O1), related_id(O2), has_property(O1, grabbable), has_property(O2, containers), O1 != O2.
% related_action(puton(O)) :- related_id(O), has_property(O, clothes).
% related_action(putoff(O)) :- related_id(O), has_property(O, clothes).
% related_action(drop(O)) :- related_id(O), has_property(O, grabbable).