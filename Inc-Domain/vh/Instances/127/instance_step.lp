#program step(t).

goal(carry_groceries_to_kitchen(C), T0, t, 1) :- subtask(carry_groceries_to_kitchen(C)), subtask(carry_groceries_to_kitchen(C), walk(O1_1), 1), goal(subtask(carry_groceries_to_kitchen(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(carry_groceries_to_kitchen(C), grab(O2_1), 2), goal(subtask(carry_groceries_to_kitchen(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(carry_groceries_to_kitchen(C), walk(O3_1), 3), goal(subtask(carry_groceries_to_kitchen(C), walk(O3_1), 3), T2), T2 <= t, time(T2).
goal(carry_groceries_to_kitchen(C), T3, t, 2) :- subtask(carry_groceries_to_kitchen(C), drop(O4_1), 4), goal(subtask(carry_groceries_to_kitchen(C), drop(O4_1), 4), T3), T3 <= t, time(T3).
goal(carry_groceries_to_kitchen(C), t) :- goal(carry_groceries_to_kitchen(C), T0, T2, 1), goal(carry_groceries_to_kitchen(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(carry_groceries_to_kitchen(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(carry_groceries_to_kitchen(C), walk(O), 1).
goal(subtask(carry_groceries_to_kitchen(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(carry_groceries_to_kitchen(C), grab(O), 2).
goal(subtask(carry_groceries_to_kitchen(C), walk(O), 3), t) :- goal(C, walk(O), t), subtask(carry_groceries_to_kitchen(C), walk(O), 3).
goal(subtask(carry_groceries_to_kitchen(C), drop(O), 4), t) :- goal(C, drop(O), t), subtask(carry_groceries_to_kitchen(C), drop(O), 4).
