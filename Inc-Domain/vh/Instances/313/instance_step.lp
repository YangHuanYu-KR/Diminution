#program step(t).

goal(make_coffee(C), T0, t, 1) :- subtask(make_coffee(C)), subtask(make_coffee(C), walk(O1_1), 1), goal(subtask(make_coffee(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(make_coffee(C), grab(O2_1), 2), goal(subtask(make_coffee(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(make_coffee(C), walk(O3_1), 3), goal(subtask(make_coffee(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(make_coffee(C), T3, t, 2) :- subtask(make_coffee(C), putin(O4_1, O4_2), 4), goal(subtask(make_coffee(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(make_coffee(C), walk(O5_1), 5), goal(subtask(make_coffee(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(make_coffee(C), grab(O6_1), 6), goal(subtask(make_coffee(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(make_coffee(C), T0, t, 3) :- goal(make_coffee(C), T0, T2, 1), goal(make_coffee(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(make_coffee(C), T6, t, 4) :- subtask(make_coffee(C), putin(O7_1, O7_2), 7), goal(subtask(make_coffee(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(make_coffee(C), walk(O8_1), 8), goal(subtask(make_coffee(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(make_coffee(C), grab(O9_1), 9), goal(subtask(make_coffee(C), grab(O9_1), 9), T8), T8 <= t, time(T8).
goal(make_coffee(C), T0, t, 5) :- goal(make_coffee(C), T0, T5, 3), goal(make_coffee(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(make_coffee(C), T9, t, 6) :- subtask(make_coffee(C), pour(O10_1, O10_2), 10), goal(subtask(make_coffee(C), pour(O10_1, O10_2), 10), T9), T9 <= T10, time(T9), subtask(make_coffee(C), switchon(O11_1), 11), goal(subtask(make_coffee(C), switchon(O11_1), 11), T10), T10 <= t, time(T10).
goal(make_coffee(C), t) :- goal(make_coffee(C), T0, T8, 5), goal(make_coffee(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(make_coffee(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(make_coffee(C), walk(O), 1).
goal(subtask(make_coffee(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(make_coffee(C), grab(O), 2).
goal(subtask(make_coffee(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(make_coffee(C), walk(O), 3).
goal(subtask(make_coffee(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(make_coffee(C), putin(O1, O2), 4).
goal(subtask(make_coffee(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(make_coffee(C), walk(O), 5).
goal(subtask(make_coffee(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(make_coffee(C), grab(O), 6).
goal(subtask(make_coffee(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(make_coffee(C), putin(O1, O2), 7).
goal(subtask(make_coffee(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(make_coffee(C), walk(O), 8).
goal(subtask(make_coffee(C), grab(O), 9), t) :- goal(C, grab(O), t), subtask(make_coffee(C), grab(O), 9).
goal(subtask(make_coffee(C), pour(O1, O2), 10), t) :- goal(C, pour(O1, O2), t), subtask(make_coffee(C), pour(O1, O2), 10).
goal(subtask(make_coffee(C), switchon(O), 11), t) :- goal(C, switchon(O), t), subtask(make_coffee(C), switchon(O), 11).
