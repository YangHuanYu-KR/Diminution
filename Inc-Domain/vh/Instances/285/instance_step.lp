#program step(t).

goal(place_centerpiece(C), T0, t, 1) :- subtask(place_centerpiece(C)), subtask(place_centerpiece(C), walk(O1_1), 1), goal(subtask(place_centerpiece(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(place_centerpiece(C), grab(O2_1), 2), goal(subtask(place_centerpiece(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(place_centerpiece(C), walk(O3_1), 3), goal(subtask(place_centerpiece(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(place_centerpiece(C), T3, t, 2) :- subtask(place_centerpiece(C), putback(O4_1, O4_2), 4), goal(subtask(place_centerpiece(C), putback(O4_1, O4_2), 4), T3), T3 <= t, time(T3).
goal(place_centerpiece(C), t) :- goal(place_centerpiece(C), T0, T2, 1), goal(place_centerpiece(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(place_centerpiece(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 1).
goal(subtask(place_centerpiece(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(place_centerpiece(C), grab(O), 2).
goal(subtask(place_centerpiece(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(place_centerpiece(C), walk(O), 3).
goal(subtask(place_centerpiece(C), putback(O1, O2), 4), t) :- goal(C, putback(O1, O2), t), subtask(place_centerpiece(C), putback(O1, O2), 4).
