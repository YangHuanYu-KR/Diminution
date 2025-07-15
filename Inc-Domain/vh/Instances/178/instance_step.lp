#program step(t).

goal(surf_web_for_money_legitimate_making_opportunities(C), T0, t, 1) :- subtask(surf_web_for_money_legitimate_making_opportunities(C)), subtask(surf_web_for_money_legitimate_making_opportunities(C), walk(O1_1), 1), goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), walk(O1_1), 1), T0), T0 <= T1, time(T0), subtask(surf_web_for_money_legitimate_making_opportunities(C), sit(O2_1), 2), goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), sit(O2_1), 2), T1), T1 <= T2, time(T1), subtask(surf_web_for_money_legitimate_making_opportunities(C), open(O3_1), 3), goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), open(O3_1), 3), T2), T2 <= t, time(T2).
goal(surf_web_for_money_legitimate_making_opportunities(C), T3, t, 2) :- subtask(surf_web_for_money_legitimate_making_opportunities(C), touch(O4_1), 4), goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), touch(O4_1), 4), T3), T3 <= t, time(T3).
goal(surf_web_for_money_legitimate_making_opportunities(C), t) :- goal(surf_web_for_money_legitimate_making_opportunities(C), T0, T2, 1), goal(surf_web_for_money_legitimate_making_opportunities(C), T3, t, 2), time(T0), time(T2), time(T3), T2 <= T3.

goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), walk(O), 1), t) :- goal(C, walk(O), t), subtask(surf_web_for_money_legitimate_making_opportunities(C), walk(O), 1).
goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), sit(O), 2), t) :- goal(C, sit(O), t), subtask(surf_web_for_money_legitimate_making_opportunities(C), sit(O), 2).
goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), open(O), 3), t) :- goal(C, open(O), t), subtask(surf_web_for_money_legitimate_making_opportunities(C), open(O), 3).
goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), touch(O), 4), t) :- goal(C, touch(O), t), subtask(surf_web_for_money_legitimate_making_opportunities(C), touch(O), 4).
