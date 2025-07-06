#include <incmode>. 

#const imax = 200.

#program base.
is(M, machine) :- is(M, input).
is(M, machine) :- is(M, output). 

action_of(M1, transport(P, M2)) :- is(M1,machine), is(M2,machine), M1 !=M2, is(P, product), related(M1), related(M2), related(P). 
action_of(M1, transport_out(P,M1)) :- is(M1,machine), is(M1,output), is(P, product), related(M1), related(P). 
action_of(M1, add_attribution(P, A)) :-  is(M1,machine), is(P, product), is(A, attribute), related(P), related(A). 
action_of(M1, idle) :- is(M1, machine), related(M1).

% related
related(P):- is(P, product).
related(M2) :- is(M1, machine), is(M2, machine), connected(M1, M2), related(M1).
related(M) :- is(M, machine), is(A, attribute), gives(M, A), related(A).
related(A) :- is(A, attribute), is(M, machine), gives(M, A), related(M). 
related(M) :- is(P, product), is(M, machine), enter_time(P, M, T), related(P), T>0. 


#program step(t). 
h(at(P, M), t) :- enter_time(P, M, t), is(P, product), is(M,machine), is(M,input),related(P), related(M). 
:- h(at(P1, M),t), h(at(P2, M),t), P1 != P2, related(P1), related(P2), related(M).

1{occurs(M, A, t): action_of(M, A)}1 :- is(M, machine), related(M).

h(at(P, M2),t):- occurs(M1, transport(P, M2),t), related(P), related(M1), related(M2).
h(moved(P,M1),t):- occurs(M1, transport(P, M2),t), related(P), related(M1), related(M2). 
:- occurs(M1, transport(P, M2),t), M1 = M2, related(P), related(M1), related(M2). 
:- occurs(M1, transport(P, M2),t), not h(at(P, M1),t-1), related(P), related(M1), related(M2).
:- occurs(M1, transport(P, M2),t), not connected(M1, M2), related(P), related(M1), related(M2). 
:- occurs(M1, transport(P, M2),t), h(out(P, M3), t-1), related(P), related(M1), related(M2), related(M3).

h(out(P, M1),t):- occurs(M1, transport_out(P, M1),t), related(P), related(M1).
h(moved(P, M1),t):- occurs(M1, transport_out(P, M1),t), related(P), related(M1). 
:- occurs(M1, transport_out(P, M1),t), not h(at(P,M1),t-1), related(P), related(M1). 
:- occurs(M1, transport_out(P, M1),t), not is(M1,output), related(P), related(M1). 
:- occurs(M1, transport_out(P, M1),t), h(out(P, M2), t-1), related(P), related(M1), related(M2).

h(has_attr(P, A),t):- occurs(M, add_attribution(P, A),t), related(P), related(M), related(A).
:- occurs(M, add_attribution(P, A),t), not h(at(P, M), t-1), related(P), related(M), related(A).
:- occurs(M, add_attribution(P, A),t), not gives(M, A), related(P), related(M), related(A). 
:- occurs(M, add_attribution(P, A),t), h(has_attr(P, A), t-1), related(P), related(M), related(A).
:- occurs(M1, add_attribution(P, A),t), h(out(P, M2), t-1), related(P), related(M1), related(M2), related(A). 

h(out(P, M),t) :- h(out(P, M),t-1), t>0, related(P), related(M). 
h(has_attr(P, A), t) :- h(has_attr(P, A), t-1), t>0, related(P), related(A).
h(at(P, M),t) :- h(at(P, M),t-1), not h(moved(P, M), t), related(P), related(M). 

#program check(t). 
:- query(t), not goal_met(t).