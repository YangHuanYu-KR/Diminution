#program step(t).

goal(complete_surveys_on_amazon_turk(C), T0, t, 1) :- subtask(complete_surveys_on_amazon_turk(C)), subtask(complete_surveys_on_amazon_turk(C), walk(O1_1), 1), goal(subtask(complete_surveys_on_amazon_turk(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(complete_surveys_on_amazon_turk(C), sit(O2_1), 2), goal(subtask(complete_surveys_on_amazon_turk(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(complete_surveys_on_amazon_turk(C), walk(O3_1), 3), goal(subtask(complete_surveys_on_amazon_turk(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(complete_surveys_on_amazon_turk(C), T3, t, 2) :- subtask(complete_surveys_on_amazon_turk(C), switchon(O4_1), 4), goal(subtask(complete_surveys_on_amazon_turk(C), switchon(O4_1), 4), T3), T3 <= T4, time(T3), subtask(complete_surveys_on_amazon_turk(C), grab(O5_1), 5), goal(subtask(complete_surveys_on_amazon_turk(C), grab(O5_1), 5), T4), T4 <= T5, time(T4), subtask(complete_surveys_on_amazon_turk(C), lookat(O6_1), 6), goal(subtask(complete_surveys_on_amazon_turk(C), lookat(O6_1), 6), T5), T5 <= t, time(T5).
goal(complete_surveys_on_amazon_turk(C), T0, t, 3) :- goal(complete_surveys_on_amazon_turk(C), T0, T2, 1), goal(complete_surveys_on_amazon_turk(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(complete_surveys_on_amazon_turk(C), T6, t, 4) :- subtask(complete_surveys_on_amazon_turk(C), plugin(O7_1), 7), goal(subtask(complete_surveys_on_amazon_turk(C), plugin(O7_1), 7), T6), T6 <= t, time(T6).
goal(complete_surveys_on_amazon_turk(C), t) :- goal(complete_surveys_on_amazon_turk(C), T0, T5, 3), goal(complete_surveys_on_amazon_turk(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(complete_surveys_on_amazon_turk(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(complete_surveys_on_amazon_turk(C), walk(O), 1).
goal(subtask(complete_surveys_on_amazon_turk(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(complete_surveys_on_amazon_turk(C), sit(O), 2).
goal(subtask(complete_surveys_on_amazon_turk(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(complete_surveys_on_amazon_turk(C), walk(O), 3).
goal(subtask(complete_surveys_on_amazon_turk(C), switchon(O), 4), t) :- goal(C, switchon(O), t), subtask(complete_surveys_on_amazon_turk(C), switchon(O), 4).
goal(subtask(complete_surveys_on_amazon_turk(C), grab(O), 5), t) :- goal(C, grab(O), t), subtask(complete_surveys_on_amazon_turk(C), grab(O), 5).
goal(subtask(complete_surveys_on_amazon_turk(C), lookat(O), 6), t) :- goal(C, lookat(O), t), subtask(complete_surveys_on_amazon_turk(C), lookat(O), 6).
goal(subtask(complete_surveys_on_amazon_turk(C), plugin(O), 7), t) :- goal(C, plugin(O), t), subtask(complete_surveys_on_amazon_turk(C), plugin(O), 7).
