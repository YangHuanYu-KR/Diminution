#program step(t).

goal(re_arrange_office(C), T0, t, 1) :- subtask(re_arrange_office(C)), subtask(re_arrange_office(C), close(O1_1), 1), goal(subtask(re_arrange_office(C), close(O1_1), 1), T0), T0 <= T1, time(T0), subtask(re_arrange_office(C), drink(O2_1), 2), goal(subtask(re_arrange_office(C), drink(O2_1), 2), T1), T1 <= T2, time(T1), subtask(re_arrange_office(C), walk(O3_1), 3), goal(subtask(re_arrange_office(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(re_arrange_office(C), T3, t, 2) :- subtask(re_arrange_office(C), walk(O4_1), 4), goal(subtask(re_arrange_office(C), walk(O4_1), 4), T3), T3 <= t, time(T3).
goal(re_arrange_office(C), t) :- goal(re_arrange_office(C), T0, T2, 1), goal(re_arrange_office(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(re_arrange_office(C), close(O), 1), t) :- goal(C, close(O), t), subtask(re_arrange_office(C), close(O), 1).
goal(subtask(re_arrange_office(C), drink(O), 2), t) :- goal(C, drink(O), t), subtask(re_arrange_office(C), drink(O), 2).
goal(subtask(re_arrange_office(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(re_arrange_office(C), walk(O), 3).
goal(subtask(re_arrange_office(C), walk(O), 4), t) :- goal(C, walk(O), t), subtask(re_arrange_office(C), walk(O), 4).
