unrelated(V) :- vertex(V), 1 = #count { U : edge(V,U); U : edge(U,V) }.

unrelated(V) :- unrelated(U), edge(V,U), vertex(V), 2 = #count { X : edge(V,X); X : edge(X,V) }.
unrelated(V) :- unrelated(U), edge(U,V), vertex(V), 2 = #count { X : edge(V,X); X : edge(X,V) }.
related(V) :- vertex(V), not unrelated(V).



1 {color(V,C) : C = 1..maxColor} 1 :- related(V).
:- edge(U,V), color(U,C), color(V,C).

used(C) :- color(_,C).
#minimize { 1@1,C : used(C) }.
#minimize { C@2   : used(C) }.

#show color/2.
