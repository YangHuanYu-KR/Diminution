#program step(t).

goal(put_down_bags(C), T0, t, 1) :- subtask(put_down_bags(C)), subtask(put_down_bags(C), find(O1_1), 1), goal(subtask(put_down_bags(C), find(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_down_bags(C), find(O2_1), 2), goal(subtask(put_down_bags(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_down_bags(C), find(O3_1), 3), goal(subtask(put_down_bags(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(put_down_bags(C), T3, t, 2) :- subtask(put_down_bags(C), find(O4_1), 4), goal(subtask(put_down_bags(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(put_down_bags(C), open(O5_1), 5), goal(subtask(put_down_bags(C), open(O5_1), 5), T4), T4 <= T5, time(T4), subtask(put_down_bags(C), find(O6_1), 6), goal(subtask(put_down_bags(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(put_down_bags(C), T0, t, 3) :- goal(put_down_bags(C), T0, T2, 1), goal(put_down_bags(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(put_down_bags(C), T6, t, 4) :- subtask(put_down_bags(C), open(O7_1), 7), goal(subtask(put_down_bags(C), open(O7_1), 7), T6), T6 <= T7, time(T6), subtask(put_down_bags(C), find(O8_1), 8), goal(subtask(put_down_bags(C), find(O8_1), 8), T7), T7 <= T8, time(T7), subtask(put_down_bags(C), cut(O9_1), 9), goal(subtask(put_down_bags(C), cut(O9_1), 9), T8), T8 <= t, time(T8).
goal(put_down_bags(C), t) :- goal(put_down_bags(C), T0, T5, 3), goal(put_down_bags(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(put_down_bags(C), find(O), 1), t) :- goal(C, find(O), t), subtask(put_down_bags(C), find(O), 1).
goal(subtask(put_down_bags(C), find(O), 2), t) :- goal(C, find(O), t), subtask(put_down_bags(C), find(O), 2).
goal(subtask(put_down_bags(C), find(O), 3), t) :- goal(C, find(O), t), subtask(put_down_bags(C), find(O), 3).
goal(subtask(put_down_bags(C), find(O), 4), t) :- goal(C, find(O), t), subtask(put_down_bags(C), find(O), 4).
goal(subtask(put_down_bags(C), open(O), 5), t) :- goal(C, open(O), t), subtask(put_down_bags(C), open(O), 5).
goal(subtask(put_down_bags(C), find(O), 6), t) :- goal(C, find(O), t), subtask(put_down_bags(C), find(O), 6).
goal(subtask(put_down_bags(C), open(O), 7), t) :- goal(C, open(O), t), subtask(put_down_bags(C), open(O), 7).
goal(subtask(put_down_bags(C), find(O), 8), t) :- goal(C, find(O), t), subtask(put_down_bags(C), find(O), 8).
goal(subtask(put_down_bags(C), cut(O), 9), t) :- goal(C, cut(O), t), subtask(put_down_bags(C), cut(O), 9).
