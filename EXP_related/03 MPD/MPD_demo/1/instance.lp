#program base.
%============================
% Instance Demo (instance.lp)
%============================

%----------------------------
% 对象声明（使用 is/2 格式）
%----------------------------
% Machines
is(input1,   machine).
is(input2,   machine).
is(m1,       machine).
is(m2,       machine).
is(m3,       machine).
is(m4,       machine).
is(output1,  machine).
is(output2,  machine).

% Products
is(p1,       product).
is(p2,       product).
is(p3,       product).

% Attributes
is(a_cut,       attribute).
is(a_drill,     attribute).
is(a_paint,     attribute).

%----------------------------
% 结构关系
%----------------------------
% 输入/输出设备标记
is(input1,  input).
is(input2,  input).
is(output1, output).
is(output2, output).

% 机器连通关系
connected(input1, m1).
connected(input1, m2).
connected(input2, m2).
connected(m1,      m3).
connected(m3,      m1).
connected(m2,      m3).
connected(m2,      m4).
connected(m3,      m4).
connected(m1,      m4).
connected(m4,      output1).
connected(m3,      output2).

% connected(X,Y) :- connected(Y,X). % 反向连通关系（可选，通常用于双向连通性）

% 哪些机器可以赋予哪些属性
gives(m1, a_cut).
gives(m2, a_drill).
gives(m3, a_paint).

%----------------------------
% 产品进入流水线时间
%----------------------------
% enter_time(P, T) 表示产品 P 在时刻 T 进入其初始位置
enter_time(p1, input1, 1).
enter_time(p2, input2, 2).
enter_time(p3, input1, 3).