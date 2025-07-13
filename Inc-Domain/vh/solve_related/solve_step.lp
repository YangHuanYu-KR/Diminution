#program step(t).

time(T) :- num(T), T==t.

% choose an action
1{occurs(C, A, t):action_of(C, A), related_action(A)}1 :- is(C, character).

% actions
% find
h(found(C, O), t) :- occurs(C, find(O), t), related_id(O), is(C, character).
:- occurs(C, find(O), t), not h(close(C, O), t-1), related_id(O), is(C, character).
:- occurs(C, find(O), t), h(unreachable(O), t-1), related_id(O), is(C, character).

% walk
h(at(C, L), t) :- occurs(C, walk(O), t), related_id(O), h(at(O, L), t-1), related_loc(L), is(C, character).
:- occurs(C, walk(O), t), h(sitting(C), t-1), is(C, character), related_id(O).
:- occurs(C, walk(O), t), h(lying(C), t-1), is(C, character), related_id(O).

% run
h(at(C, L), t) :- occurs(C, run(O), t), related_id(O), h(at(O, L), t-1), related_loc(L), is(C, character).
:- occurs(C, run(O), t), h(sitting(C), t-1), is(C, character), related_id(O).
:- occurs(C, run(O), t), h(lying(C), t-1), is(C, character), related_id(O).

% walktowards
h(at(C, -1), t) :- occurs(C, walktowards(O), t), related_id(O), is(C, character).
:- occurs(C, walktowards(O), t), h(sitting(C), t-1), is(C, character), related_id(O).
:- occurs(C, walktowards(O), t), h(lying(C), t-1), is(C, character), related_id(O).

% walkforward
h(at(C, -1), t) :- occurs(C, walkforward, t),  is(C, character).
h(facing(C, O), t) :- occurs(C, walkforward, t), h(facing(C, O), t-1), is(C, character), related_id(O).
:- occurs(C, walkforward, t), h(sitting(C), t-1), is(C, character).
:- occurs(C, walkforward, t), h(lying(C), t-1), is(C, character).

% sit
h(on(C, O), t) :- occurs(C, sit(O), t), is(C, character), related_id(O).
h(sitting(C), t) :- occurs(C, sit(O), t), is(C, character), related_id(O).
h(facing(C, O1), t) :- occurs(C, sit(O), t), h(facing(C, O1), t-1), is(C, character), related_id(O), related_id(O1).
:- occurs(C, sit(O), t), h(sitting(C), t-1), is(C, character), related_id(O).
:- occurs(C, sit(O), t), h(lying(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, sit(O), t), is(C, character), related_id(O).

% standup
h(stand(C), t) :- occurs(C, standup, t), is(C, character).
h(facing(C, O1), t) :- occurs(C, standup, t), h(facing(C, O1), t-1), is(C, character), related_id(O1).
:- occurs(C, standup, t), not h(unstand(C), t-1), is(C, character).

% grab
h(holds_rh(C, O), t) :- occurs(C, grab(O), t), is(C, character), related_id(O), not h(unempty_rh(C), t-1).
h(holds_lh(C, O), t) :- occurs(C, grab(O), t), is(C, character), related_id(O), h(unempty_rh(C), t-1), not h(unempty_lh(C), t-1).
:- occurs(C, grab(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- occurs(C, grab(O), t), h(holds(C, O), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, grab(O), t), is(C, character), related_id(O).

% open
h(open(O), t) :- occurs(C, open(O), t), is(C, character), related_id(O).
:- occurs(C, open(O), t), not h(closed(O), t-1), is(C, character), related_id(O).
:- occurs(C, open(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, open(O), t), is(C, character), related_id(O).

% close
h(closed(O), t) :- occurs(C, close(O), t), is(C, character), related_id(O).
:- occurs(C, close(O), t), not h(open(O), t-1), is(C, character), related_id(O).
:- occurs(C, close(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, close(O), t), is(C, character), related_id(O).

% put, putback
h(on(O1, O2), t) :- occurs(C, put(O1, O2), t), is(C, character), related_id(O1), related_id(O2).
h(change(holds(C, O1)), t) :- occurs(C, put(O1, O2), t), is(C, character), related_id(O1), related_id(O2).
:- occurs(C, put(O1, O2), t), not h(holds(C, O1), t-1), is(C, character), related_id(O1), related_id(O2).
:- not occurs(C, find(O2), t-1), occurs(C, put(O1, O2), t), is(C, character), related_id(O1), related_id(O2).

h(on(O1, O2), t) :- occurs(C, putback(O1, O2), t), is(C, character), related_id(O1), related_id(O2).
h(change(holds(C, O1)), t) :- occurs(C, putback(O1, O2), t), is(C, character), related_id(O1), related_id(O2).
:- occurs(C, putback(O1, O2), t), not h(holds(C, O1), t-1), is(C, character), related_id(O1), related_id(O2).
:- not occurs(C, find(O2), t-1), occurs(C, putback(O1, O2), t), is(C, character), related_id(O1), related_id(O2).

% putin
h(inside(O1, O2), t) :- occurs(C, putin(O1, O2), t), is(C, character), related_id(O1), related_id(O2).
h(change(holds(C, O1)), t) :- occurs(C, putin(O1, O2), t), is(C, character), related_id(O1), related_id(O2).
:- occurs(C, putin(O1, O2), t), not h(holds(C, O1), t-1), is(C, character), related_id(O1), related_id(O2).
:- occurs(C, putin(O1, O2), t), h(closed(O2), t-1), is(C, character), related_id(O1), related_id(O2).
:- not occurs(C, find(O2), t-1), occurs(C, putin(O1, O2), t), is(C, character), related_id(O1), related_id(O2).

% switchon
h(on(O), t) :- occurs(C, switchon(O), t), is(C, character), related_id(O).
:- occurs(C, switchon(O), t), not h(off(O), t-1), is(C, character), related_id(O).
:- occurs(C, switchon(O), t), h(plugged_out(O), t-1), is(C, character), related_id(O).
:- occurs(C, switchon(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, switchon(O), t), is(C, character), related_id(O).

% switchoff
h(off(O), t) :- occurs(C, switchoff(O), t), is(C, character), related_id(O).
:- occurs(C, switchoff(O), t), not h(on(O), t-1), is(C, character), related_id(O).
:- occurs(C, switchoff(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, switchoff(O), t), is(C, character), related_id(O).

% drink (no effect)
:- occurs(C, drink(O), t), not h(holds(C, O), t-1), is(C, character), related_id(O).

% turnto
h(facing(C, O), t) :- occurs(C, turnto(O), t), is(C, character), related_id(O).
:- occurs(C, turnto(O), t), h(at(C, L1), t-1), h(at(O, L2), t-1), not sameroom(L1, L2), is(C, character), related_id(O), related_loc(L1), related_loc(L2).
:- not occurs(C, find(O), t-1), occurs(C, turnto(O), t), is(C, character), related_id(O).

% lookat (no effect)
:- occurs(C, lookat(O), t), not h(facing(C, O), t-1), is(C, character), related_id(O).

% wipe
h(clean(O), t) :- occurs(C, wipe(O), t), is(C, character), related_id(O).
:- occurs(C, wipe(O), t), not h(holds(C, O), t-1), is(C, character), related_id(O).

% puton
h(on(O, C), t) :- occurs(C, puton(O), t), is(C, character), related_id(O).
h(change(holds(C, O)), t) :- occurs(C, puton(O), t), is(C, character), related_id(O).
:- occurs(C, puton(O), t), not h(holds(C, O), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, puton(O), t), is(C, character), related_id(O).

% putoff
h(holds_rh(C, O), t) :- occurs(C, putoff(O), t), is(C, character), related_id(O), not h(unempty_rh(C), t-1).
h(holds_lh(C, O), t) :- occurs(C, putoff(O), t), is(C, character), related_id(O), h(unempty_rh(C), t-1), not h(unempty_lh(C), t-1).
:- occurs(C, putoff(O), t), not h(on(O, C), t-1), is(C, character), related_id(O).
:- occurs(C, putoff(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, putoff(O), t), is(C, character), related_id(O).

% greet (no effect)
:- occurs(C, greet(C1), t), not h(close(C, C1), t-1), is(C, character), is(C1, character).
:- not occurs(C, find(C1), t-1), occurs(C, greet(C1), t), is(C, character), is(C1, character).

% drop
h(change(holds(C, O)), t) :- occurs(C, drop(O), t), is(C, character), related_id(O).
:- occurs(C, drop(O), t), not h(holds(C, O), t-1), is(C, character), related_id(O).

% read (no effect)
:- occurs(C, read(O), t), not h(holds(C, O), t-1), is(C, character), related_id(O).

% touch (no effect)
:- occurs(C, touch(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, touch(O), t), is(C, character), related_id(O).

% lie
h(lying(C), t) :- occurs(C, lie(O), t), is(C, character), related_id(O).
h(on(C, O), t) :- occurs(C, lie(O), t), is(C, character), related_id(O).
h(facing(C, O1), t) :- occurs(C, lie(O), t), h(facing(C, O1), t-1), is(C, character), related_id(O), related_id(O1).
:- occurs(C, lie(O), t), h(lying(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, lie(O), t), is(C, character), related_id(O).

% pour
h(inside(O1, O2), t) :- occurs(C, pour(O1, O2), t), is(C, character), related_id(O1), related_id(O2).
:- occurs(C, pour(O1, O2), t), not h(holds(C, O1), t-1), is(C, character), related_id(O1), related_id(O2).
:- not occurs(C, find(O2), t-1), occurs(C, pour(O1, O2), t), is(C, character), related_id(O1), related_id(O2).

% type (no effect)
:- occurs(C, type(O), t), h(unempty_lh(C), t-1), h(unempty_rh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, type(O), t), is(C, character), related_id(O).

% watch (no effect)
:- occurs(C, watch(O), t), h(at(C, L1), t-1), h(at(O, L2), t-1), not sameroom(L1, L2), is(C, character), related_id(O), related_loc(L1), related_loc(L2).
:- occurs(C, watch(O), t), not h(facing(C, O), t-1), is(C, character), related_id(O).
:- occurs(C, watch(O), t), not h(on(O), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, watch(O), t), is(C, character), related_id(O).

% push/pull/move (no effect)
:- occurs(C, push(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, push(O), t), is(C, character), related_id(O).

:- occurs(C, pull(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, pull(O), t), is(C, character), related_id(O).

:- occurs(C, move(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, move(O), t), is(C, character), related_id(O).

% wash
h(clean(O), t) :- occurs(C, wash(O), t), is(C, character), related_id(O).
:- occurs(C, wash(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, wash(O), t), is(C, character), related_id(O).

% squeeze (no effect)
:- occurs(C, squeeze(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, squeeze(O), t), is(C, character), related_id(O).

% plugin
h(plugged_in(O), t) :- occurs(C, plugin(O), t), is(C, character), related_id(O).
:- occurs(C, plugin(O), t), not h(plugged_out(O), t-1), is(C, character), related_id(O).
:- occurs(C, plugin(O), t), not h(close(C, O), t-1), is(C, character), related_id(O).
:- occurs(C, plugin(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, plugin(O), t), is(C, character), related_id(O).

% plugout
h(plugged_out(O), t) :- occurs(C, plugout(O), t), is(C, character), related_id(O).
:- occurs(C, plugout(O), t), not h(plugged_in(O), t-1), is(C, character), related_id(O).
:- occurs(C, plugout(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- not occurs(C, find(O), t-1), occurs(C, plugged_out(O), t), is(C, character), related_id(O).

% cut (no effect)
:- occurs(C, cut(O), t), h(unempty_rh(C), t-1), h(unempty_lh(C), t-1), is(C, character), related_id(O).
:- occurs(C, cut(O), t), not h(holds(C, O1), t-1), has_property(O1, knife), is(C, character), related_id(O), related_id(O1).
:- not occurs(C, find(O), t-1), occurs(C, cut(O), t), is(C, character), related_id(O).

% eat (no effect)
:- not occurs(C, find(O), t-1), occurs(C, eat(O), t), is(C, character), related_id(O).

% sleep (no effect)
:- occurs(C, sleep, t), h(stand(C), t-1), is(C, character).

% wakeup (no effect)
:- occurs(C, wakeup, t), h(stand(C), t-1), is(C, character).

% static causal law
h(at(O, L), t) :- h(holds(C, O), t), h(at(C, L), t), is(C, character), related_id(O), related_loc(L).
h(close(O1, O2), t) :- h(at(O1, L1), t), h(at(O2, L2), t), O1 != O2, sameloc(L1, L2), related_id(O1), related_id(O2), related_loc(L1), related_loc(L2).
h(holds(C, O), t) :- h(holds_rh(C, O), t), is(C, character), related_id(O).
h(holds(C, O), t) :- h(holds_lh(C, O), t), is(C, character), related_id(O).
h(unempty_lh(C), t) :- h(holds_lh(C, O), t), is(C, character), related_id(O).
h(unempty_rh(C), t) :- h(holds_rh(C, O), t), is(C, character), related_id(O).
h(unreachable(O), t) :- h(inside(O, O2), t), h(closed(O2), t), related_id(O), related_id(O2).
h(grabbed(O), t) :- h(holds(C, O), t), is(C, character), related_id(O).
h(facesomething(C), t) :- h(facing(C, O), t), is(C, character), related_id(O), O != C.
h(facing(C, C), t) :- not h(facesomething(C), t), is(C, character).
h(unstand(C), t) :- h(sitting(C), t), is(C, character).
h(unstand(C), t) :- h(lying(C), t), is(C, character).

%face
h(at(O, L), t) :- is(O, face), h(at(C, L), t), is(C, character), related_id(O), related_loc(L).

%% Inertial
% at
h(change(at(O, L)), t) :- h(at(O, L), t-1), h(at(O, L1), t), L1 != L, related_id(O), related_loc(L), related_loc(L1).
h(at(O, L), t) :- h(at(O, L), t-1), not h(change(at(O, L)), t), related_id(O), related_loc(L).

% on (switch)
h(on(O), t) :- h(on(O), t-1), not h(off(O), t), related_id(O).

% off (switch)
h(off(O), t) :- h(off(O), t-1), not h(on(O), t), related_id(O).

% open
h(open(O), t) :- h(open(O), t-1), not h(closed(O), t), related_id(O).

% closed
h(closed(O), t) :- h(closed(O), t-1), not h(open(O), t), related_id(O).

% on
h(on(O1, O2), t) :- h(on(O1, O2), t-1), not h(grabbed(O1), t), related_id(O1), related_id(O2).

% inside
h(inside(O1, O2), t) :- h(inside(O1, O2), t-1), not h(grabbed(O1), t), related_id(O1), related_id(O2).

% close calculated by static causal law

% holds_rh, holds_lh / h(change(holds(C, O)), t) has been defined.
h(holds_rh(C, O), t) :- h(holds_rh(C, O), t-1), not h(change(holds(C, O)), t), is(C, character), related_id(O).
h(holds_lh(C, O), t) :- h(holds_lh(C, O), t-1), not h(change(holds(C, O)), t), is(C, character), related_id(O).

% sitting 
h(sitting(C), t) :- h(sitting(C), t-1), not h(stand(C), t), is(C, character).

% lying
h(lying(C), t) :- h(lying(C), t-1), not h(stand(C), t), is(C, character).

% stand
h(stand(C), t) :- h(stand(C), t-1), not h(unstand(C), t), is(C, character).

% dirty
h(dirty(C), t) :- h(dirty(C), t-1), not h(clean(C), t), is(C, character).

% clean
h(clean(C), t) :- h(clean(C), t-1), not h(dirty(C), t), is(C, character).

% plugged_in
h(plugged_in(O), t) :- h(plugged_in(O), t-1), not h(plugged_out(O), t), related_id(O).

% plugged_out
h(plugged_out(O), t) :- h(plugged_out(O), t-1), not h(plugged_in(O), t), related_id(O).

% for task
goal(C, A, t) :- occurs(C, A, t), action_of(C, A), is(C, character).