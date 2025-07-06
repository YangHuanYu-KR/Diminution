#program step(t).
goal_met(t):- h(out(p1, output1),t), h(out(p2, output2),t), h(out(p3, output2),t), 
              h(has_attr(p1, a_cut),t), h(has_attr(p1, a_drill),t), h(has_attr(p1, a_paint),t).