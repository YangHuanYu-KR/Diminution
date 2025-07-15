#program step(t).

goal(breakfast(C), T0, t, 1) :- subtask(breakfast(C)), subtask(breakfast(C), walk(O1_1), 1), goal(subtask(breakfast(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(breakfast(C), find(O2_1), 2), goal(subtask(breakfast(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(breakfast(C), grab(O3_1), 3), goal(subtask(breakfast(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(breakfast(C), T3, t, 2) :- subtask(breakfast(C), find(O4_1), 4), goal(subtask(breakfast(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(breakfast(C), putin(O5_1, O5_2), 5), goal(subtask(breakfast(C), putin(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(breakfast(C), switchon(O6_1), 6), goal(subtask(breakfast(C), switchon(O6_1), 6), T5), T5 <= t, time(T5).
goal(breakfast(C), T0, t, 3) :- goal(breakfast(C), T0, T2, 1), goal(breakfast(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(breakfast(C), T6, t, 4) :- subtask(breakfast(C), eat(O7_1), 7), goal(subtask(breakfast(C), eat(O7_1), 7), T6), T6 <= T7, time(T6), subtask(breakfast(C), sit(O8_1), 8), goal(subtask(breakfast(C), sit(O8_1), 8), T7), T7 <= T8, time(T7), subtask(breakfast(C), eat(O9_1), 9), goal(subtask(breakfast(C), eat(O9_1), 9), T8), T8 <= t, time(T8).
goal(breakfast(C), t) :- goal(breakfast(C), T0, T5, 3), goal(breakfast(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(breakfast(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(breakfast(C), walk(O), 1).
goal(subtask(breakfast(C), find(O), 2), t) :- goal(C, find(O), t), subtask(breakfast(C), find(O), 2).
goal(subtask(breakfast(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(breakfast(C), grab(O), 3).
goal(subtask(breakfast(C), find(O), 4), t) :- goal(C, find(O), t), subtask(breakfast(C), find(O), 4).
goal(subtask(breakfast(C), putin(O1, O2), 5), t) :- goal(C, putin(O1, O2), t), subtask(breakfast(C), putin(O1, O2), 5).
goal(subtask(breakfast(C), switchon(O), 6), t) :- goal(C, switchon(O), t), subtask(breakfast(C), switchon(O), 6).
goal(subtask(breakfast(C), eat(O), 7), t) :- goal(C, eat(O), t), subtask(breakfast(C), eat(O), 7).
goal(subtask(breakfast(C), sit(O), 8), t) :- goal(C, sit(O), t), subtask(breakfast(C), sit(O), 8).
goal(subtask(breakfast(C), eat(O), 9), t) :- goal(C, eat(O), t), subtask(breakfast(C), eat(O), 9).
