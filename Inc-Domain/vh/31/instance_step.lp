#program step(t).

goal(complete_surveys_on_amazon_turk(C), T0, t, 1) :- subtask(complete_surveys_on_amazon_turk(C)), subtask(complete_surveys_on_amazon_turk(C), walk(O1_1), 1), goal(subtask(complete_surveys_on_amazon_turk(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(complete_surveys_on_amazon_turk(C), sit(O2_1), 2), goal(subtask(complete_surveys_on_amazon_turk(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(complete_surveys_on_amazon_turk(C), open(O3_1), 3), goal(subtask(complete_surveys_on_amazon_turk(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(complete_surveys_on_amazon_turk(C), T3, t, 2) :- subtask(complete_surveys_on_amazon_turk(C), run(O4_1), 4), goal(subtask(complete_surveys_on_amazon_turk(C), run(O4_1), 4), T3), T3 <= t, time(T3).
goal(complete_surveys_on_amazon_turk(C), t) :- goal(complete_surveys_on_amazon_turk(C), T0, T2, 1), goal(complete_surveys_on_amazon_turk(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(complete_surveys_on_amazon_turk(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(complete_surveys_on_amazon_turk(C), walk(O), 1).
goal(subtask(complete_surveys_on_amazon_turk(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(complete_surveys_on_amazon_turk(C), sit(O), 2).
goal(subtask(complete_surveys_on_amazon_turk(C), open(O), 3), t) :- goal(C, open(O), t), subtask(complete_surveys_on_amazon_turk(C), open(O), 3).
goal(subtask(complete_surveys_on_amazon_turk(C), run(O), 4), t) :- goal(C, run(O), t), subtask(complete_surveys_on_amazon_turk(C), run(O), 4).
