#program step(t).

goal(write_book(C), T0, t, 1) :- subtask(write_book(C)), subtask(write_book(C), walk(O1_1), 1), goal(subtask(write_book(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(write_book(C), sit(O2_1), 2), goal(subtask(write_book(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(write_book(C), lie(O3_1), 3), goal(subtask(write_book(C), lie(O3_1), 3), T2), T2 <= t, time(T2).
goal(write_book(C), T3, t, 2) :- subtask(write_book(C), open(O4_1), 4), goal(subtask(write_book(C), open(O4_1), 4), T3), T3 <= t, time(T3).
goal(write_book(C), t) :- goal(write_book(C), T0, T2, 1), goal(write_book(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(write_book(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(write_book(C), walk(O), 1).
goal(subtask(write_book(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(write_book(C), sit(O), 2).
goal(subtask(write_book(C), lie(O), 3), t) :- goal(C, lie(O), t), subtask(write_book(C), lie(O), 3).
goal(subtask(write_book(C), open(O), 4), t) :- goal(C, open(O), t), subtask(write_book(C), open(O), 4).
