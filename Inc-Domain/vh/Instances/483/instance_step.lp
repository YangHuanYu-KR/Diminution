#program step(t).

goal(change_tv_channel(C), T0, t, 1) :- subtask(change_tv_channel(C)), subtask(change_tv_channel(C), walk(O1_1), 1), goal(subtask(change_tv_channel(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(change_tv_channel(C), grab(O2_1), 2), goal(subtask(change_tv_channel(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(change_tv_channel(C), open(O3_1), 3), goal(subtask(change_tv_channel(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(change_tv_channel(C), T3, t, 2) :- subtask(change_tv_channel(C), close(O4_1), 4), goal(subtask(change_tv_channel(C), close(O4_1), 4), T3), T3 <= T4, time(T3), subtask(change_tv_channel(C), putin(O5_1, O5_2), 5), goal(subtask(change_tv_channel(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(change_tv_channel(C), putback(O6_1, O6_2), 6), goal(subtask(change_tv_channel(C), putback(O6_1, O6_2), 6), T5), T5 <= t, time(T5).
goal(change_tv_channel(C), T0, t, 3) :- goal(change_tv_channel(C), T0, T2, 1), goal(change_tv_channel(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(change_tv_channel(C), T6, t, 4) :- subtask(change_tv_channel(C), pour(O7_1, O7_2), 7), goal(subtask(change_tv_channel(C), pour(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(change_tv_channel(C), switchon(O8_1), 8), goal(subtask(change_tv_channel(C), switchon(O8_1), 8), T7), T7 <= T8, time(T7), subtask(change_tv_channel(C), switchoff(O9_1), 9), goal(subtask(change_tv_channel(C), switchoff(O9_1), 9), T8), T8 <= t, time(T8).
goal(change_tv_channel(C), T0, t, 5) :- goal(change_tv_channel(C), T0, T5, 3), goal(change_tv_channel(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(change_tv_channel(C), T9, t, 6) :- subtask(change_tv_channel(C), plugin(O10_1), 10), goal(subtask(change_tv_channel(C), plugin(O10_1), 10), T9), T9 <= T10, time(T9), subtask(change_tv_channel(C), plugout(O11_1), 11), goal(subtask(change_tv_channel(C), plugout(O11_1), 11), T10), T10 <= T11, time(T10), subtask(change_tv_channel(C), wash(O12_1), 12), goal(subtask(change_tv_channel(C), wash(O12_1), 12), T11), T11 <= t, time(T11).
goal(change_tv_channel(C), T0, t, 7) :- goal(change_tv_channel(C), T0, T8, 5), goal(change_tv_channel(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(change_tv_channel(C), T12, t, 8) :- subtask(change_tv_channel(C), cut(O13_1), 13), goal(subtask(change_tv_channel(C), cut(O13_1), 13), T12), T12 <= T13, time(T12), subtask(change_tv_channel(C), eat(O14_1), 14), goal(subtask(change_tv_channel(C), eat(O14_1), 14), T13), T13 <= t, time(T13).
goal(change_tv_channel(C), t) :- goal(change_tv_channel(C), T0, T11, 7), goal(change_tv_channel(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(change_tv_channel(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(change_tv_channel(C), walk(O), 1).
goal(subtask(change_tv_channel(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(change_tv_channel(C), grab(O), 2).
goal(subtask(change_tv_channel(C), open(O), 3), t) :- goal(C, open(O), t), subtask(change_tv_channel(C), open(O), 3).
goal(subtask(change_tv_channel(C), close(O), 4), t) :- goal(C, close(O), t), subtask(change_tv_channel(C), close(O), 4).
goal(subtask(change_tv_channel(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(change_tv_channel(C), putin(O1, O2), 5).
goal(subtask(change_tv_channel(C), putback(O1, O2), 6), t) :- goal(C, putback(O1, O2), t), subtask(change_tv_channel(C), putback(O1, O2), 6).
goal(subtask(change_tv_channel(C), pour(O1, O2), 7), t) :- goal(C, pour(O1, O2), t), subtask(change_tv_channel(C), pour(O1, O2), 7).
goal(subtask(change_tv_channel(C), switchon(O), 8), t) :- goal(C, switchon(O), t), subtask(change_tv_channel(C), switchon(O), 8).
goal(subtask(change_tv_channel(C), switchoff(O), 9), t) :- goal(C, switchoff(O), t), subtask(change_tv_channel(C), switchoff(O), 9).
goal(subtask(change_tv_channel(C), plugin(O), 10), t) :- goal(C, plugin(O), t), subtask(change_tv_channel(C), plugin(O), 10).
goal(subtask(change_tv_channel(C), plugout(O), 11), t) :- goal(C, plugout(O), t), subtask(change_tv_channel(C), plugout(O), 11).
goal(subtask(change_tv_channel(C), wash(O), 12), t) :- goal(C, wash(O), t), subtask(change_tv_channel(C), wash(O), 12).
goal(subtask(change_tv_channel(C), cut(O), 13), t) :- goal(C, cut(O), t), subtask(change_tv_channel(C), cut(O), 13).
goal(subtask(change_tv_channel(C), eat(O), 14), t) :- goal(C, eat(O), t), subtask(change_tv_channel(C), eat(O), 14).
