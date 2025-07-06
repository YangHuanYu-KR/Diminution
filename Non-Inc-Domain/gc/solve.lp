1 {color(V,C) : C = 1..maxColor} 1 :- vertex(V).
:- edge(U,V), color(U,C), color(V,C).

used(C) :- color(_,C).
:- used(C2), C1 < C2, not used(C1).

#show color/2.