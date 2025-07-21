#program step(t).

goal(get_toilet_paper(C), t) :- subtask(get_toilet_paper(C)), subtask(get_toilet_paper(C), walk(O1_1), 1), goal(subtask(get_toilet_paper(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(get_toilet_paper(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(get_toilet_paper(C), walk(O), 1).
