#program step(t).

goal(let_baby_learn_how_to_walk(C), t) :- subtask(let_baby_learn_how_to_walk(C)), subtask(let_baby_learn_how_to_walk(C), cut(O1_1), 1), goal(subtask(let_baby_learn_how_to_walk(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(let_baby_learn_how_to_walk(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(let_baby_learn_how_to_walk(C), cut(O), 1).
