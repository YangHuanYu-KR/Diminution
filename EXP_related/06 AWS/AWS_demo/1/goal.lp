%  clingo .\logs\AWS_demo\1.lp .\checker_a\checker.lp .\checker_a\show.lp .\AWS_demo\2\instance.lp

#program step(t).

still_needed(t) :- h(object(order, O), value(line, (I, U)), t), 
                   U != 0.

goal_met(t) :- not still_needed(t).