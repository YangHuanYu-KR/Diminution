#program step(t).

goal(get_dressed(C), T0, t, 1) :- subtask(get_dressed(C)), subtask(get_dressed(C), walk(O1_1), 1), goal(subtask(get_dressed(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(get_dressed(C), grab(O2_1), 2), goal(subtask(get_dressed(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(get_dressed(C), find(O3_1), 3), goal(subtask(get_dressed(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(get_dressed(C), T3, t, 2) :- subtask(get_dressed(C), grab(O4_1), 4), goal(subtask(get_dressed(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(get_dressed(C), putback(O5_1, O5_2), 5), goal(subtask(get_dressed(C), putback(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(get_dressed(C), find(O6_1), 6), goal(subtask(get_dressed(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(get_dressed(C), T0, t, 3) :- goal(get_dressed(C), T0, T2, 1), goal(get_dressed(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(get_dressed(C), T6, t, 4) :- subtask(get_dressed(C), grab(O7_1), 7), goal(subtask(get_dressed(C), grab(O7_1), 7), T6), T6 <= t, time(T6).
goal(get_dressed(C), t) :- goal(get_dressed(C), T0, T5, 3), goal(get_dressed(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(get_dressed(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(get_dressed(C), walk(O), 1).
goal(subtask(get_dressed(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(get_dressed(C), grab(O), 2).
goal(subtask(get_dressed(C), find(O), 3), t) :- goal(C, find(O), t), subtask(get_dressed(C), find(O), 3).
goal(subtask(get_dressed(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(get_dressed(C), grab(O), 4).
goal(subtask(get_dressed(C), putback(O1, O2), 5), t) :- goal(C, putback(O1, O2), t), subtask(get_dressed(C), putback(O1, O2), 5).
goal(subtask(get_dressed(C), find(O), 6), t) :- goal(C, find(O), t), subtask(get_dressed(C), find(O), 6).
goal(subtask(get_dressed(C), grab(O), 7), t) :- goal(C, grab(O), t), subtask(get_dressed(C), grab(O), 7).
