#program step(t).

goal(put_alarm_clock_in_bedroom(C), T0, t, 1) :- subtask(put_alarm_clock_in_bedroom(C)), subtask(put_alarm_clock_in_bedroom(C), walk(O1_1), 1), goal(subtask(put_alarm_clock_in_bedroom(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(put_alarm_clock_in_bedroom(C), grab(O2_1), 2), goal(subtask(put_alarm_clock_in_bedroom(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(put_alarm_clock_in_bedroom(C), find(O3_1), 3), goal(subtask(put_alarm_clock_in_bedroom(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(put_alarm_clock_in_bedroom(C), T3, t, 2) :- subtask(put_alarm_clock_in_bedroom(C), putin(O4_1, O4_2), 4), goal(subtask(put_alarm_clock_in_bedroom(C), putin(O4_1, O4_2), 4), T3), T3 <= t, time(T3).
goal(put_alarm_clock_in_bedroom(C), t) :- goal(put_alarm_clock_in_bedroom(C), T0, T2, 1), goal(put_alarm_clock_in_bedroom(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(put_alarm_clock_in_bedroom(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(put_alarm_clock_in_bedroom(C), walk(O), 1).
goal(subtask(put_alarm_clock_in_bedroom(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(put_alarm_clock_in_bedroom(C), grab(O), 2).
goal(subtask(put_alarm_clock_in_bedroom(C), find(O), 3), t) :- goal(C, find(O), t), subtask(put_alarm_clock_in_bedroom(C), find(O), 3).
goal(subtask(put_alarm_clock_in_bedroom(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(put_alarm_clock_in_bedroom(C), putin(O1, O2), 4).
