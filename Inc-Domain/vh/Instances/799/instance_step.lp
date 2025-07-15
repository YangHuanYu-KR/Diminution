#program step(t).

goal(read_on_sofa(C), T0, t, 1) :- subtask(read_on_sofa(C)), subtask(read_on_sofa(C), walk(O1_1), 1), goal(subtask(read_on_sofa(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(read_on_sofa(C), walk(O2_1), 2), goal(subtask(read_on_sofa(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(read_on_sofa(C), find(O3_1), 3), goal(subtask(read_on_sofa(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(read_on_sofa(C), T3, t, 2) :- subtask(read_on_sofa(C), open(O4_1), 4), goal(subtask(read_on_sofa(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(read_on_sofa(C), find(O5_1), 5), goal(subtask(read_on_sofa(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(read_on_sofa(C), open(O6_1), 6), goal(subtask(read_on_sofa(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(read_on_sofa(C), T0, t, 3) :- goal(read_on_sofa(C), T0, T2, 1), goal(read_on_sofa(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(read_on_sofa(C), T6, t, 4) :- subtask(read_on_sofa(C), putin(O7_1, O7_2), 7), goal(subtask(read_on_sofa(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(read_on_sofa(C), close(O8_1), 8), goal(subtask(read_on_sofa(C), close(O8_1), 8), T7), T7 <= t, time(T7).
goal(read_on_sofa(C), t) :- goal(read_on_sofa(C), T0, T5, 3), goal(read_on_sofa(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(read_on_sofa(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(read_on_sofa(C), walk(O), 1).
goal(subtask(read_on_sofa(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(read_on_sofa(C), walk(O), 2).
goal(subtask(read_on_sofa(C), find(O), 3), t) :- goal(C, find(O), t), subtask(read_on_sofa(C), find(O), 3).
goal(subtask(read_on_sofa(C), open(O), 4), t) :- goal(C, open(O), t), subtask(read_on_sofa(C), open(O), 4).
goal(subtask(read_on_sofa(C), find(O), 5), t) :- goal(C, find(O), t), subtask(read_on_sofa(C), find(O), 5).
goal(subtask(read_on_sofa(C), open(O), 6), t) :- goal(C, open(O), t), subtask(read_on_sofa(C), open(O), 6).
goal(subtask(read_on_sofa(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(read_on_sofa(C), putin(O1, O2), 7).
goal(subtask(read_on_sofa(C), close(O), 8), t) :- goal(C, close(O), t), subtask(read_on_sofa(C), close(O), 8).
