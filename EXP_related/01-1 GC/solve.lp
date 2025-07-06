#const maxColor = 6.

vertex(1..8).
edge(1,2; 1,3; 2,3; 3,4; 4,5; 5,6; 4,6; 5,7 ; 7,8).

adj(U,V) :- edge(U,V).
adj(U,V) :- edge(V,U).

1 {color(V,C) : C = 1..maxColor} 1 :- vertex(V).
:- adj(U,V), color(U,C), color(V,C).

used(C) :- color(_,C).
#minimize { 1@1,C : used(C) }.
#minimize { C@2   : used(C) }.

#show color/2.