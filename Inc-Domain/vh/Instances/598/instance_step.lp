#program step(t).

goal(go_to_sleep(C), T0, t, 1) :- subtask(go_to_sleep(C)), subtask(go_to_sleep(C), open(O1_1), 1), goal(subtask(go_to_sleep(C), open(O1_1), 1), T0), T0 <= T1, time(T0), subtask(go_to_sleep(C), putin(O2_1, O2_2), 2), goal(subtask(go_to_sleep(C), putin(O2_1, O2_2), 2), T1), T1 <= T2, time(T1), subtask(go_to_sleep(C), close(O3_1), 3), goal(subtask(go_to_sleep(C), close(O3_1), 3), T2), T2 <= t, time(T2).
goal(go_to_sleep(C), T3, t, 2) :- subtask(go_to_sleep(C), switchon(O4_1), 4), goal(subtask(go_to_sleep(C), switchon(O4_1), 4), T3), T3 <= t, time(T3).
goal(go_to_sleep(C), t) :- goal(go_to_sleep(C), T0, T2, 1), goal(go_to_sleep(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(go_to_sleep(C), open(O), 1), t) :- goal(C, open(O), t), subtask(go_to_sleep(C), open(O), 1).
goal(subtask(go_to_sleep(C), putin(O1, O2), 2), t) :- goal(C, putin(O1, O2), t), subtask(go_to_sleep(C), putin(O1, O2), 2).
goal(subtask(go_to_sleep(C), close(O), 3), t) :- goal(C, close(O), t), subtask(go_to_sleep(C), close(O), 3).
goal(subtask(go_to_sleep(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(go_to_sleep(C), switchon(O), 4).
