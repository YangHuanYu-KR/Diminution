#program step(t).

goal(print_out_papers(C), T0, t, 1) :- subtask(print_out_papers(C)), subtask(print_out_papers(C), walk(O1_1), 1), goal(subtask(print_out_papers(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(print_out_papers(C), grab(O2_1), 2), goal(subtask(print_out_papers(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(print_out_papers(C), walk(O3_1), 3), goal(subtask(print_out_papers(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(print_out_papers(C), T3, t, 2) :- subtask(print_out_papers(C), open(O4_1), 4), goal(subtask(print_out_papers(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(print_out_papers(C), putin(O5_1, O5_2), 5), goal(subtask(print_out_papers(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(print_out_papers(C), close(O6_1), 6), goal(subtask(print_out_papers(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(print_out_papers(C), T0, t, 3) :- goal(print_out_papers(C), T0, T2, 1), goal(print_out_papers(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(print_out_papers(C), T6, t, 4) :- subtask(print_out_papers(C), plugin(O7_1), 7), goal(subtask(print_out_papers(C), plugin(O7_1), 7), T6), T6 <= T7, time(T6), subtask(print_out_papers(C), switchon(O8_1), 8), goal(subtask(print_out_papers(C), switchon(O8_1), 8), T7), T7 <= t, time(T7).
goal(print_out_papers(C), t) :- goal(print_out_papers(C), T0, T5, 3), goal(print_out_papers(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(print_out_papers(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(print_out_papers(C), walk(O), 1).
goal(subtask(print_out_papers(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(print_out_papers(C), grab(O), 2).
goal(subtask(print_out_papers(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(print_out_papers(C), walk(O), 3).
goal(subtask(print_out_papers(C), open(O), 4), t) :- goal(C, open(O), t), subtask(print_out_papers(C), open(O), 4).
goal(subtask(print_out_papers(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(print_out_papers(C), putin(O1, O2), 5).
goal(subtask(print_out_papers(C), close(O), 6), t) :- goal(C, close(O), t), subtask(print_out_papers(C), close(O), 6).
goal(subtask(print_out_papers(C), plugin(O), 7), t) :- goal(C, plugin(O), t), subtask(print_out_papers(C), plugin(O), 7).
goal(subtask(print_out_papers(C), switchon(O), 8), t) :- goal(C, switchon(O), t), subtask(print_out_papers(C), switchon(O), 8).
