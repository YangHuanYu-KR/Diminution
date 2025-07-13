#program step(t).

goal(place_centerpiece(C), t) :- subtask(place_centerpiece(C)), subtask(place_centerpiece(C), walk(O1_1), 1), goal(subtask(place_centerpiece(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(place_centerpiece(C), find(O2_1), 2), goal(subtask(place_centerpiece(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(place_centerpiece(C), putin(O3_1, O3_2), 3), goal(subtask(place_centerpiece(C), putin(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(place_centerpiece(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 1).
goal(subtask(place_centerpiece(C), find(O), 2), t) :- goal(C, find(O), t), subtask(place_centerpiece(C), find(O), 2).
goal(subtask(place_centerpiece(C), putin(O1, O2), 3), t) :- goal(C, putin(O1, O2), t), subtask(place_centerpiece(C), putin(O1, O2), 3).
