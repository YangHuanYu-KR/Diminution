#program step(t).

goal(computer_work(C), t) :- subtask(computer_work(C)), subtask(computer_work(C), walk(O1_1), 1), goal(subtask(computer_work(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(computer_work(C), sit(O2_1), 2), goal(subtask(computer_work(C), sit(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(computer_work(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(computer_work(C), walk(O), 1).
goal(subtask(computer_work(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(computer_work(C), sit(O), 2).
