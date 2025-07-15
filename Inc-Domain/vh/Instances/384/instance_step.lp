#program step(t).

goal(pay_bills(C), T0, t, 1) :- subtask(pay_bills(C)), subtask(pay_bills(C), walk(O1_1), 1), goal(subtask(pay_bills(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(pay_bills(C), grab(O2_1), 2), goal(subtask(pay_bills(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(pay_bills(C), walk(O3_1), 3), goal(subtask(pay_bills(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(pay_bills(C), T3, t, 2) :- subtask(pay_bills(C), grab(O4_1), 4), goal(subtask(pay_bills(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(pay_bills(C), lookat(O5_1), 5), goal(subtask(pay_bills(C), lookat(O5_1), 5), T4), T4 <= T5, time(T4), subtask(pay_bills(C), lookat(O6_1), 6), goal(subtask(pay_bills(C), lookat(O6_1), 6), T5), T5 <= t, time(T5).
goal(pay_bills(C), T0, t, 3) :- goal(pay_bills(C), T0, T2, 1), goal(pay_bills(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(pay_bills(C), T6, t, 4) :- subtask(pay_bills(C), walk(O7_1), 7), goal(subtask(pay_bills(C), walk(O7_1), 7), T6), T6 <= T7, time(T6), subtask(pay_bills(C), putback(O8_1, O8_2), 8), goal(subtask(pay_bills(C), putback(O8_1, O8_2), 8), T7), T7 <= t, time(T7).
goal(pay_bills(C), t) :- goal(pay_bills(C), T0, T5, 3), goal(pay_bills(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(pay_bills(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pay_bills(C), walk(O), 1).
goal(subtask(pay_bills(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(pay_bills(C), grab(O), 2).
goal(subtask(pay_bills(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(pay_bills(C), walk(O), 3).
goal(subtask(pay_bills(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(pay_bills(C), grab(O), 4).
goal(subtask(pay_bills(C), lookat(O), 5), t) :- goal(C, lookat(O), t), subtask(pay_bills(C), lookat(O), 5).
goal(subtask(pay_bills(C), lookat(O), 6), t) :- goal(C, lookat(O), t), subtask(pay_bills(C), lookat(O), 6).
goal(subtask(pay_bills(C), walk(O), 7), t) :- goal(C, walk(O), t), subtask(pay_bills(C), walk(O), 7).
goal(subtask(pay_bills(C), putback(O1, O2), 8), t) :- goal(C, putback(O1, O2), t), subtask(pay_bills(C), putback(O1, O2), 8).
