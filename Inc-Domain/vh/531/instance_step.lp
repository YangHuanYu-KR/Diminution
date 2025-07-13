#program step(t).

goal(do_taxes(C), T0, t, 1) :- subtask(do_taxes(C)), subtask(do_taxes(C), walk(O1_1), 1), goal(subtask(do_taxes(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(do_taxes(C), walk(O2_1), 2), goal(subtask(do_taxes(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(do_taxes(C), sit(O3_1), 3), goal(subtask(do_taxes(C), sit(O3_1), 3), T2), T2 <= t, time(T2).
goal(do_taxes(C), T3, t, 2) :- subtask(do_taxes(C), grab(O4_1), 4), goal(subtask(do_taxes(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(do_taxes(C), grab(O5_1), 5), goal(subtask(do_taxes(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(do_taxes(C), grab(O6_1), 6), goal(subtask(do_taxes(C), grab(O6_1), 6), T5), T5 <= t, time(T5).
goal(do_taxes(C), T0, t, 3) :- goal(do_taxes(C), T0, T2, 1), goal(do_taxes(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(do_taxes(C), T6, t, 4) :- subtask(do_taxes(C), switchon(O7_1), 7), goal(subtask(do_taxes(C), switchon(O7_1), 7), T6), T6 <= T7, time(T6), subtask(do_taxes(C), lookat(O8_1), 8), goal(subtask(do_taxes(C), lookat(O8_1), 8), T7), T7 <= t, time(T7).
goal(do_taxes(C), t) :- goal(do_taxes(C), T0, T5, 3), goal(do_taxes(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(do_taxes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(do_taxes(C), walk(O), 1).
goal(subtask(do_taxes(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(do_taxes(C), walk(O), 2).
goal(subtask(do_taxes(C), sit(O), 3), t) :- goal(C, sit(O), t), subtask(do_taxes(C), sit(O), 3).
goal(subtask(do_taxes(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(do_taxes(C), grab(O), 4).
goal(subtask(do_taxes(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(do_taxes(C), grab(O), 5).
goal(subtask(do_taxes(C), grab(O), 6), t) :- goal(C, grab(O), t), subtask(do_taxes(C), grab(O), 6).
goal(subtask(do_taxes(C), switchon(O), 7), t) :- goal(C, switchon(O), t), subtask(do_taxes(C), switchon(O), 7).
goal(subtask(do_taxes(C), lookat(O), 8), t) :- goal(C, lookat(O), t), subtask(do_taxes(C), lookat(O), 8).
