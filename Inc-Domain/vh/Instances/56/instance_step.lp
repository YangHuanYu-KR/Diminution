#program step(t).

goal(cook_some_food(C), T0, t, 1) :- subtask(cook_some_food(C)), subtask(cook_some_food(C), walk(O1_1), 1), goal(subtask(cook_some_food(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(cook_some_food(C), find(O2_1), 2), goal(subtask(cook_some_food(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(cook_some_food(C), grab(O3_1), 3), goal(subtask(cook_some_food(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(cook_some_food(C), T3, t, 2) :- subtask(cook_some_food(C), find(O4_1), 4), goal(subtask(cook_some_food(C), find(O4_1), 4), T3), T3 <= T4, time(T3), subtask(cook_some_food(C), find(O5_1), 5), goal(subtask(cook_some_food(C), find(O5_1), 5), T4), T4 <= T5, time(T4), subtask(cook_some_food(C), find(O6_1), 6), goal(subtask(cook_some_food(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(cook_some_food(C), T0, t, 3) :- goal(cook_some_food(C), T0, T2, 1), goal(cook_some_food(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(cook_some_food(C), T6, t, 4) :- subtask(cook_some_food(C), find(O7_1), 7), goal(subtask(cook_some_food(C), find(O7_1), 7), T6), T6 <= T7, time(T6), subtask(cook_some_food(C), find(O8_1), 8), goal(subtask(cook_some_food(C), find(O8_1), 8), T7), T7 <= T8, time(T7), subtask(cook_some_food(C), find(O9_1), 9), goal(subtask(cook_some_food(C), find(O9_1), 9), T8), T8 <= t, time(T8).
goal(cook_some_food(C), T0, t, 5) :- goal(cook_some_food(C), T0, T5, 3), goal(cook_some_food(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(cook_some_food(C), T9, t, 6) :- subtask(cook_some_food(C), find(O10_1), 10), goal(subtask(cook_some_food(C), find(O10_1), 10), T9), T9 <= T10, time(T9), subtask(cook_some_food(C), find(O11_1), 11), goal(subtask(cook_some_food(C), find(O11_1), 11), T10), T10 <= T11, time(T10), subtask(cook_some_food(C), eat(O12_1), 12), goal(subtask(cook_some_food(C), eat(O12_1), 12), T11), T11 <= t, time(T11).
goal(cook_some_food(C), T0, t, 7) :- goal(cook_some_food(C), T0, T8, 5), goal(cook_some_food(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(cook_some_food(C), T12, t, 8) :- subtask(cook_some_food(C), eat(O13_1), 13), goal(subtask(cook_some_food(C), eat(O13_1), 13), T12), T12 <= T13, time(T12), subtask(cook_some_food(C), pour(O14_1, O14_2), 14), goal(subtask(cook_some_food(C), pour(O14_1, O14_2), 14), T13), T13 <= T14, time(T13), subtask(cook_some_food(C), switchon(O15_1), 15), goal(subtask(cook_some_food(C), switchon(O15_1), 15), T14), T14 <= t, time(T14).
goal(cook_some_food(C), T0, t, 9) :- goal(cook_some_food(C), T0, T11, 7), goal(cook_some_food(C), T12, T14, 8), time(T0), time(T11), time(T12), T11 <= T12, time(T14), T12 <= t.
goal(cook_some_food(C), T15, t, 10) :- subtask(cook_some_food(C), pour(O16_1, O16_2), 16), goal(subtask(cook_some_food(C), pour(O16_1, O16_2), 16), T15), T15 <= t, time(T15).
goal(cook_some_food(C), t) :- goal(cook_some_food(C), T0, T14, 9), goal(cook_some_food(C), T15, t, 10), time(T0), time(T14), time(T15), T14 <= T15.

goal(subtask(cook_some_food(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(cook_some_food(C), walk(O), 1).
goal(subtask(cook_some_food(C), find(O), 2), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 2).
goal(subtask(cook_some_food(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(cook_some_food(C), grab(O), 3).
goal(subtask(cook_some_food(C), find(O), 4), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 4).
goal(subtask(cook_some_food(C), find(O), 5), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 5).
goal(subtask(cook_some_food(C), find(O), 6), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 6).
goal(subtask(cook_some_food(C), find(O), 7), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 7).
goal(subtask(cook_some_food(C), find(O), 8), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 8).
goal(subtask(cook_some_food(C), find(O), 9), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 9).
goal(subtask(cook_some_food(C), find(O), 10), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 10).
goal(subtask(cook_some_food(C), find(O), 11), t) :- goal(C, find(O), t), subtask(cook_some_food(C), find(O), 11).
goal(subtask(cook_some_food(C), eat(O), 12), t) :- goal(C, eat(O), t), subtask(cook_some_food(C), eat(O), 12).
goal(subtask(cook_some_food(C), eat(O), 13), t) :- goal(C, eat(O), t), subtask(cook_some_food(C), eat(O), 13).
goal(subtask(cook_some_food(C), pour(O1, O2), 14), t) :- goal(C, pour(O1, O2), t), subtask(cook_some_food(C), pour(O1, O2), 14).
goal(subtask(cook_some_food(C), switchon(O), 15), t) :- goal(C, switchon(O), t), subtask(cook_some_food(C), switchon(O), 15).
goal(subtask(cook_some_food(C), pour(O1, O2), 16), t) :- goal(C, pour(O1, O2), t), subtask(cook_some_food(C), pour(O1, O2), 16).
