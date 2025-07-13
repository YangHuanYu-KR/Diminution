#program step(t).

goal(get_ready_to_leave(C), T0, t, 1) :- subtask(get_ready_to_leave(C)), subtask(get_ready_to_leave(C), standup, 1), goal(subtask(get_ready_to_leave(C), standup, 1), T0), T0 <= T1, time(T0), subtask(get_ready_to_leave(C), walk(O2_1), 2), goal(subtask(get_ready_to_leave(C), walk(O2_1), 2), T1), T1 <= T2, time(T1), subtask(get_ready_to_leave(C), grab(O3_1), 3), goal(subtask(get_ready_to_leave(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(get_ready_to_leave(C), T3, t, 2) :- subtask(get_ready_to_leave(C), walk(O4_1), 4), goal(subtask(get_ready_to_leave(C), walk(O4_1), 4), T3), T3 <= T4, time(T3), subtask(get_ready_to_leave(C), turnto(O5_1), 5), goal(subtask(get_ready_to_leave(C), turnto(O5_1), 5), T4), T4 <= T5, time(T4), subtask(get_ready_to_leave(C), open(O6_1), 6), goal(subtask(get_ready_to_leave(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(get_ready_to_leave(C), t) :- goal(get_ready_to_leave(C), T0, T2, 1), goal(get_ready_to_leave(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(get_ready_to_leave(C), standup, 1), t) :- goal(C, standup, t), subtask(get_ready_to_leave(C), standup, 1).
goal(subtask(get_ready_to_leave(C), walk(O), 2), t) :- goal(C, walk(O), t), subtask(get_ready_to_leave(C), walk(O), 2).
goal(subtask(get_ready_to_leave(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(get_ready_to_leave(C), grab(O), 3).
goal(subtask(get_ready_to_leave(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(get_ready_to_leave(C), walk(O), 4).
goal(subtask(get_ready_to_leave(C), turnto(O), 5), t) :- goal(C, turnto(O), t), subtask(get_ready_to_leave(C), turnto(O), 5).
goal(subtask(get_ready_to_leave(C), open(O), 6), t) :- goal(C, open(O), t), subtask(get_ready_to_leave(C), open(O), 6).
