#program step(t).

goal(eat_cereal(C), t) :- subtask(eat_cereal(C)), subtask(eat_cereal(C), walk(O1_1), 1), goal(subtask(eat_cereal(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(eat_cereal(C), find(O2_1), 2), goal(subtask(eat_cereal(C), find(O2_1), 2), T1), T1 <= T2, time(T1), subtask(eat_cereal(C), eat(O3_1), 3), goal(subtask(eat_cereal(C), eat(O3_1), 3), T2), T2 <= t, time(T2).

goal(subtask(eat_cereal(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(eat_cereal(C), walk(O), 1).
goal(subtask(eat_cereal(C), find(O), 2), t) :- goal(C, find(O), t), subtask(eat_cereal(C), find(O), 2).
goal(subtask(eat_cereal(C), eat(O), 3), t) :- goal(C, eat(O), t), subtask(eat_cereal(C), eat(O), 3).
