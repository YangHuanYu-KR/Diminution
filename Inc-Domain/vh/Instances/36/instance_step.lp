#program step(t).

goal(make_coffee(C), T0, t, 1) :- subtask(make_coffee(C)), subtask(make_coffee(C), walk(O1_1), 1), goal(subtask(make_coffee(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(make_coffee(C), find(O2_1), 2), goal(subtask(make_coffee(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(make_coffee(C), turnto(O3_1), 3), goal(subtask(make_coffee(C), turnto(O3_1), 3), T2), T2 <= t, time(T2).
goal(make_coffee(C), T3, t, 2) :- subtask(make_coffee(C), switchon(O4_1), 4), goal(subtask(make_coffee(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(make_coffee(C), walk(O5_1), 5), goal(subtask(make_coffee(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(make_coffee(C), find(O6_1), 6), goal(subtask(make_coffee(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(make_coffee(C), T0, t, 3) :- goal(make_coffee(C), T0, T2, 1), goal(make_coffee(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(make_coffee(C), T6, t, 4) :- subtask(make_coffee(C), pour(O7_1, O7_2), 7), goal(subtask(make_coffee(C), pour(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(make_coffee(C), plugin(O8_1), 8), goal(subtask(make_coffee(C), plugin(O8_1), 8), T7), T7 <= t, time(T7).
goal(make_coffee(C), t) :- goal(make_coffee(C), T0, T5, 3), goal(make_coffee(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(make_coffee(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(make_coffee(C), walk(O), 1).
goal(subtask(make_coffee(C), find(O), 2), t) :- goal(C, find(O), t), subtask(make_coffee(C), find(O), 2).
goal(subtask(make_coffee(C), turnto(O), 3), t) :- goal(C, turnto(O), t), subtask(make_coffee(C), turnto(O), 3).
goal(subtask(make_coffee(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(make_coffee(C), switchon(O), 4).
goal(subtask(make_coffee(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(make_coffee(C), walk(O), 5).
goal(subtask(make_coffee(C), find(O), 6), t) :- goal(C, find(O), t), subtask(make_coffee(C), find(O), 6).
goal(subtask(make_coffee(C), pour(O1, O2), 7), t) :- goal(C, pour(O1, O2), t), subtask(make_coffee(C), pour(O1, O2), 7).
goal(subtask(make_coffee(C), plugin(O), 8), t) :- goal(C, plugin(O), t), subtask(make_coffee(C), plugin(O), 8).
