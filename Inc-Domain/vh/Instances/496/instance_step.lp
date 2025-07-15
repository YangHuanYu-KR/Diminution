#program step(t).

goal(hang_car_keys(C), t) :- subtask(hang_car_keys(C)), subtask(hang_car_keys(C), grab(O1_1), 1), goal(subtask(hang_car_keys(C), grab(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hang_car_keys(C), walk(O2_1), 2), goal(subtask(hang_car_keys(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(hang_car_keys(C), putback(O3_1, O3_2), 3), goal(subtask(hang_car_keys(C), putback(O3_1, O3_2), 3), T2), T2 <= t, time(T2).

goal(subtask(hang_car_keys(C), grab(O), 1), t) :- goal(C, grab(O), t), subtask(hang_car_keys(C), grab(O), 1).
goal(subtask(hang_car_keys(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(hang_car_keys(C), walk(O), 2).
goal(subtask(hang_car_keys(C), putback(O1, O2), 3), t) :- goal(C, putback(O1, O2), t), subtask(hang_car_keys(C), putback(O1, O2), 3).
