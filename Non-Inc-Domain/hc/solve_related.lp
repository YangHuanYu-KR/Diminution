start(0).

related(V1,V2):-edge(V1,V2), V2 =(V1 + 1)\ N, n(N).
hc(V1,V2):-edge(V1,V2),not otherroute(V1, V2), related(V1, V2).

otherroute(V1,V2):-edge(V1,V2),edge(V1, V3),hc(V1, V3), V2 != V3.
otherroute(V1,V2):-edge(V1,V2),edge(V3, V2), hc(V3 ,V2), V1 != V3.
reached(V2):-edge(V1,V2),hc(V1,V2),reached(V1),not start(V1).
reached(V2):-edge(V1,V2),hc(V1,V2),start(V1).

:- node(V),not reached(V).