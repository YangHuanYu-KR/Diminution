#program step(t).

goal(computer_work(C), T0, t, 1) :- subtask(computer_work(C)), subtask(computer_work(C), walk(O1_1), 1), goal(subtask(computer_work(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(computer_work(C), walk(O2_1), 2), goal(subtask(computer_work(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(computer_work(C), find(O3_1), 3), goal(subtask(computer_work(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(computer_work(C), T3, t, 2) :- subtask(computer_work(C), open(O4_1), 4), goal(subtask(computer_work(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(computer_work(C), find(O5_1), 5), goal(subtask(computer_work(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(computer_work(C), open(O6_1), 6), goal(subtask(computer_work(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(computer_work(C), T0, t, 3) :- goal(computer_work(C), T0, T2, 1), goal(computer_work(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(computer_work(C), T6, t, 4) :- subtask(computer_work(C), putin(O7_1, O7_2), 7), goal(subtask(computer_work(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(computer_work(C), close(O8_1), 8), goal(subtask(computer_work(C), close(O8_1), 8), T7), T7 <= t, time(T7).
goal(computer_work(C), t) :- goal(computer_work(C), T0, T5, 3), goal(computer_work(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(computer_work(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(computer_work(C), walk(O), 1).
goal(subtask(computer_work(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(computer_work(C), walk(O), 2).
goal(subtask(computer_work(C), find(O), 3), t) :- goal(C, find(O), t), subtask(computer_work(C), find(O), 3).
goal(subtask(computer_work(C), open(O), 4), t) :- goal(C, open(O), t), subtask(computer_work(C), open(O), 4).
goal(subtask(computer_work(C), find(O), 5), t) :- goal(C, find(O), t), subtask(computer_work(C), find(O), 5).
goal(subtask(computer_work(C), open(O), 6), t) :- goal(C, open(O), t), subtask(computer_work(C), open(O), 6).
goal(subtask(computer_work(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(computer_work(C), putin(O1, O2), 7).
goal(subtask(computer_work(C), close(O), 8), t) :- goal(C, close(O), t), subtask(computer_work(C), close(O), 8).
