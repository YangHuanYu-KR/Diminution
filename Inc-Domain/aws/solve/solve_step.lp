#program step(t).

1{occurs(object(robot, R), A, t): action_of(object(robot, R), A)}1 :- init(object(robot, R), _).

h(object(robot, R), value(at, (X+Dx, Y+Dy)), t):- occurs(object(robot, R), action(move, (Dx, Dy)), t),
                                                  h(object(robot, R), value(at, (X, Y)), t-1).

%% 目标 node 不存在 (应该是可以保证当前 node 一定存在的)
:- occurs(object(robot, R), action(move, (Dx, Dy)), t), 
   h(object(robot, R), value(at, (X, Y)), t-1), 
   not init(object(node, _), value(at, (X+Dx, Y+Dy))).

%% 当 robot 在 carries 着 shelf 的时候是不能通过有 shelf 的格子的 (无论目标 shelf 是否被 carry)
:- occurs(object(robot, R1), action(move, (Dx, Dy)), t),
   h(object(robot, R1), value(carries, S1), t-1),
   h(object(robot, R1), value(at, (X, Y)), t-1),
   h(object(shelf, S2), value(at, (X+Dx, Y+Dy)), t-1),
   S1 != S2.

%% 防交换约束：若两台机器人 R1、R2 在 T-1 时刻分别位于 (X,Y) 与 (X+DX,Y+DY)，则禁止出现 occurs(robot(R1),move(DX,DY),T) 与 occurs(robot(R2),move(-DX,-DY),T) 同时为真
:- occurs(object(robot, R1), action(move, (Dx, Dy)), t),
   occurs(object(robot, R2), action(move, (-Dx, -Dy)), t),
   h(object(robot, R1), value(at, (X, Y)), t-1),
   h(object(robot, R2), value(at, (X+Dx, Y+Dy)), t-1),
   h(object(robot, R1), value(at, (X, Y)), t-1),
   h(object(robot, R2), value(at, (X+Dx, Y+Dy)), t-1),
   R1 != R2.

%% 多个机器人时刻同位置约束
:- h(object(robot, R1), value(at, P), t),
   h(object(robot, R2), value(at, P), t),
   R1 != R2.

% **pickup actions**
h(object(robot, R), value(carries, S), t):- occurs(object(robot, R), action(pickup, ()), t),
                                            h(object(shelf,S), value(at, P), t-1),
                                            h(object(robot,R), value(at, P), t-1).

%% 要求 R pickup 时所在位置有 shelf
:- occurs(object(robot, R), action(pickup, ()), t),
   h(object(robot, R), value(at, P), t-1),
   not h(object(shelf, _), value(at, P), t-1).

%% 不能 pickup 一个已经被 pickup 的 shelf (这个应该是可以省略的，因为 move 要求了不许多个 robot 走到一个格子里)
:- occurs(object(robot, R1), action(pickup, ()), t),
   h(object(robot, R2), value(carries, S), t-1).

%% 该 robot 不能已经 pickup 了 shelf (这个应该是可以省略的，因为 move 要求了 robot 根本走不到这个 S 所在的格子)
:- occurs(object(robot, R), action(pickup, ()), t),
   h(object(robot, R), value(carries, S), t-1).

%% 一个 robot 在同一时刻只能 pickup 一个 shelf (可以省略...)
:- occurs(object(robot, R), action(pickup, ()), t),
   h(object(robot, R), value(carries, _), t-1).

% **putdown actions**
% h(object(robot, R), value(at, (X, Y)), t):- occurs(object(robot, R), action(putdown, ()), t),
%                                                 h(object(robot, R), value(at, (X, Y)), t-1).

%% 要 carries 了东西才能 putdown
:- occurs(object(robot, R), action(putdown, ()), t),
   not h(object(robot, R), value(carries, _), t-1).

%% 不能在 highway 上放下 shelf
:- occurs(object(robot, R), action(putdown, ()), t),
   h(object(robot, R), value(at, P), t-1),
   init(object(highway, N), value(at, P)).

%% 不能在 pickingStation 上放下 shelf
:- occurs(object(robot, R), action(putdown, ()), t),
   h(object(robot, R), value(at, P), t-1),
   init(object(pickingStation, PS), value(at, P)).
   

%% 该位置上不能已经有 shelf (可以省略...)
:- occurs(object(robot, R), action(putdown, ()), t),
   h(object(robot, R), value(at, Pos), t-1),
   h(object(robot, R), value(carries, S1), t-1),
   h(object(shelf, S2), value(at, Pos), t-1),
   S1 != S2.


% **deliver actions**
%% deliver 会有两个后效, 一个是让货架上的产品数量减少，一个是让订单的需求减少

h(object(order, O), value(line, (I, Remain-U)), t):- occurs(object(robot,R), action(deliver, (O ,I, U)), t),
                                                        h(object(robot, R), value(carries, S), t-1),
                                                        h(object(order, O), value(line, (I, Remain)), t-1).

h(object(product, I), value(on, (S, Stock-U)), t):- occurs(object(robot,R), action(deliver, (O ,I, U)), t), 
                                                        h(object(robot, R), value(carries, S), t-1),
                                                        h(object(product, I), value(on, (S, Stock)), t-1).

%% R 必须托举着货架
:- occurs(object(robot, R), action(deliver, (_,_,_)), t),
   not h(object(robot, R), value(carries, _), t-1).

%% R 正托举的货架上，且货架上的存在产品 I
:- occurs(object(robot, R), action(deliver,(O, I, _), t)),
   h(object(robot, R), value(carries, S), t-1),
   not init(object(product, I), value(on, (S, _))).

%% R 只能送 O 要求的产品
:- occurs(object(robot, R), action(deliver,(O, I, _), t)),
    not init(object(order, O), value(line, (I, _))).

%% R 所在格须为订单 O 指定的配货站位置
:- occurs(object(robot, R), action(deliver,(O, _, _)), t),
   init(object(order, O), value(pickingStation, PS)),
   init(object(pickingStation, PS), value(at, P)),
   not h(object(robot, R), value(at, P), t-1).

%% R 正托举的货架上产品 I 的数量足够
:- occurs(object(robot, R), action(deliver,(O, I, U)), t),
   h(object(robot, R), value(carries, S), t-1),
   h(object(product, I), value(on, (S, Stock)), t-1),
   Stock < U.

%% 不能多送 (订单的剩余需求不能为负数), 在定义 action_of 时已经粗的限定了 U 的范围
:- occurs(object(robot, R), action(deliver,(O, I, U)), t),
   h(object(order, O), value(line, (I, Remain)), t-1),
   Remain < U.

% Inertial Laws about robot position.
h(object(robot, R), value(at, (X, Y)), t):- h(object(robot, R), value(at, (X, Y)), t-1),
                                                not occurs(object(robot, R), action(move, _), t).

% Inertial Laws about robot carries.
h(object(robot, R), value(carries, S), t):- h(object(robot, R), value(carries, S), t-1), 
                                            not occurs(object(robot, R), action(putdown, ()), t).

% Inertial Laws about shelf position.
h(object(shelf, S), value(at, (X, Y)), t):- h(object(shelf, S), value(at, (X, Y)), t-1), 
                                                not h(object(robot, _), value(carries, S), t).

% h(object(shelf, S), value(at, (X, Y)), t):- h(object(shelf, S), value(at, (X, Y)), t-1), 
%                                                 h(object(robot, R), value(carries, S), t), 
%                                                 not occurs(object(robot, R), action(move, _), t).

% Inertial Laws about product on shelf.
h(object(product, I), value(on, (S, Stock)), t):- h(object(product, I), value(on, (S, Stock)), t-1),
                                                      not h(object(robot, _), value(carries, S), t-1).

h(object(product, I), value(on, (S, Stock)), t):- h(object(product, I), value(on, (S, Stock)), t-1),
                                                      h(object(robot, R), value(carries, S), t-1),
                                                      not occurs(object(robot, R), action(deliver,(_, I, _)), t).

% Inertial Laws about order line.
h(object(order, O), value(line, (I, Remain)), t):- h(object(order, O), value(line, (I, Remain)), t-1),
                                                       not occurs(object(robot, _), action(deliver, (O, I, _)), t).

% Static Causal Law about shelf position.
h(object(shelf, S), value(at, (X, Y)), t):- h(object(robot, R), value(carries, S), t), 
                                                h(object(robot, R), value(at, (X, Y)), t).

still_needed(t) :- h(object(order, O), value(line, (I, U)), t), 
                   U != 0.
exists_order(t) :- h(object(order, O), value(line, (I, U)), t).

goal_met(t) :- exists_order(t), not still_needed(t).
