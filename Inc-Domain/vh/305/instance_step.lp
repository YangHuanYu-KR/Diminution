#program step(t).

goal(wash_teeth(C), T0, t, 1) :- subtask(wash_teeth(C)), subtask(wash_teeth(C), walk(O1_1), 1), goal(subtask(wash_teeth(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(wash_teeth(C), grab(O2_1), 2), goal(subtask(wash_teeth(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(wash_teeth(C), walk(O3_1), 3), goal(subtask(wash_teeth(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(wash_teeth(C), T3, t, 2) :- subtask(wash_teeth(C), grab(O4_1), 4), goal(subtask(wash_teeth(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(wash_teeth(C), walk(O5_1), 5), goal(subtask(wash_teeth(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(wash_teeth(C), putin(O6_1, O6_2), 6), goal(subtask(wash_teeth(C), putin(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(wash_teeth(C), T0, t, 3) :- goal(wash_teeth(C), T0, T2, 1), goal(wash_teeth(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(wash_teeth(C), T6, t, 4) :- subtask(wash_teeth(C), touch(O7_1), 7), goal(subtask(wash_teeth(C), touch(O7_1), 7), T6), T6 <= T7, time(T6), subtask(wash_teeth(C), wash(O8_1), 8), goal(subtask(wash_teeth(C), wash(O8_1), 8), T7), T7 <= T8, time(T7), subtask(wash_teeth(C), putback(O9_1, O9_2), 9), goal(subtask(wash_teeth(C), putback(O9_1, O9_2), 9), T8), T8 <= t, time(T8).
goal(wash_teeth(C), t) :- goal(wash_teeth(C), T0, T5, 3), goal(wash_teeth(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(wash_teeth(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(wash_teeth(C), walk(O), 1).
goal(subtask(wash_teeth(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(wash_teeth(C), grab(O), 2).
goal(subtask(wash_teeth(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(wash_teeth(C), walk(O), 3).
goal(subtask(wash_teeth(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(wash_teeth(C), grab(O), 4).
goal(subtask(wash_teeth(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(wash_teeth(C), walk(O), 5).
goal(subtask(wash_teeth(C), putin(O1, O2), 6), t) :- goal(C, putin(O1, O2), t), subtask(wash_teeth(C), putin(O1, O2), 6).
goal(subtask(wash_teeth(C), touch(O), 7), t) :- goal(C, touch(O), t), subtask(wash_teeth(C), touch(O), 7).
goal(subtask(wash_teeth(C), wash(O), 8), t) :- goal(C, wash(O), t), subtask(wash_teeth(C), wash(O), 8).
goal(subtask(wash_teeth(C), putback(O1, O2), 9), t) :- goal(C, putback(O1, O2), t), subtask(wash_teeth(C), putback(O1, O2), 9).
