#program step(t).

goal(make_toast(C), T0, t, 1) :- subtask(make_toast(C)), subtask(make_toast(C), walk(O1_1), 1), goal(subtask(make_toast(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(make_toast(C), grab(O2_1), 2), goal(subtask(make_toast(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(make_toast(C), turnto(O3_1), 3), goal(subtask(make_toast(C), turnto(O3_1), 3), T2), T2 <= t, time(T2).
goal(make_toast(C), T3, t, 2) :- subtask(make_toast(C), putin(O4_1, O4_2), 4), goal(subtask(make_toast(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(make_toast(C), switchon(O5_1), 5), goal(subtask(make_toast(C), switchon(O5_1), 5), T4), T4 <= T5, time(T4), subtask(make_toast(C), switchoff(O6_1), 6), goal(subtask(make_toast(C), switchoff(O6_1), 6), T5), T5 <= t, time(T5).
goal(make_toast(C), T0, t, 3) :- goal(make_toast(C), T0, T2, 1), goal(make_toast(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(make_toast(C), T6, t, 4) :- subtask(make_toast(C), grab(O7_1), 7), goal(subtask(make_toast(C), grab(O7_1), 7), T6), T6 <= t, time(T6).
goal(make_toast(C), t) :- goal(make_toast(C), T0, T5, 3), goal(make_toast(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(make_toast(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(make_toast(C), walk(O), 1).
goal(subtask(make_toast(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(make_toast(C), grab(O), 2).
goal(subtask(make_toast(C), turnto(O), 3), t) :- goal(C, turnto(O), t), subtask(make_toast(C), turnto(O), 3).
goal(subtask(make_toast(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(make_toast(C), putin(O1, O2), 4).
goal(subtask(make_toast(C), switchon(O), 5), t) :- goal(C, switchon(O), t), subtask(make_toast(C), switchon(O), 5).
goal(subtask(make_toast(C), switchoff(O), 6), t) :- goal(C, switchoff(O), t), subtask(make_toast(C), switchoff(O), 6).
goal(subtask(make_toast(C), grab(O), 7), t) :- goal(C, grab(O), t), subtask(make_toast(C), grab(O), 7).
