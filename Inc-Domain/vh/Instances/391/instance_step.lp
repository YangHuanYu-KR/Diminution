#program step(t).

goal(computer_work(C), T0, t, 1) :- subtask(computer_work(C)), subtask(computer_work(C), walk(O1_1), 1), goal(subtask(computer_work(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(computer_work(C), sit(O2_1), 2), goal(subtask(computer_work(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(computer_work(C), grab(O3_1), 3), goal(subtask(computer_work(C), grab(O3_1), 3), T2), T2 <= t, time(T2).
goal(computer_work(C), T3, t, 2) :- subtask(computer_work(C), grab(O4_1), 4), goal(subtask(computer_work(C), grab(O4_1), 4), T3), T3 <= T4, time(T3), subtask(computer_work(C), turnto(O5_1), 5), goal(subtask(computer_work(C), turnto(O5_1), 5), T4), T4 <= t, time(T4).
goal(computer_work(C), t) :- goal(computer_work(C), T0, T2, 1), goal(computer_work(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(computer_work(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(computer_work(C), walk(O), 1).
goal(subtask(computer_work(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(computer_work(C), sit(O), 2).
goal(subtask(computer_work(C), grab(O), 3), t) :- goal(C, grab(O), t), subtask(computer_work(C), grab(O), 3).
goal(subtask(computer_work(C), grab(O), 4), t) :- goal(C, grab(O), t), subtask(computer_work(C), grab(O), 4).
goal(subtask(computer_work(C), turnto(O), 5), t) :- goal(C, turnto(O), t), subtask(computer_work(C), turnto(O), 5).
