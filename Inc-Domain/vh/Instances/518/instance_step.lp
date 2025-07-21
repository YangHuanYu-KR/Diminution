#program step(t).

goal(write_report(C), t) :- subtask(write_report(C)), subtask(write_report(C), walk(O1_1), 1), goal(subtask(write_report(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write_report(C), lookat(O2_1), 2), goal(subtask(write_report(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(write_report(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(write_report(C), walk(O), 1).
goal(subtask(write_report(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(write_report(C), lookat(O), 2).
