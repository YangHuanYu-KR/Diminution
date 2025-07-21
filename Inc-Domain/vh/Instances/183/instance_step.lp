#program step(t).

goal(plug_in_nightlight(C), T0, t, 1) :- subtask(plug_in_nightlight(C)), subtask(plug_in_nightlight(C), walk(O1_1), 1), goal(subtask(plug_in_nightlight(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(plug_in_nightlight(C), find(O2_1), 2), goal(subtask(plug_in_nightlight(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(plug_in_nightlight(C), find(O3_1), 3), goal(subtask(plug_in_nightlight(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(plug_in_nightlight(C), T3, t, 2) :- subtask(plug_in_nightlight(C), plugin(O4_1), 4), goal(subtask(plug_in_nightlight(C), plugin(O4_1), 4), T3), T3 <= t, time(T3).
goal(plug_in_nightlight(C), t) :- goal(plug_in_nightlight(C), T0, T2, 1), goal(plug_in_nightlight(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(plug_in_nightlight(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(plug_in_nightlight(C), walk(O), 1).
goal(subtask(plug_in_nightlight(C), find(O), 2), t) :- goal(C, find(O), t), subtask(plug_in_nightlight(C), find(O), 2).
goal(subtask(plug_in_nightlight(C), find(O), 3), t) :- goal(C, find(O), t), subtask(plug_in_nightlight(C), find(O), 3).
goal(subtask(plug_in_nightlight(C), plugin(O), 4), t) :- goal(C, plugin(O), t), subtask(plug_in_nightlight(C), plugin(O), 4).
