#program step(t).

goal(hang_up_car_keys(C), t) :- subtask(hang_up_car_keys(C)), subtask(hang_up_car_keys(C), walk(O1_1), 1), goal(subtask(hang_up_car_keys(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(hang_up_car_keys(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(hang_up_car_keys(C), walk(O), 1).
