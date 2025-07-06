#const maxColor = 6.

adj(U,V) :- edge(U,V).
adj(U,V) :- edge(V,U).

unrelated(V) :- vertex(V), 1 = #count { U : adj(V,U) }.
pos_unrelated(V) :- unrelated(U), adj(V,U). 
unrelated(V) :- pos_unrelated(V), vertex(V), 2 = #count{ U : adj(V,U) }.
related(V) :- not unrelated(V),vertex(V).

1 {color(V,C) : C = 1..maxColor} 1 :- vertex(V),related(V).
:- adj(U,V), color(U,C), color(V,C).

used(C) :- color(_,C).
#minimize { 1@1,C : used(C) }.
#minimize { C@2   : used(C) }.