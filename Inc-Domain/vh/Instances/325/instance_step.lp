#program step(t).

goal(cook_some_food(C), T0, t, 1) :- subtask(cook_some_food(C)), subtask(cook_some_food(C), walk(O1_1), 1), goal(subtask(cook_some_food(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(cook_some_food(C), grab(O2_1), 2), goal(subtask(cook_some_food(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(cook_some_food(C), grab(O3_1), 3), goal(subtask(cook_some_food(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(cook_some_food(C), T3, t, 2) :- subtask(cook_some_food(C), grab(O4_1), 4), goal(subtask(cook_some_food(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(cook_some_food(C), grab(O5_1), 5), goal(subtask(cook_some_food(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(cook_some_food(C), walk(O6_1), 6), goal(subtask(cook_some_food(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(cook_some_food(C), T0, t, 3) :- goal(cook_some_food(C), T0, T2, 1), goal(cook_some_food(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(cook_some_food(C), T6, t, 4) :- subtask(cook_some_food(C), cut(O7_1), 7), goal(subtask(cook_some_food(C), cut(O7_1), 7), T6), T6 <= T7, time(T6), subtask(cook_some_food(C), cut(O8_1), 8), goal(subtask(cook_some_food(C), cut(O8_1), 8), T7), T7 <= T8, time(T7), subtask(cook_some_food(C), walk(O9_1), 9), goal(subtask(cook_some_food(C), walk(O9_1), 9), T8), T8 <= t, time(T8).
goal(cook_some_food(C), T0, t, 5) :- goal(cook_some_food(C), T0, T5, 3), goal(cook_some_food(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(cook_some_food(C), T9, t, 6) :- subtask(cook_some_food(C), open(O10_1), 10), goal(subtask(cook_some_food(C), open(O10_1), 10), T9), T9 <= T10, time(T9), subtask(cook_some_food(C), putin(O11_1, O11_2), 11), goal(subtask(cook_some_food(C), putin(O11_1, O11_2), 11), T10), T10 <= T11, time(T10), subtask(cook_some_food(C), putin(O12_1, O12_2), 12), goal(subtask(cook_some_food(C), putin(O12_1, O12_2), 12), T11), T11 <= t, time(T11).
goal(cook_some_food(C), T0, t, 7) :- goal(cook_some_food(C), T0, T8, 5), goal(cook_some_food(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(cook_some_food(C), T12, t, 8) :- subtask(cook_some_food(C), close(O13_1), 13), goal(subtask(cook_some_food(C), close(O13_1), 13), T12), T12 <= T13, time(T12), subtask(cook_some_food(C), walk(O14_1), 14), goal(subtask(cook_some_food(C), walk(O14_1), 14), T13), T13 <= T14, time(T13), subtask(cook_some_food(C), grab(O15_1), 15), goal(subtask(cook_some_food(C), grab(O15_1), 15), T14), T14 <= t, time(T14).
goal(cook_some_food(C), T0, t, 9) :- goal(cook_some_food(C), T0, T11, 7), goal(cook_some_food(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(cook_some_food(C), T15, t, 10) :- subtask(cook_some_food(C), walk(O16_1), 16), goal(subtask(cook_some_food(C), walk(O16_1), 16), T15), T15 <= T16, time(T15), subtask(cook_some_food(C), wash(O17_1), 17), goal(subtask(cook_some_food(C), wash(O17_1), 17), T16), T16 <= T17, time(T16), subtask(cook_some_food(C), walk(O18_1), 18), goal(subtask(cook_some_food(C), walk(O18_1), 18), T17), T17 <= t, time(T17).
goal(cook_some_food(C), T0, t, 11) :- goal(cook_some_food(C), T0, T14, 9), goal(cook_some_food(C), T15, T17, 10), time(T0), time(T14), time(T15), T14 <= T15, time(T17), T15 <= t.
goal(cook_some_food(C), T18, t, 12) :- subtask(cook_some_food(C), putback(O19_1, O19_2), 19), goal(subtask(cook_some_food(C), putback(O19_1, O19_2), 19), T18), T18 <= t, time(T18).
goal(cook_some_food(C), t) :- goal(cook_some_food(C), T0, T17, 11), goal(cook_some_food(C), T18, t, 12), time(T0), time(T17), time(T18), T17 <= T18.

goal(subtask(cook_some_food(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(cook_some_food(C), walk(O), 1).
goal(subtask(cook_some_food(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(cook_some_food(C), grab(O), 2).
goal(subtask(cook_some_food(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(cook_some_food(C), grab(O), 3).
goal(subtask(cook_some_food(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(cook_some_food(C), grab(O), 4).
goal(subtask(cook_some_food(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(cook_some_food(C), grab(O), 5).
goal(subtask(cook_some_food(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(cook_some_food(C), walk(O), 6).
goal(subtask(cook_some_food(C), cut(O), 7), t) :- goal(C, cut(O), t), subtask(cook_some_food(C), cut(O), 7).
goal(subtask(cook_some_food(C), cut(O), 8), t) :- goal(C, cut(O), t), subtask(cook_some_food(C), cut(O), 8).
goal(subtask(cook_some_food(C), walk(O), 9), t) :- goal(C, walk(O), t), subtask(cook_some_food(C), walk(O), 9).
goal(subtask(cook_some_food(C), open(O), 10), t) :- goal(C, open(O), t), subtask(cook_some_food(C), open(O), 10).
goal(subtask(cook_some_food(C), putin(O1, O2), 11), t) :- goal(C, putin(O1, O2), t), subtask(cook_some_food(C), putin(O1, O2), 11).
goal(subtask(cook_some_food(C), putin(O1, O2), 12), t) :- goal(C, putin(O1, O2), t), subtask(cook_some_food(C), putin(O1, O2), 12).
goal(subtask(cook_some_food(C), close(O), 13), t) :- goal(C, close(O), t), subtask(cook_some_food(C), close(O), 13).
goal(subtask(cook_some_food(C), walk(O), 14), t) :- goal(C, walk(O), t), subtask(cook_some_food(C), walk(O), 14).
goal(subtask(cook_some_food(C), grab(O), 15), t) :- goal(C, grab(O), t), subtask(cook_some_food(C), grab(O), 15).
goal(subtask(cook_some_food(C), walk(O), 16), t) :- goal(C, walk(O), t), subtask(cook_some_food(C), walk(O), 16).
goal(subtask(cook_some_food(C), wash(O), 17), t) :- goal(C, wash(O), t), subtask(cook_some_food(C), wash(O), 17).
goal(subtask(cook_some_food(C), walk(O), 18), t) :- goal(C, walk(O), t), subtask(cook_some_food(C), walk(O), 18).
goal(subtask(cook_some_food(C), putback(O1, O2), 19), t) :- goal(C, putback(O1, O2), t), subtask(cook_some_food(C), putback(O1, O2), 19).
