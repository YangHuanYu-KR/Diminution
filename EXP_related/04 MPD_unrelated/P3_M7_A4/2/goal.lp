#program step(t).
goal_met(t):- h(out(p1,output2),t), h(out(p2,output2),t), h(out(p3,output2),t), h(has_attr(p1,a2),t), h(has_attr(p1,a3),t), h(has_attr(p1,a4),t), h(has_attr(p2,a1),t), h(has_attr(p3,a1),t), h(has_attr(p3,a3),t), h(has_attr(p3,a4),t).
