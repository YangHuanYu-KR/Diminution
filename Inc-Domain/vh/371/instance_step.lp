#program step(t).

goal(take_dishes_out_of_dishwasher(C), T0, t, 1) :- subtask(take_dishes_out_of_dishwasher(C)), subtask(take_dishes_out_of_dishwasher(C), walk(O1_1), 1), goal(subtask(take_dishes_out_of_dishwasher(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(take_dishes_out_of_dishwasher(C), open(O2_1), 2), goal(subtask(take_dishes_out_of_dishwasher(C), open(O2_1), 2), T1), T1 <= T2, time(T1), subtask(take_dishes_out_of_dishwasher(C), grab(O3_1), 3), goal(subtask(take_dishes_out_of_dishwasher(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(take_dishes_out_of_dishwasher(C), T3, t, 2) :- subtask(take_dishes_out_of_dishwasher(C), walk(O4_1), 4), goal(subtask(take_dishes_out_of_dishwasher(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(take_dishes_out_of_dishwasher(C), putback(O5_1, O5_2), 5), goal(subtask(take_dishes_out_of_dishwasher(C), putback(O5_1, O5_2), 5), T4), T4 <= T5, time(T4), subtask(take_dishes_out_of_dishwasher(C), close(O6_1), 6), goal(subtask(take_dishes_out_of_dishwasher(C), close(O6_1), 6), T5), T5 <= t, time(T5).
goal(take_dishes_out_of_dishwasher(C), t) :- goal(take_dishes_out_of_dishwasher(C), T0, T2, 1), goal(take_dishes_out_of_dishwasher(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(take_dishes_out_of_dishwasher(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(take_dishes_out_of_dishwasher(C), walk(O), 1).
goal(subtask(take_dishes_out_of_dishwasher(C), open(O), 2), t) :- goal(C, open(O), t), subtask(take_dishes_out_of_dishwasher(C), open(O), 2).
goal(subtask(take_dishes_out_of_dishwasher(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(take_dishes_out_of_dishwasher(C), grab(O), 3).
goal(subtask(take_dishes_out_of_dishwasher(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(take_dishes_out_of_dishwasher(C), walk(O), 4).
goal(subtask(take_dishes_out_of_dishwasher(C), putback(O1, O2), 5), t) :- goal(C, putback(O1, O2), t), subtask(take_dishes_out_of_dishwasher(C), putback(O1, O2), 5).
goal(subtask(take_dishes_out_of_dishwasher(C), close(O), 6), t) :- goal(C, close(O), t), subtask(take_dishes_out_of_dishwasher(C), close(O), 6).
