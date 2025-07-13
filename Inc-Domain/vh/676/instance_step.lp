#program step(t).

goal(put_on_coat(C), T0, t, 1) :- subtask(put_on_coat(C)), subtask(put_on_coat(C), walk(O1_1), 1), goal(subtask(put_on_coat(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_on_coat(C), walk(O2_1), 2), goal(subtask(put_on_coat(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_on_coat(C), open(O3_1), 3), goal(subtask(put_on_coat(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(put_on_coat(C), T3, t, 2) :- subtask(put_on_coat(C), close(O4_1), 4), goal(subtask(put_on_coat(C), close(O4_1), 4), T3), T3 <= T4, time(T3), subtask(put_on_coat(C), switchon(O5_1), 5), goal(subtask(put_on_coat(C), switchon(O5_1), 5), T4), T4 <= T5, time(T4), subtask(put_on_coat(C), switchoff(O6_1), 6), goal(subtask(put_on_coat(C), switchoff(O6_1), 6), T5), T5 <= t, time(T5).
goal(put_on_coat(C), t) :- goal(put_on_coat(C), T0, T2, 1), goal(put_on_coat(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(put_on_coat(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_on_coat(C), walk(O), 1).
goal(subtask(put_on_coat(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(put_on_coat(C), walk(O), 2).
goal(subtask(put_on_coat(C), open(O), 3), t) :- goal(C, open(O), t), subtask(put_on_coat(C), open(O), 3).
goal(subtask(put_on_coat(C), close(O), 4), t) :- goal(C, close(O), t), subtask(put_on_coat(C), close(O), 4).
goal(subtask(put_on_coat(C), switchon(O), 5), t) :- goal(C, switchon(O), t), subtask(put_on_coat(C), switchon(O), 5).
goal(subtask(put_on_coat(C), switchoff(O), 6), t) :- goal(C, switchoff(O), t), subtask(put_on_coat(C), switchoff(O), 6).
