#program step(t).

goal(get_something_to_drink(C), T0, t, 1) :- subtask(get_something_to_drink(C)), subtask(get_something_to_drink(C), walk(O1_1), 1), goal(subtask(get_something_to_drink(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(get_something_to_drink(C), find(O2_1), 2), goal(subtask(get_something_to_drink(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(get_something_to_drink(C), open(O3_1), 3), goal(subtask(get_something_to_drink(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(get_something_to_drink(C), T3, t, 2) :- subtask(get_something_to_drink(C), grab(O4_1), 4), goal(subtask(get_something_to_drink(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(get_something_to_drink(C), walk(O5_1), 5), goal(subtask(get_something_to_drink(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(get_something_to_drink(C), find(O6_1), 6), goal(subtask(get_something_to_drink(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(get_something_to_drink(C), T0, t, 3) :- goal(get_something_to_drink(C), T0, T2, 1), goal(get_something_to_drink(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(get_something_to_drink(C), T6, t, 4) :- subtask(get_something_to_drink(C), pour(O7_1, O7_2), 7), goal(subtask(get_something_to_drink(C), pour(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(get_something_to_drink(C), drink(O8_1), 8), goal(subtask(get_something_to_drink(C), drink(O8_1), 8), T7), T7 <= t, time(T7).
goal(get_something_to_drink(C), t) :- goal(get_something_to_drink(C), T0, T5, 3), goal(get_something_to_drink(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(get_something_to_drink(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(get_something_to_drink(C), walk(O), 1).
goal(subtask(get_something_to_drink(C), find(O), 2), t) :- goal(C, find(O), t), subtask(get_something_to_drink(C), find(O), 2).
goal(subtask(get_something_to_drink(C), open(O), 3), t) :- goal(C, open(O), t), subtask(get_something_to_drink(C), open(O), 3).
goal(subtask(get_something_to_drink(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(get_something_to_drink(C), grab(O), 4).
goal(subtask(get_something_to_drink(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(get_something_to_drink(C), walk(O), 5).
goal(subtask(get_something_to_drink(C), find(O), 6), t) :- goal(C, find(O), t), subtask(get_something_to_drink(C), find(O), 6).
goal(subtask(get_something_to_drink(C), pour(O1, O2), 7), t) :- goal(C, pour(O1, O2), t), subtask(get_something_to_drink(C), pour(O1, O2), 7).
goal(subtask(get_something_to_drink(C), drink(O), 8), t) :- goal(C, drink(O), t), subtask(get_something_to_drink(C), drink(O), 8).
