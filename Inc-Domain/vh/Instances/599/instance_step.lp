#program step(t).

goal(dry_soap_bottles(C), t) :- subtask(dry_soap_bottles(C)), subtask(dry_soap_bottles(C), walk(O1_1), 1), goal(subtask(dry_soap_bottles(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(dry_soap_bottles(C), lookat(O2_1), 2), goal(subtask(dry_soap_bottles(C), lookat(O2_1), 2), T1), T1 <= t, time(T1).

goal(subtask(dry_soap_bottles(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(dry_soap_bottles(C), walk(O), 1).
goal(subtask(dry_soap_bottles(C), lookat(O), 2), t) :- goal(C, lookat(O), t), subtask(dry_soap_bottles(C), lookat(O), 2).
