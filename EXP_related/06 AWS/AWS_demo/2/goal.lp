#program step(t).

still_needed(t) :- h(object(order, O), value(line, (I, U)), t), 
                   U != 0.
exists_order(t) :- h(object(order, O), value(line, (I, U)), t).

goal_met(t) :- exists_order(t), not still_needed(t).