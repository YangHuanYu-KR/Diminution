#program step(t).

goal(pay_bills(C), t) :- subtask(pay_bills(C)), subtask(pay_bills(C), walk(O1_1), 1), goal(subtask(pay_bills(C), walk(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(pay_bills(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(pay_bills(C), walk(O), 1).
