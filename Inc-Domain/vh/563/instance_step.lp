#program step(t).

goal(check_appearance_in_mirror(C), T0, t, 1) :- subtask(check_appearance_in_mirror(C)), subtask(check_appearance_in_mirror(C), walk(O1_1), 1), goal(subtask(check_appearance_in_mirror(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(check_appearance_in_mirror(C), grab(O2_1), 2), goal(subtask(check_appearance_in_mirror(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(check_appearance_in_mirror(C), find(O3_1), 3), goal(subtask(check_appearance_in_mirror(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(check_appearance_in_mirror(C), T3, t, 2) :- subtask(check_appearance_in_mirror(C), open(O4_1), 4), goal(subtask(check_appearance_in_mirror(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(check_appearance_in_mirror(C), putin(O5_1, O5_2), 5), goal(subtask(check_appearance_in_mirror(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(check_appearance_in_mirror(C), close(O6_1), 6), goal(subtask(check_appearance_in_mirror(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(check_appearance_in_mirror(C), T0, t, 3) :- goal(check_appearance_in_mirror(C), T0, T2, 1), goal(check_appearance_in_mirror(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(check_appearance_in_mirror(C), T6, t, 4) :- subtask(check_appearance_in_mirror(C), walk(O7_1), 7), goal(subtask(check_appearance_in_mirror(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(check_appearance_in_mirror(C), walk(O8_1), 8), goal(subtask(check_appearance_in_mirror(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(check_appearance_in_mirror(C), switchon(O9_1), 9), goal(subtask(check_appearance_in_mirror(C), switchon(O9_1), 9), T8), T8 <= t, time(T8).
goal(check_appearance_in_mirror(C), T0, t, 5) :- goal(check_appearance_in_mirror(C), T0, T5, 3), goal(check_appearance_in_mirror(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(check_appearance_in_mirror(C), T9, t, 6) :- subtask(check_appearance_in_mirror(C), walk(O10_1), 10), goal(subtask(check_appearance_in_mirror(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(check_appearance_in_mirror(C), lookat(O11_1), 11), goal(subtask(check_appearance_in_mirror(C), lookat(O11_1), 11), T10), T10 <= t, time(T10).
goal(check_appearance_in_mirror(C), t) :- goal(check_appearance_in_mirror(C), T0, T8, 5), goal(check_appearance_in_mirror(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(check_appearance_in_mirror(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(check_appearance_in_mirror(C), walk(O), 1).
goal(subtask(check_appearance_in_mirror(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(check_appearance_in_mirror(C), grab(O), 2).
goal(subtask(check_appearance_in_mirror(C), find(O), 3), t) :- goal(C, find(O), t), subtask(check_appearance_in_mirror(C), find(O), 3).
goal(subtask(check_appearance_in_mirror(C), open(O), 4), t) :- goal(C, open(O), t), subtask(check_appearance_in_mirror(C), open(O), 4).
goal(subtask(check_appearance_in_mirror(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(check_appearance_in_mirror(C), putin(O1, O2), 5).
goal(subtask(check_appearance_in_mirror(C), close(O), 6), t) :- goal(C, close(O), t), subtask(check_appearance_in_mirror(C), close(O), 6).
goal(subtask(check_appearance_in_mirror(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(check_appearance_in_mirror(C), walk(O), 7).
goal(subtask(check_appearance_in_mirror(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(check_appearance_in_mirror(C), walk(O), 8).
goal(subtask(check_appearance_in_mirror(C), switchon(O), 9), t) :- goal(C, switchon(O), t), subtask(check_appearance_in_mirror(C), switchon(O), 9).
goal(subtask(check_appearance_in_mirror(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(check_appearance_in_mirror(C), walk(O), 10).
goal(subtask(check_appearance_in_mirror(C), lookat(O), 11), t) :- goal(C, lookat(O), t), subtask(check_appearance_in_mirror(C), lookat(O), 11).
