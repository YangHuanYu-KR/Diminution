#program step(t).

goal(work(C), T0, t, 1) :- subtask(work(C)), subtask(work(C), walk(O1_1), 1), goal(subtask(work(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(work(C), grab(O2_1), 2), goal(subtask(work(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(work(C), putin(O3_1, O3_2), 3), goal(subtask(work(C), putin(O3_1, O3_2), 3), T2), T2 <= t, time(T2).
goal(work(C), T3, t, 2) :- subtask(work(C), grab(O4_1), 4), goal(subtask(work(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(work(C), putin(O5_1, O5_2), 5), goal(subtask(work(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(work(C), grab(O6_1), 6), goal(subtask(work(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(work(C), T0, t, 3) :- goal(work(C), T0, T2, 1), goal(work(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(work(C), T6, t, 4) :- subtask(work(C), putin(O7_1, O7_2), 7), goal(subtask(work(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(work(C), sit(O8_1), 8), goal(subtask(work(C), sit(O8_1), 8), T7), T7 <= t, time(T7).
goal(work(C), t) :- goal(work(C), T0, T5, 3), goal(work(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(work(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(work(C), walk(O), 1).
goal(subtask(work(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(work(C), grab(O), 2).
goal(subtask(work(C), putin(O1, O2), 3), t) :- goal(C, putin(O1, O2), t), subtask(work(C), putin(O1, O2), 3).
goal(subtask(work(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(work(C), grab(O), 4).
goal(subtask(work(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(work(C), putin(O1, O2), 5).
goal(subtask(work(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(work(C), grab(O), 6).
goal(subtask(work(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(work(C), putin(O1, O2), 7).
goal(subtask(work(C), sit(O), 8), t) :- goal(C, sit(O), t), subtask(work(C), sit(O), 8).
