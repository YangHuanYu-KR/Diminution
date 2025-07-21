#program step(t).

goal(print_out_papers(C), T0, t, 1) :- subtask(print_out_papers(C)), subtask(print_out_papers(C), find(O1_1), 1), goal(subtask(print_out_papers(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(print_out_papers(C), walk(O2_1), 2), goal(subtask(print_out_papers(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(print_out_papers(C), find(O3_1), 3), goal(subtask(print_out_papers(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(print_out_papers(C), T3, t, 2) :- subtask(print_out_papers(C), switchon(O4_1), 4), goal(subtask(print_out_papers(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(print_out_papers(C), find(O5_1), 5), goal(subtask(print_out_papers(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(print_out_papers(C), grab(O6_1), 6), goal(subtask(print_out_papers(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(print_out_papers(C), T0, t, 3) :- goal(print_out_papers(C), T0, T2, 1), goal(print_out_papers(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(print_out_papers(C), T6, t, 4) :- subtask(print_out_papers(C), putin(O7_1, O7_2), 7), goal(subtask(print_out_papers(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(print_out_papers(C), cut(O8_1), 8), goal(subtask(print_out_papers(C), cut(O8_1), 8), T7), T7 <= T8, time(T7), subtask(print_out_papers(C), grab(O9_1), 9), goal(subtask(print_out_papers(C), grab(O9_1), 9), T8), T8 <= t, time(T8).
goal(print_out_papers(C), t) :- goal(print_out_papers(C), T0, T5, 3), goal(print_out_papers(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(print_out_papers(C), find(O), 1), t) :- goal(C, find(O), t), subtask(print_out_papers(C), find(O), 1).
goal(subtask(print_out_papers(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(print_out_papers(C), walk(O), 2).
goal(subtask(print_out_papers(C), find(O), 3), t) :- goal(C, find(O), t), subtask(print_out_papers(C), find(O), 3).
goal(subtask(print_out_papers(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(print_out_papers(C), switchon(O), 4).
goal(subtask(print_out_papers(C), find(O), 5), t) :- goal(C, find(O), t), subtask(print_out_papers(C), find(O), 5).
goal(subtask(print_out_papers(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(print_out_papers(C), grab(O), 6).
goal(subtask(print_out_papers(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(print_out_papers(C), putin(O1, O2), 7).
goal(subtask(print_out_papers(C), cut(O), 8), t) :- goal(C, cut(O), t), subtask(print_out_papers(C), cut(O), 8).
goal(subtask(print_out_papers(C), grab(O), 9), t) :- goal(C, grab(O), t), subtask(print_out_papers(C), grab(O), 9).
