% choose an action
{occurs(C, A, T):action_of(C, A)}=1 :- is(C, character), time(T).
:- occurs(C, A1, T), occurs(C, A2, T), A1 != A2, is(C, character), time(T).

% actions
% find
h(found(C, O), T) :- occurs(C, find(O), T), related_id(O), is(C, character), time(T).
:- occurs(C, find(O), T), not h(close(C, O), T-1), related_id(O), is(C, character), time(T).
:- occurs(C, find(O), T), h(unreachable(O), T-1), related_id(O), is(C, character), time(T).

% walk
h(at(C, L), T) :- occurs(C, walk(O), T), related_id(O), h(at(O, L), T-1), related_loc(L), is(C, character), time(T).
:- occurs(C, walk(O), T), h(sitting(C), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, walk(O), T), h(lying(C), T-1), is(C, character), related_id(O), time(T).

% run
h(at(C, L), T) :- occurs(C, run(O), T), related_id(O), h(at(O, L), T-1), related_loc(L), is(C, character), time(T).
:- occurs(C, run(O), T), h(sitting(C), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, run(O), T), h(lying(C), T-1), is(C, character), related_id(O), time(T).

% walktowards
h(at(C, -1), T) :- occurs(C, walktowards(O), T), related_id(O), is(C, character), time(T).
:- occurs(C, walktowards(O), T), h(sitting(C), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, walktowards(O), T), h(lying(C), T-1), is(C, character), related_id(O), time(T).

% walkforward
h(at(C, -1), T) :- occurs(C, walkforward, T),  is(C, character), time(T).
h(facing(C, O), T) :- occurs(C, walkforward, T), h(facing(C, O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, walkforward, T), h(sitting(C), T-1), is(C, character), time(T).
:- occurs(C, walkforward, T), h(lying(C), T-1), is(C, character), time(T).

% sit
h(on(C, O), T) :- occurs(C, sit(O), T), is(C, character), related_id(O), time(T).
h(sitting(C), T) :- occurs(C, sit(O), T), is(C, character), related_id(O), time(T).
h(facing(C, O1), T) :- occurs(C, sit(O), T), h(facing(C, O1), T-1), is(C, character), related_id(O), related_id(O1), time(T).
:- occurs(C, sit(O), T), h(sitting(C), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, sit(O), T), h(lying(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, sit(O), T), is(C, character), related_id(O), time(T).

% standup
h(stand(C), T) :- occurs(C, standup, T), is(C, character), time(T).
h(facing(C, O1), T) :- occurs(C, standup, T), h(facing(C, O1), T-1), is(C, character), related_id(O1), time(T).
:- occurs(C, standup, T), not h(unstand(C), T-1), is(C, character), time(T).

% grab
h(holds_rh(C, O), T) :- occurs(C, grab(O), T), is(C, character), related_id(O), not h(unempty_rh(C), T-1), time(T).
h(holds_lh(C, O), T) :- occurs(C, grab(O), T), is(C, character), related_id(O), h(unempty_rh(C), T-1), not h(unempty_lh(C), T-1), time(T).
:- occurs(C, grab(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, grab(O), T), h(holds(C, O), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, grab(O), T), is(C, character), related_id(O), time(T).

% open
h(open(O), T) :- occurs(C, open(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, open(O), T), not h(closed(O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, open(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, open(O), T), is(C, character), related_id(O), time(T).

% close
h(closed(O), T) :- occurs(C, close(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, close(O), T), not h(open(O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, close(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, close(O), T), is(C, character), related_id(O), time(T).

% put, putback
h(on(O1, O2), T) :- occurs(C, put(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).
h(change(holds(C, O1)), T) :- occurs(C, put(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).
:- occurs(C, put(O1, O2), T), not h(holds(C, O1), T-1), is(C, character), related_id(O1), related_id(O2), time(T).
:- not occurs(C, find(O2), T-1), occurs(C, put(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).

h(on(O1, O2), T) :- occurs(C, putback(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).
h(change(holds(C, O1)), T) :- occurs(C, putback(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).
:- occurs(C, putback(O1, O2), T), not h(holds(C, O1), T-1), is(C, character), related_id(O1), related_id(O2), time(T).
:- not occurs(C, find(O2), T-1), occurs(C, putback(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).

% putin
h(inside(O1, O2), T) :- occurs(C, putin(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).
h(change(holds(C, O1)), T) :- occurs(C, putin(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).
:- occurs(C, putin(O1, O2), T), not h(holds(C, O1), T-1), is(C, character), related_id(O1), related_id(O2), time(T).
:- occurs(C, putin(O1, O2), T), h(closed(O2), T-1), is(C, character), related_id(O1), related_id(O2), time(T).
:- not occurs(C, find(O2), T-1), occurs(C, putin(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).

% switchon
h(on(O), T) :- occurs(C, switchon(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, switchon(O), T), not h(off(O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, switchon(O), T), h(plugged_out(O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, switchon(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, switchon(O), T), is(C, character), related_id(O), time(T).

% switchoff
h(off(O), T) :- occurs(C, switchoff(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, switchoff(O), T), not h(on(O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, switchoff(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, switchoff(O), T), is(C, character), related_id(O), time(T).

% drink (no effect)
:- occurs(C, drink(O), T), not h(holds(C, O), T-1), is(C, character), related_id(O), time(T).

% turnto
h(facing(C, O), T) :- occurs(C, turnto(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, turnto(O), T), h(at(C, L1), T-1), h(at(O, L2), T-1), not sameroom(L1, L2), is(C, character), related_id(O), related_loc(L1), related_loc(L2), time(T).
:- not occurs(C, find(O), T-1), occurs(C, turnto(O), T), is(C, character), related_id(O), time(T).

% lookat (no effect)
:- occurs(C, lookat(O), T), not h(facing(C, O), T-1), is(C, character), related_id(O), time(T).

% wipe
h(clean(O), T) :- occurs(C, wipe(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, wipe(O), T), not h(holds(C, O), T-1), is(C, character), related_id(O), time(T).

% puton
h(on(O, C), T) :- occurs(C, puton(O), T), is(C, character), related_id(O), time(T).
h(change(holds(C, O)), T) :- occurs(C, puton(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, puton(O), T), not h(holds(C, O), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, puton(O), T), is(C, character), related_id(O), time(T).

% putoff
h(holds_rh(C, O), T) :- occurs(C, putoff(O), T), is(C, character), related_id(O), not h(unempty_rh(C), T-1), time(T).
h(holds_lh(C, O), T) :- occurs(C, putoff(O), T), is(C, character), related_id(O), h(unempty_rh(C), T-1), not h(unempty_lh(C), T-1), time(T).
:- occurs(C, putoff(O), T), not h(on(O, C), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, putoff(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, putoff(O), T), is(C, character), related_id(O), time(T).

% greet (no effect)
:- occurs(C, greet(C1), T), not h(close(C, C1), T-1), is(C, character), is(C1, character), time(T).
:- not occurs(C, find(C1), T-1), occurs(C, greet(C1), T), is(C, character), is(C1, character), time(T).

% drop
h(change(holds(C, O)), T) :- occurs(C, drop(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, drop(O), T), not h(holds(C, O), T-1), is(C, character), related_id(O), time(T).

% read (no effect)
:- occurs(C, read(O), T), not h(holds(C, O), T-1), is(C, character), related_id(O), time(T).

% touch (no effect)
:- occurs(C, touch(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, touch(O), T), is(C, character), related_id(O), time(T).

% lie
h(lying(C), T) :- occurs(C, lie(O), T), is(C, character), related_id(O), time(T).
h(on(C, O), T) :- occurs(C, lie(O), T), is(C, character), related_id(O), time(T).
h(facing(C, O1), T) :- occurs(C, lie(O), T), h(facing(C, O1), T-1), is(C, character), related_id(O), related_id(O1), time(T).
:- occurs(C, lie(O), T), h(lying(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, lie(O), T), is(C, character), related_id(O), time(T).

% pour
h(inside(O1, O2), T) :- occurs(C, pour(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).
:- occurs(C, pour(O1, O2), T), not h(holds(C, O1), T-1), is(C, character), related_id(O1), related_id(O2), time(T).
:- not occurs(C, find(O2), T-1), occurs(C, pour(O1, O2), T), is(C, character), related_id(O1), related_id(O2), time(T).

% type (no effect)
:- occurs(C, type(O), T), h(unempty_lh(C), T-1), h(unempty_rh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, type(O), T), is(C, character), related_id(O), time(T).

% watch (no effect)
:- occurs(C, watch(O), T), h(at(C, L1), T-1), h(at(O, L2), T-1), not sameroom(L1, L2), is(C, character), related_id(O), related_loc(L1), related_loc(L2), time(T).
:- occurs(C, watch(O), T), not h(facing(C, O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, watch(O), T), not h(on(O), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, watch(O), T), is(C, character), related_id(O), time(T).

% push/pull/move (no effect)
:- occurs(C, push(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, push(O), T), is(C, character), related_id(O), time(T).

:- occurs(C, pull(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, pull(O), T), is(C, character), related_id(O), time(T).

:- occurs(C, move(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, move(O), T), is(C, character), related_id(O), time(T).

% wash
h(clean(O), T) :- occurs(C, wash(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, wash(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, wash(O), T), is(C, character), related_id(O), time(T).

% squeeze (no effect)
:- occurs(C, squeeze(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, squeeze(O), T), is(C, character), related_id(O), time(T).

% plugin
h(plugged_in(O), T) :- occurs(C, plugin(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, plugin(O), T), not h(plugged_out(O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, plugin(O), T), not h(close(C, O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, plugin(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, plugin(O), T), is(C, character), related_id(O), time(T).

% plugout
h(plugged_out(O), T) :- occurs(C, plugout(O), T), is(C, character), related_id(O), time(T).
:- occurs(C, plugout(O), T), not h(plugged_in(O), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, plugout(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- not occurs(C, find(O), T-1), occurs(C, plugged_out(O), T), is(C, character), related_id(O), time(T).

% cut (no effect)
:- occurs(C, cut(O), T), h(unempty_rh(C), T-1), h(unempty_lh(C), T-1), is(C, character), related_id(O), time(T).
:- occurs(C, cut(O), T), not h(holds(C, O1), T-1), has_property(O1, knife), is(C, character), related_id(O), related_id(O1), time(T).
:- not occurs(C, find(O), T-1), occurs(C, cut(O), T), is(C, character), related_id(O), time(T).

% eat (no effect)
:- not occurs(C, find(O), T-1), occurs(C, eat(O), T), is(C, character), related_id(O), time(T).

% sleep (no effect)
:- occurs(C, sleep, T), h(stand(C), T-1), is(C, character), time(T).

% wakeup (no effect)
:- occurs(C, wakeup, T), h(stand(C), T-1), is(C, character), time(T).

% static causal law
h(at(O, L), T) :- h(holds(C, O), T), h(at(C, L), T), is(C, character), related_id(O), related_loc(L), time(T).
h(close(O1, O2), T) :- h(at(O1, L1), T), h(at(O2, L2), T), O1 != O2, sameloc(L1, L2), related_id(O1), related_id(O2), related_loc(L1), related_loc(L2), time(T).
h(holds(C, O), T) :- h(holds_rh(C, O), T), is(C, character), related_id(O), time(T).
h(holds(C, O), T) :- h(holds_lh(C, O), T), is(C, character), related_id(O), time(T).
h(unempty_lh(C), T) :- h(holds_lh(C, O), T), is(C, character), related_id(O), time(T).
h(unempty_rh(C), T) :- h(holds_rh(C, O), T), is(C, character), related_id(O), time(T).
h(unreachable(O), T) :- h(inside(O, O2), T), h(closed(O2), T), related_id(O), related_id(O2), time(T).
h(grabbed(O), T) :- h(holds(C, O), T), is(C, character), related_id(O), time(T).
h(facesomething(C), T) :- h(facing(C, O), T), is(C, character), related_id(O), O != C, time(T).
h(facing(C, C), T) :- not h(facesomething(C), T), is(C, character), time(T).
h(unstand(C), T) :- h(sitting(C), T), is(C, character), time(T).
h(unstand(C), T) :- h(lying(C), T), is(C, character), time(T).

%face
h(at(O, L), T) :- is(O, face), h(at(C, L), T), is(C, character), related_id(O), related_loc(L), time(T).

%% Inertial
% at
h(change(at(O, L)), T) :- h(at(O, L), T-1), h(at(O, L1), T), L1 != L, related_id(O), related_loc(L), related_loc(L1), time(T).
h(at(O, L), T) :- h(at(O, L), T-1), not h(change(at(O, L)), T), related_id(O), related_loc(L), time(T).

% on (switch)
h(on(O), T) :- h(on(O), T-1), not h(off(O), T), related_id(O), time(T).

% off (switch)
h(off(O), T) :- h(off(O), T-1), not h(on(O), T), related_id(O), time(T).

% open
h(open(O), T) :- h(open(O), T-1), not h(closed(O), T), related_id(O), time(T).

% closed
h(closed(O), T) :- h(closed(O), T-1), not h(open(O), T), related_id(O), time(T).

% on
h(on(O1, O2), T) :- h(on(O1, O2), T-1), not h(grabbed(O1), T), related_id(O1), related_id(O2), time(T).

% inside
h(inside(O1, O2), T) :- h(inside(O1, O2), T-1), not h(grabbed(O1), T), related_id(O1), related_id(O2), time(T).

% close calculated by static causal law

% holds_rh, holds_lh / h(change(holds(C, O)), T) has been defined.
h(holds_rh(C, O), T) :- h(holds_rh(C, O), T-1), not h(change(holds(C, O)), T), is(C, character), related_id(O), time(T).
h(holds_lh(C, O), T) :- h(holds_lh(C, O), T-1), not h(change(holds(C, O)), T), is(C, character), related_id(O), time(T).

% sitting 
h(sitting(C), T) :- h(sitting(C), T-1), not h(stand(C), T), is(C, character), time(T).

% lying
h(lying(C), T) :- h(lying(C), T-1), not h(stand(C), T), is(C, character), time(T).

% stand
h(stand(C), T) :- h(stand(C), T-1), not h(unstand(C), T), is(C, character), time(T).

% dirty
h(dirty(C), T) :- h(dirty(C), T-1), not h(clean(C), T), is(C, character), time(T).

% clean
h(clean(C), T) :- h(clean(C), T-1), not h(dirty(C), T), is(C, character), time(T).

% plugged_in
h(plugged_in(O), T) :- h(plugged_in(O), T-1), not h(plugged_out(O), T), related_id(O), time(T).

% plugged_out
h(plugged_out(O), T) :- h(plugged_out(O), T-1), not h(plugged_in(O), T), related_id(O), time(T).

% for task
goal(C, A, T) :- occurs(C, A, T), action_of(C, A), is(C, character), time(T).