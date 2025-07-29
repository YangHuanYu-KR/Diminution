% =======================  动 作 原 子 说 明  =========================
%
% 本规划域只允许 4 种动作，以原子 occurs/3 的形式出现：
%
% 1) 机器人移动  move/2
% ------------------------------------------------------------------
% occurs(object(robot,R), move(DX,DY), T).
%   - 时间步 T：机器人 R 从其上一时刻所在格 (X,Y)
%     移动到相邻格 (X+DX, Y+DY)。
%   - 方向增量 (DX,DY) ∈ {(1,0), (-1,0), (0,1), (0,-1)}。
%   - 目标格必须位于网格内部，且
%       * T 时刻无其他机器人占据；
%       * 若 R 正托举货架 S，则目标格也不得有除 S 之外的任何货架。
%   - **防交换约束**：若两台机器人 R1、R2 在 T-1 时刻分别位于
%     (X,Y) 与 (X+DX,Y+DY)，则禁止出现
%       occurs(robot(R1),move(DX,DY),T) 与
%       occurs(robot(R2),move(-DX,-DY),T) 同时为真，
%     以避免机器人在一步内互换位置。
%
% 2) 举起货架  pickup
% ------------------------------------------------------------------
% occurs(object(robot,R), pickup, T).
%   - 时间步 T：机器人 R 在其所在格 (X,Y) 举起一架货架 S。
%   - 先决条件：
%       * (X,Y) 处确有货架 S；
%       * R 尚未托架（一次只能托一架）。
%
% 3) 交付商品  deliver/3
% ------------------------------------------------------------------
% occurs(object(robot,R), deliver(O,I,U), T).
%   - 时间步 T：机器人 R 向订单 O 交付 U 件产品 I。
%   - 先决条件：
%       * R 所在格须为订单 O 指定的配货站位置；
%       * R 正托举的货架上，产品 I 库存 ≥ U；
%       * 订单 O 尚需产品 I ≥ U。
%   - 效果：
%       * 货架库存与订单剩余需求均同步扣减 U，
%         结果不得为负数。
%
% 4) 放下货架  putdown
% ------------------------------------------------------------------
% occurs(object(robot,R), putdown, T).
%   - 时间步 T：机器人 R 将其托举的货架 S 放回所在格 (X,Y)。
%   - 先决条件：
%       * R 确实托举某货架 S；
%       * (X,Y) 不能是 highway（高速通道）格。
%
% -----------------------  优 化 目 标  ------------------------------
% 使计划中的最大时间步数（makespan）最小化，同时满足
% 所有上述动作先决条件、无碰撞/无交换约束以及
% 全部订单需求完全交付。
% ====================================================================



% node 的编号以及其坐标 (构成了规划域的地图)
init(object(node ,1), value(at , (1 ,1))). 
init(object(node ,2), value(at , (2 ,1))). 
init(object(node ,3), value(at , (3 ,1))). 
init(object(node ,4), value(at , (4 ,1))). 
init(object(node ,5), value(at , (1 ,2))). 
init(object(node ,6), value(at , (2 ,2))). 
init(object(node ,7), value(at , (3 ,2))). 
init(object(node ,8), value(at , (4 ,2))). 
init(object(node ,9), value(at , (1 ,3))). 
init(object(node ,10), value(at , (2 ,3))). 
init(object(node ,11), value(at , (3 ,3))). 
init(object(node ,12), value(at , (4 ,3))). 
init(object(node ,13), value(at , (1 ,4))). 
init(object(node ,14), value(at , (2 ,4))). 
init(object(node ,15), value(at , (3 ,4))). 
init(object(node ,16), value(at , (4 ,4))). 

% highway 的编号以及其坐标 (robot 不能在这个位置放下 shelf)
init(object(highway ,4), value(at , (4 ,1))). 
init(object(highway ,8), value(at , (4 ,2))). 
init(object(highway ,12), value(at , (4 ,3))). 
init(object(highway ,13), value(at , (1 ,4))). 
init(object(highway ,14), value(at , (2 ,4))). 
init(object(highway ,15), value(at , (3 ,4))). 
init(object(highway ,16), value(at , (4 ,4))).

% pickingStation 的编号以及其坐标 (每个 order 都会指向一个 pickingStation)
init(object(pickingStation ,1), value(at , (1 ,3))). 
init(object(pickingStation ,2), value(at , (3 ,1))).  

% robot 的编号以及其坐标 (每个 robot 都会在一个 node 上)
init(object(robot ,1), value(at , (4 ,3))). 
init(object(robot ,2), value(at , (2 ,2))).


% shelf 的编号以及其坐标 (robot 可以从其下方穿行或者穿行后举起或者将其放下, 当 robot 已经举起了 shelf 时, 不能在其下方穿行)
init(object(shelf ,1), value(at , (3 ,3))). 
init(object(shelf ,2), value(at , (2 ,1))). 
init(object(shelf ,3), value(at , (2 ,3))). 
init(object(shelf ,4), value(at , (2 ,2))). 
init(object(shelf ,5), value(at , (3 ,2))). 
init(object(shelf ,6), value(at , (1 ,2))). 

% product 的编号以及其数量 (value(on, (shelf_ID, num)))
init(object(product ,1), value(on , (3 ,1))). 
init(object(product ,2), value(on , (4 ,1))). 
init(object(product ,3), value(on , (6 ,4))). 
init(object(product ,4), value(on , (5 ,1))). 
init(object(product ,4), value(on , (6 ,1))). 

% order (订单即目标)
% 每个 order 都会指向一个 pickingStation, 并且包含多个 line (每个 line 包含 product_ID 和其数量)
init(object(order ,1),value(pickingStation ,1)). 
init(object(order ,1),value(line ,(1,1))). 
init(object(order ,1),value(line ,(3,4))). 

init(object(order ,2),value(pickingStation ,2)). 
init(object(order ,2),value(line ,(2,1))). 

init(object(order ,3),value(pickingStation ,2)). 
init(object(order ,3),value(line ,(4,1))).