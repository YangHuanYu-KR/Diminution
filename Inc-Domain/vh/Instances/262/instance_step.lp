#program step(t).

goal(do_taxes(C), T0, t, 1) :- subtask(do_taxes(C)), subtask(do_taxes(C), walk(O1_1), 1), goal(subtask(do_taxes(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(do_taxes(C), sit(O2_1), 2), goal(subtask(do_taxes(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(do_taxes(C), grab(O3_1), 3), goal(subtask(do_taxes(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(do_taxes(C), T3, t, 2) :- subtask(do_taxes(C), open(O4_1), 4), goal(subtask(do_taxes(C), open(O4_1), 4), T3), T3 <= t, time(T3).
goal(do_taxes(C), t) :- goal(do_taxes(C), T0, T2, 1), goal(do_taxes(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(do_taxes(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(do_taxes(C), walk(O), 1).
goal(subtask(do_taxes(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(do_taxes(C), sit(O), 2).
goal(subtask(do_taxes(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(do_taxes(C), grab(O), 3).
goal(subtask(do_taxes(C), open(O), 4), t) :- goal(C, open(O), t), subtask(do_taxes(C), open(O), 4).
