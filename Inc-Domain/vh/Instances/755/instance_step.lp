#program step(t).

goal(add_paper_to_printer(C), T0, t, 1) :- subtask(add_paper_to_printer(C)), subtask(add_paper_to_printer(C), walk(O1_1), 1), goal(subtask(add_paper_to_printer(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(add_paper_to_printer(C), grab(O2_1), 2), goal(subtask(add_paper_to_printer(C), grab(O2_1), 2), T1), T1 <= T2, time(T1), subtask(add_paper_to_printer(C), find(O3_1), 3), goal(subtask(add_paper_to_printer(C), find(O3_1), 3), T2), T2 <= t, time(T2).
goal(add_paper_to_printer(C), T3, t, 2) :- subtask(add_paper_to_printer(C), open(O4_1), 4), goal(subtask(add_paper_to_printer(C), open(O4_1), 4), T3), T3 <= T4, time(T3), subtask(add_paper_to_printer(C), close(O5_1), 5), goal(subtask(add_paper_to_printer(C), close(O5_1), 5), T4), T4 <= T5, time(T4), subtask(add_paper_to_printer(C), find(O6_1), 6), goal(subtask(add_paper_to_printer(C), find(O6_1), 6), T5), T5 <= t, time(T5).
goal(add_paper_to_printer(C), T0, t, 3) :- goal(add_paper_to_printer(C), T0, T2, 1), goal(add_paper_to_printer(C), T3, T5, 2), time(T0), time(T2), time(T3), T2 <= T3, time(T5), T3 <= t.
goal(add_paper_to_printer(C), T6, t, 4) :- subtask(add_paper_to_printer(C), putin(O7_1, O7_2), 7), goal(subtask(add_paper_to_printer(C), putin(O7_1, O7_2), 7), T6), T6 <= T7, time(T6), subtask(add_paper_to_printer(C), putback(O8_1, O8_2), 8), goal(subtask(add_paper_to_printer(C), putback(O8_1, O8_2), 8), T7), T7 <= T8, time(T7), subtask(add_paper_to_printer(C), switchon(O9_1), 9), goal(subtask(add_paper_to_printer(C), switchon(O9_1), 9), T8), T8 <= t, time(T8).
goal(add_paper_to_printer(C), T0, t, 5) :- goal(add_paper_to_printer(C), T0, T5, 3), goal(add_paper_to_printer(C), T6, T8, 4), time(T0), time(T5), time(T6), T5 <= T6, time(T8), T6 <= t.
goal(add_paper_to_printer(C), T9, t, 6) :- subtask(add_paper_to_printer(C), switchoff(O10_1), 10), goal(subtask(add_paper_to_printer(C), switchoff(O10_1), 10), T9), T9 <= T10, time(T9), subtask(add_paper_to_printer(C), plugin(O11_1), 11), goal(subtask(add_paper_to_printer(C), plugin(O11_1), 11), T10), T10 <= T11, time(T10), subtask(add_paper_to_printer(C), plugout(O12_1), 12), goal(subtask(add_paper_to_printer(C), plugout(O12_1), 12), T11), T11 <= t, time(T11).
goal(add_paper_to_printer(C), T0, t, 7) :- goal(add_paper_to_printer(C), T0, T8, 5), goal(add_paper_to_printer(C), T9, T11, 6), time(T0), time(T8), time(T9), T8 <= T9, time(T11), T9 <= t.
goal(add_paper_to_printer(C), T12, t, 8) :- subtask(add_paper_to_printer(C), wash(O13_1), 13), goal(subtask(add_paper_to_printer(C), wash(O13_1), 13), T12), T12 <= T13, time(T12), subtask(add_paper_to_printer(C), cut(O14_1), 14), goal(subtask(add_paper_to_printer(C), cut(O14_1), 14), T13), T13 <= T14, time(T13), subtask(add_paper_to_printer(C), eat(O15_1), 15), goal(subtask(add_paper_to_printer(C), eat(O15_1), 15), T14), T14 <= t, time(T14).
goal(add_paper_to_printer(C), t) :- goal(add_paper_to_printer(C), T0, T11, 7), goal(add_paper_to_printer(C), T12, t, 8), time(T0), time(T11), time(T12), T11 <= T12.

goal(subtask(add_paper_to_printer(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(add_paper_to_printer(C), walk(O), 1).
goal(subtask(add_paper_to_printer(C), grab(O), 2), t) :- goal(C, grab(O), t), subtask(add_paper_to_printer(C), grab(O), 2).
goal(subtask(add_paper_to_printer(C), find(O), 3), t) :- goal(C, find(O), t), subtask(add_paper_to_printer(C), find(O), 3).
goal(subtask(add_paper_to_printer(C), open(O), 4), t) :- goal(C, open(O), t), subtask(add_paper_to_printer(C), open(O), 4).
goal(subtask(add_paper_to_printer(C), close(O), 5), t) :- goal(C, close(O), t), subtask(add_paper_to_printer(C), close(O), 5).
goal(subtask(add_paper_to_printer(C), find(O), 6), t) :- goal(C, find(O), t), subtask(add_paper_to_printer(C), find(O), 6).
goal(subtask(add_paper_to_printer(C), putin(O1, O2), 7), t) :- goal(C, putin(O1, O2), t), subtask(add_paper_to_printer(C), putin(O1, O2), 7).
goal(subtask(add_paper_to_printer(C), putback(O1, O2), 8), t) :- goal(C, putback(O1, O2), t), subtask(add_paper_to_printer(C), putback(O1, O2), 8).
goal(subtask(add_paper_to_printer(C), switchon(O), 9), t) :- goal(C, switchon(O), t), subtask(add_paper_to_printer(C), switchon(O), 9).
goal(subtask(add_paper_to_printer(C), switchoff(O), 10), t) :- goal(C, switchoff(O), t), subtask(add_paper_to_printer(C), switchoff(O), 10).
goal(subtask(add_paper_to_printer(C), plugin(O), 11), t) :- goal(C, plugin(O), t), subtask(add_paper_to_printer(C), plugin(O), 11).
goal(subtask(add_paper_to_printer(C), plugout(O), 12), t) :- goal(C, plugout(O), t), subtask(add_paper_to_printer(C), plugout(O), 12).
goal(subtask(add_paper_to_printer(C), wash(O), 13), t) :- goal(C, wash(O), t), subtask(add_paper_to_printer(C), wash(O), 13).
goal(subtask(add_paper_to_printer(C), cut(O), 14), t) :- goal(C, cut(O), t), subtask(add_paper_to_printer(C), cut(O), 14).
goal(subtask(add_paper_to_printer(C), eat(O), 15), t) :- goal(C, eat(O), t), subtask(add_paper_to_printer(C), eat(O), 15).
