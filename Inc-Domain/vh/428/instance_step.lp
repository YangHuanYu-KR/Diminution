#program step(t).

goal(shut_front_door(C), t) :- subtask(shut_front_door(C)), subtask(shut_front_door(C), walk(O1_1), 1), goal(subtask(shut_front_door(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(shut_front_door(C), close(O2_1), 2), goal(subtask(shut_front_door(C), close(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(shut_front_door(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(shut_front_door(C), walk(O), 1).
goal(subtask(shut_front_door(C), close(O), 2), t) :- goal(C, close(O), t), subtask(shut_front_door(C), close(O), 2).
