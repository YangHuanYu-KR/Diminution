#program step(t).

goal(let_baby_learn_how_to_walk(C), T0, t, 1) :- subtask(let_baby_learn_how_to_walk(C)), subtask(let_baby_learn_how_to_walk(C), walk(O1_1), 1), goal(subtask(let_baby_learn_how_to_walk(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(let_baby_learn_how_to_walk(C), standup, 2), goal(subtask(let_baby_learn_how_to_walk(C), standup, 2), T1), T1 <= T2, time(T1), subtask(let_baby_learn_how_to_walk(C), walk(O3_1), 3), goal(subtask(let_baby_learn_how_to_walk(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(let_baby_learn_how_to_walk(C), T3, t, 2) :- subtask(let_baby_learn_how_to_walk(C), touch(O4_1), 4), goal(subtask(let_baby_learn_how_to_walk(C), touch(O4_1), 4), T3), T3 <= T4, time(T3), subtask(let_baby_learn_how_to_walk(C), walk(O5_1), 5), goal(subtask(let_baby_learn_how_to_walk(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(let_baby_learn_how_to_walk(C), walk(O6_1), 6), goal(subtask(let_baby_learn_how_to_walk(C), walk(O6_1), 6), T5), T5 <= t, time(T5).
goal(let_baby_learn_how_to_walk(C), t) :- goal(let_baby_learn_how_to_walk(C), T0, T2, 1), goal(let_baby_learn_how_to_walk(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(let_baby_learn_how_to_walk(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(let_baby_learn_how_to_walk(C), walk(O), 1).
goal(subtask(let_baby_learn_how_to_walk(C), standup, 2), t) :- goal(C, standup, t), subtask(let_baby_learn_how_to_walk(C), standup, 2).
goal(subtask(let_baby_learn_how_to_walk(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(let_baby_learn_how_to_walk(C), walk(O), 3).
goal(subtask(let_baby_learn_how_to_walk(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(let_baby_learn_how_to_walk(C), touch(O), 4).
goal(subtask(let_baby_learn_how_to_walk(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(let_baby_learn_how_to_walk(C), walk(O), 5).
goal(subtask(let_baby_learn_how_to_walk(C), walk(O), 6), t) :- goal(C, walk(O), t), subtask(let_baby_learn_how_to_walk(C), walk(O), 6).
