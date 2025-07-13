#program step(t).

goal(plug_in_nightlight(C), t) :- subtask(plug_in_nightlight(C)), subtask(plug_in_nightlight(C), walk(O1_1), 1), goal(subtask(plug_in_nightlight(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(plug_in_nightlight(C), putin(O2_1, O2_2), 2), goal(subtask(plug_in_nightlight(C), putin(O2_1, O2_2), 2), T1), T1 <= T2, time(T1), subtask(plug_in_nightlight(C), pour(O3_1, O3_2), 3), goal(subtask(plug_in_nightlight(C), pour(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(plug_in_nightlight(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(plug_in_nightlight(C), walk(O), 1).
goal(subtask(plug_in_nightlight(C), putin(O1, O2), 2), t) :- goal(C, putin(O1, O2), t), subtask(plug_in_nightlight(C), putin(O1, O2), 2).
goal(subtask(plug_in_nightlight(C), pour(O1, O2), 3), t) :- goal(C, pour(O1, O2), t), subtask(plug_in_nightlight(C), pour(O1, O2), 3).
