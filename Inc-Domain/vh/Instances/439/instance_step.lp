#program step(t).

goal(shut_off_alarm(C), t) :- subtask(shut_off_alarm(C)), subtask(shut_off_alarm(C), walk(O1_1), 1), goal(subtask(shut_off_alarm(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(shut_off_alarm(C), turnto(O2_1), 2), goal(subtask(shut_off_alarm(C), turnto(O2_1), 2), T1), T1 <= T2, time(T1), subtask(shut_off_alarm(C), switchoff(O3_1), 3), goal(subtask(shut_off_alarm(C), switchoff(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(shut_off_alarm(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(shut_off_alarm(C), walk(O), 1).
goal(subtask(shut_off_alarm(C), turnto(O), 2), t) :- goal(C, turnto(O), t), subtask(shut_off_alarm(C), turnto(O), 2).
goal(subtask(shut_off_alarm(C), switchoff(O), 3), t) :- goal(C, switchoff(O), t), subtask(shut_off_alarm(C), switchoff(O), 3).
