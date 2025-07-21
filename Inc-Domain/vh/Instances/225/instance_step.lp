#program step(t).

goal(keep_cats_inside_while_door_is_open(C), T0, t, 1) :- subtask(keep_cats_inside_while_door_is_open(C)), subtask(keep_cats_inside_while_door_is_open(C), walk(O1_1), 1), goal(subtask(keep_cats_inside_while_door_is_open(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(keep_cats_inside_while_door_is_open(C), grab(O2_1), 2), goal(subtask(keep_cats_inside_while_door_is_open(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(keep_cats_inside_while_door_is_open(C), walk(O3_1), 3), goal(subtask(keep_cats_inside_while_door_is_open(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(keep_cats_inside_while_door_is_open(C), T3, t, 2) :- subtask(keep_cats_inside_while_door_is_open(C), putback(O4_1, O4_2), 4), goal(subtask(keep_cats_inside_while_door_is_open(C), putback(O4_1, O4_2), 4), T3), T3 <= T4, time(T3), subtask(keep_cats_inside_while_door_is_open(C), walk(O5_1), 5), goal(subtask(keep_cats_inside_while_door_is_open(C), walk(O5_1), 5), T4), T4 <= T5, time(T4), subtask(keep_cats_inside_while_door_is_open(C), open(O6_1), 6), goal(subtask(keep_cats_inside_while_door_is_open(C), open(O6_1), 6), T5), T5 <= t, time(T5).
goal(keep_cats_inside_while_door_is_open(C), T0, t, 3) :- goal(keep_cats_inside_while_door_is_open(C), T0, T2, 1), goal(keep_cats_inside_while_door_is_open(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(keep_cats_inside_while_door_is_open(C), T6, t, 4) :- subtask(keep_cats_inside_while_door_is_open(C), lookat(O7_1), 7), goal(subtask(keep_cats_inside_while_door_is_open(C), lookat(O7_1), 7), T6), T6 <= t, time(T6).
goal(keep_cats_inside_while_door_is_open(C), t) :- goal(keep_cats_inside_while_door_is_open(C), T0, T5, 3), goal(keep_cats_inside_while_door_is_open(C), T6, t, 4), time(T0), time(T5), time(T6), T5 <= T6.

goal(subtask(keep_cats_inside_while_door_is_open(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(keep_cats_inside_while_door_is_open(C), walk(O), 1).
goal(subtask(keep_cats_inside_while_door_is_open(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(keep_cats_inside_while_door_is_open(C), grab(O), 2).
goal(subtask(keep_cats_inside_while_door_is_open(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(keep_cats_inside_while_door_is_open(C), walk(O), 3).
goal(subtask(keep_cats_inside_while_door_is_open(C), putback(O1, O2), 4), t) :- goal(C, putback(O1, O2), t), subtask(keep_cats_inside_while_door_is_open(C), putback(O1, O2), 4).
goal(subtask(keep_cats_inside_while_door_is_open(C), walk(O), 5), t) :- goal(C, walk(O), t), subtask(keep_cats_inside_while_door_is_open(C), walk(O), 5).
goal(subtask(keep_cats_inside_while_door_is_open(C), open(O), 6), t) :- goal(C, open(O), t), subtask(keep_cats_inside_while_door_is_open(C), open(O), 6).
goal(subtask(keep_cats_inside_while_door_is_open(C), lookat(O), 7), t) :- goal(C, lookat(O), t), subtask(keep_cats_inside_while_door_is_open(C), lookat(O), 7).
