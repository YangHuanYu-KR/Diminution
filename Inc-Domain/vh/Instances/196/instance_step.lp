#program step(t).

goal(hang_up_car_keys(C), T0, t, 1) :- subtask(hang_up_car_keys(C)), subtask(hang_up_car_keys(C), walk(O1_1), 1), goal(subtask(hang_up_car_keys(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(hang_up_car_keys(C), grab(O2_1), 2), goal(subtask(hang_up_car_keys(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(hang_up_car_keys(C), find(O3_1), 3), goal(subtask(hang_up_car_keys(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(hang_up_car_keys(C), T3, t, 2) :- subtask(hang_up_car_keys(C), putin(O4_1, O4_2), 4), goal(subtask(hang_up_car_keys(C), putin(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(hang_up_car_keys(C), sit(O5_1), 5), goal(subtask(hang_up_car_keys(C), sit(O5_1), 5), T4), T4 <= t, time(T4).
goal(hang_up_car_keys(C), t) :- goal(hang_up_car_keys(C), T0, T2, 1), goal(hang_up_car_keys(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(hang_up_car_keys(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(hang_up_car_keys(C), walk(O), 1).
goal(subtask(hang_up_car_keys(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(hang_up_car_keys(C), grab(O), 2).
goal(subtask(hang_up_car_keys(C), find(O), 3), t) :- goal(C, find(O), t), subtask(hang_up_car_keys(C), find(O), 3).
goal(subtask(hang_up_car_keys(C), putin(O1, O2), 4), t) :- goal(C, putin(O1, O2), t), subtask(hang_up_car_keys(C), putin(O1, O2), 4).
goal(subtask(hang_up_car_keys(C), sit(O), 5), t) :- goal(C, sit(O), t), subtask(hang_up_car_keys(C), sit(O), 5).
