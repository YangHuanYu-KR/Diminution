#program step(t).

goal(go_to_sleep(C), t) :- subtask(go_to_sleep(C)), subtask(go_to_sleep(C), walk(O1_1), 1), goal(subtask(go_to_sleep(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(go_to_sleep(C), lie(O2_1), 2), goal(subtask(go_to_sleep(C), lie(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(go_to_sleep(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(go_to_sleep(C), walk(O), 1).
goal(subtask(go_to_sleep(C), lie(O), 2), t) :- goal(C, lie(O), t), subtask(go_to_sleep(C), lie(O), 2).
