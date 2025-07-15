#program step(t).

goal(put_alarm_clock_in_bedroom(C), T0, t, 1) :- subtask(put_alarm_clock_in_bedroom(C)), subtask(put_alarm_clock_in_bedroom(C), walk(O1_1), 1), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_alarm_clock_in_bedroom(C), grab(O2_1), 2), goal(subtask(put_alarm_clock_in_bedroom(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_alarm_clock_in_bedroom(C), find(O3_1), 3), goal(subtask(put_alarm_clock_in_bedroom(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(put_alarm_clock_in_bedroom(C), T3, t, 2) :- subtask(put_alarm_clock_in_bedroom(C), open(O4_1), 4), goal(subtask(put_alarm_clock_in_bedroom(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(put_alarm_clock_in_bedroom(C), close(O5_1), 5), goal(subtask(put_alarm_clock_in_bedroom(C), close(O5_1), 5), T4), T4 <= T5, time(T4), subtask(put_alarm_clock_in_bedroom(C), walk(O6_1), 6), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(put_alarm_clock_in_bedroom(C), T0, t, 3) :- goal(put_alarm_clock_in_bedroom(C), T0, T2, 1), goal(put_alarm_clock_in_bedroom(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(put_alarm_clock_in_bedroom(C), T6, t, 4) :- subtask(put_alarm_clock_in_bedroom(C), walk(O7_1), 7), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(put_alarm_clock_in_bedroom(C), walk(O8_1), 8), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O8_1), 8), T7), T7 <= T8, time(T7), subtask(put_alarm_clock_in_bedroom(C), walk(O9_1), 9), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(put_alarm_clock_in_bedroom(C), T0, t, 5) :- goal(put_alarm_clock_in_bedroom(C), T0, T5, 3), goal(put_alarm_clock_in_bedroom(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(put_alarm_clock_in_bedroom(C), T9, t, 6) :- subtask(put_alarm_clock_in_bedroom(C), walk(O10_1), 10), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O10_1), 10), T9), T9 <= T10, time(T9), subtask(put_alarm_clock_in_bedroom(C), walk(O11_1), 11), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O11_1), 11), T10), T10 <= t, time(T10).
goal(put_alarm_clock_in_bedroom(C), t) :- goal(put_alarm_clock_in_bedroom(C), T0, T8, 5), goal(put_alarm_clock_in_bedroom(C), T9, t, 6), time(T0), time(T8), time(T9), T8 <= T9.

goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 1).
goal(subtask(put_alarm_clock_in_bedroom(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_alarm_clock_in_bedroom(C), grab(O), 2).
goal(subtask(put_alarm_clock_in_bedroom(C), find(O), 3), t) :- goal(C, find(O), t), subtask(put_alarm_clock_in_bedroom(C), find(O), 3).
goal(subtask(put_alarm_clock_in_bedroom(C), open(O), 4), t) :- goal(C, open(O), t), subtask(put_alarm_clock_in_bedroom(C), open(O), 4).
goal(subtask(put_alarm_clock_in_bedroom(C), close(O), 5), t) :- goal(C, close(O), t), subtask(put_alarm_clock_in_bedroom(C), close(O), 5).
goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 6).
goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 7).
goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 8), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 8).
goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 9).
goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 10), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 10).
goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 11), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 11).
