#program step(t).

goal(surf_web_for_money_legitimate_making_opportunities(C), t) :- subtask(surf_web_for_money_legitimate_making_opportunities(C)), subtask(surf_web_for_money_legitimate_making_opportunities(C), cut(O1_1), 1), goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), cut(O1_1), 1), T0), T0 <= t, time(T0).

goal(subtask(surf_web_for_money_legitimate_making_opportunities(C), cut(O), 1), t) :- goal(C, cut(O), t), subtask(surf_web_for_money_legitimate_making_opportunities(C), cut(O), 1).
