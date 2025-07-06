
% -----------------------------------------------------------------------------
% File: MPD_solve.lp
% Description: This ASP program models and solves a Manufacturing Process Design
%              (MPD) problem. It simulates the flow of products through a
%              series of machines, the assignment of attributes to these
%              products, and adherence to various operational constraints and
%              rules. The system evolves over discrete time steps.
% -----------------------------------------------------------------------------

% =============================================================================
% I. DOMAIN DEFINITION: OBJECTS & STATIC PREDICATES
%
% This section defines the fundamental entities (types) and the static
% relationships between them within the manufacturing domain. These elements
% typically form the problem instance.
% =============================================================================

% 1. Object Types:
%   ----------------
%   % is(Entity, type).  % General form for type declaration.
%
%   % machine: Represents a processing or transport unit in the system.
%     % - Core functions: Transport products, assign attributes.
%     % - Declaration: is(M, machine).
%     % - Sub-types (automatically imply 'is(M, machine)'):
%       %   - is(M, input): Designates machine M as an entry point for products.
%       %     % Products typically enter the system via an input machine
%       %     % using the 'enter_time(Product, Machine, Time)' fact.
%       %   - is(M, output): Designates machine M as an exit point for products.
%       %     % Products can be moved out of the system from an output machine
%       %     % using the 'transport_out' action.
%
%   % product: Represents the items being processed and moved through the machines.
%     % - Declaration: is(P, product).
%
%   % attribute: Represents a specific property or feature that can be
%     %            assigned to a product by a capable machine.
%     % - Declaration: is(A, attribute).

% 2. Static Relationships & Properties:
%   -----------------------------------
%   % connected(M1, M2):
%     % - Signifies that machine M1 is directly connected to machine M2,
%     %   allowing product transport from M1 to M2.
%
%   % gives(M, A):
%     % - Indicates that machine M possesses the capability to assign
%     %   attribute A to a product located at it.
%
%   % enter_time(P, M, T):
%     % - A factual predicate stating that product P enters input machine M
%     %   at the beginning of time step T. This initiates the product's presence.

% =============================================================================
% II. DYNAMIC ASPECTS: ACTIONS & FLUENTS
%
% This section describes the actions that can occur in the system and the
% state fluents that change over time as a result of these actions.
% =============================================================================

% 1. Actions:
%   ---------------------------------
%   % occurs(MachineExecutor, ActionTerm, Time). % General form for an action occurrence.
%   % action_of(Machine, ActionTerm).            % Defines possible actions for a machine.
%
%   % Specific Action Terms and their semantics:
%   % - transport(P, M_dest):
%     %   - Executed by: M_src (source machine).
%     %   - Usage: occurs(M_src, transport(P, M_dest), T).
%     %   - Effect: Moves product P from M_src to M_dest.
%     %   - Note: M_src is the machine performing the action.
%
%   % - transport_out(P, M_src):
%     %   - Executed by: M_src (which must be an 'output' machine).
%     %   - Usage: occurs(M_src, transport_out(P, M_src), T).
%     %   - Effect: Product P exits the system from M_src.
%
%   % - add_attribution(P, A):
%     %   - Executed by: M (machine where product P is currently located).
%     %   - Usage: occurs(M, add_attribution(P, A), T).
%     %   - Effect: Product P gains attribute A.
%
%   % - idle:
%     %   - Executed by: Any machine M.
%     %   - Usage: occurs(M, idle, T).
%     %   - Effect: Machine M performs no product-altering operation.

% 2. State Fluents (Tracked over time):
%   ------------------------------------
%   % h(FluentTerm, Time). % General form for a fluent holding at a time.
%
%   % - at(P, M): Product P is located at machine M.
%   % - has_attr(P, A): Product P possesses attribute A. (Persistent once acquired)
%   % - out(P, M_exit): Product P has exited the system via M_exit. (Persistent once exited)
%   % - moved(P, M_origin): Auxiliary fluent; Product P was moved from M_origin during time T.
%     %   Used to manage the inertia of the 'at(P,M)' fluent.

% =============================================================================
% III. PROGRAM LOGIC & DIRECTIVES
% =============================================================================

% 用 incmode 求解可以保证解的 “最短性”。
#include <incmode>. 

#const imax = 200.
% #const imin = 1.

#program base. % 定义基础部分的规则和事实，这些通常不随时间变化。
is(M,machine) :- is(M,input). % 规则：如果实体 M 被定义为输入(input)，那么它同时也是一个机器(machine)。
is(M,machine) :- is(M,output). % 规则：如果实体 M 被定义为输出(output)，那么它同时也是一个机器(machine)。

action_of(M1, transport(P, M2)) :- is(M1,machine), is(M2,machine), M1 !=M2, is(P, product). % 规则：定义机器M1的一个可能动作是运输产品P到另一个机器M2，前提是M1和M2是不同的机器，且P是产品。
action_of(M1, transport_out(P,M1)) :- is(M1,machine), is(M1,output), is(P, product). % 规则：定义机器M1的一个可能动作是将产品P从M1运输出系统，前提是M1是机器，P是产品。
action_of(M1, add_attribution(P, A)) :-  is(M1,machine), is(P, product), is(A, attribute). % 规则：定义机器M1的一个可能动作是在M1上为产品P添加属性A，前提是M1是机器，P是产品，A是属性。
action_of(M1, idle) :- is(M1, machine). % 规则：定义机器M1的一个可能动作是空闲(idle)。


#program step(t). % 程序块：定义随时间步t演化的规则。
h(at(P, M), t) :- enter_time(P, M, t), is(P, product), is(M,machine), is(M,input). % 规则：在时间步t，如果产品P在时间t通过 enter_time 进入输入机器M，则 fluent h(at(P,M),t) 为真，表示产品P在时间t位于机器M。
:- h(at(P1,M),t), h(at(P2,M),t), P1 != P2. % 约束：在任何时间t，一个机器M上不能同时存在两个不同的产品P1和P2。
1{occurs(M, A, t): action_of(M, A)}1 :- is(M, machine). % 选择规则：对于每一个机器M，在时间步t，必须且仅发生(occurs)一个由 action_of(M,A) 定义的动作A。

h(at(P, M2),t):- occurs(M1, transport(P, M2),t). % 规则（动作效应）：如果在时间t，机器M1执行了将产品P运输到机器M2的动作，则在时间t，产品P位于机器M2。
h(moved(P,M1),t):- occurs(M1, transport(P, M2),t). % 规则（动作效应）：如果在时间t，机器M1执行了将产品P运输到机器M2的动作，则在时间t，产品P从机器M1移开(moved)。
:- occurs(M1, transport(P, M2),t), M1 = M2. % 约束（动作前提）：运输动作的目标机器M2不能是源机器M1本身。
:- occurs(M1, transport(P, M2),t), not h(at(P, M1),t-1). % 约束（动作前提）：若要在时间t从机器M1运输产品P，则产品P必须在上一时间步(t-1)位于机器M1。
:- occurs(M1, transport(P, M2),t), not connected(M1, M2). % 约束（动作前提）：若要在时间t从机器M1运输产品P到机器M2，则M1和M2必须是相连的(connected)。
:- occurs(M1, transport(P, M2),t), h(out(P, _), t-1). % 约束（动作前提）：如果产品P在上一时间步(t-1)已经被运出(out)，则在时间t不能再对其执行运输动作。

% "out" 之后就不会停留在流水线上 (这是一个说明性注释，表明产品运出后的状态)
h(out(P,M1),t):- occurs(M1, transport_out(P, M1),t). % 规则（动作效应）：如果在时间t，机器M1执行了将产品P从M1运输出去的动作，则在时间t，产品P从M1运出(out)。
h(moved(P,M1),t):- occurs(M1, transport_out(P, M1),t). % 规则（动作效应）：如果在时间t，机器M1执行了将产品P从M1运输出去的动作，则在时间t，产品P从机器M1移开(moved)。
:- occurs(M1, transport_out(P, M1),t), not h(at(P,M1),t-1). % 约束（动作前提）：若要在时间t从机器M1运出产品P，则产品P必须在上一时间步(t-1)位于机器M1。
:- occurs(M1, transport_out(P, M1),t), not is(M1,output). % 约束（动作前提）：若要从机器M1运出产品P，则机器M1必须是一个输出(output)类型的机器。
:- occurs(M1, transport_out(P, M1),t), h(out(P, _), t-1). % 约束（动作前提）：如果产品P在上一时间步(t-1)已经被运出(out)，则在时间t不能再对其执行运输出去的动作。

% 对产品做操作,不允许对一个产品重复操作 (这是一个说明性注释，关于属性添加的限制)
h(has_attr(P, A),t):- occurs(M, add_attribution(P, A),t). % 规则（动作效应）：如果在时间t，机器M执行了为产品P添加属性A的动作，则在时间t，产品P拥有属性A (has_attr)。
:- occurs(M, add_attribution(P, A),t), not h(at(P, M), t-1). % 约束（动作前提）：若要在时间t在机器M上为产品P添加属性A，则产品P必须在上一时间步(t-1)位于机器M。
:- occurs(M, add_attribution(P, A),t), not gives(M, A). % 约束（动作前提）：若要在时间t在机器M上为产品P添加属性A，则机器M必须能够赋予(gives)该属性A。
:- occurs(M, add_attribution(P, A),t), h(has_attr(P, A), t-1). % 约束（动作前提）：如果产品P在上一时间步(t-1)已经拥有属性A，则在时间t不能再次为P添加相同的属性A。
:- occurs(M, add_attribution(P, A),t), h(out(P, _), t-1). % 约束（动作前提）：如果产品P在上一时间步(t-1)已经被运出(out)，则在时间t不能再为其添加属性。

% idle 没有前效也没有后效 (这是一个说明性注释，指明idle动作不改变状态)

% out 以及 has_attr 的状态是可持续的，不会被撤回 (这是一个说明性注释，关于 fluent 的持久性)
h(out(P,M),t) :- h(out(P,M),t-1), t>0. % 规则（惯性）：如果产品P在上一时间步(t-1)已从机器M运出(out)，并且时间t大于0，则在时间t它仍然保持运出状态。
h(has_attr(P, A), t) :- h(has_attr(P, A), t-1), t>0. % 规则（惯性）：如果产品P在上一时间步(t-1)已拥有属性A (has_attr)，并且时间t大于0，则在时间t它仍然拥有该属性。
h(at(P, M),t) :- h(at(P, M),t-1), not h(moved(P,M), t). % 规则（惯性）：如果产品P在上一时间步(t-1)位于机器M (at)，并且在时间t没有从机器M移开(moved)，则在时间t它仍然位于机器M。

#program check(t). % 程序块：定义检查程序，通常用于在特定时间步（如imax）验证目标是否达成。
:- query(t), not goal_met(t). % 约束：如果在时间t存在查询(query(t))，但目标(goal_met(t))未被满足，则这是一个矛盾，表明当前解不符合目标。
