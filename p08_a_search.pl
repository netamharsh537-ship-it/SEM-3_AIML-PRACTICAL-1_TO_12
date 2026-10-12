% Graph (edge, cost)
edge(s, a, 1).  edge(s, b, 4).
edge(a, b, 2).  edge(a, c, 5).
edge(b, c, 1).  edge(b, g, 7).
edge(c, g, 3).

neighbor(X, Y, C) :- edge(X, Y, C).
neighbor(X, Y, C) :- edge(Y, X, C).

% Admissible heuristic h(Node, EstimatedCostToGoal)
h(s, 7).  h(a, 6).  h(b, 3).  h(c, 2).  h(g, 0).

% astar(Start, Goal, Path, TotalCost)
astar(Start, Goal, Path, Cost) :-
    h(Start, H),
    astar_loop([H-0-[Start]], Goal, [], RevPath, Cost),
    reverse(RevPath, Path).

% Goal reached
astar_loop([_-G-[Goal|Rest]|_], Goal, _, [Goal|Rest], G) :- !.

% Skip nodes already expanded
astar_loop([_-_-[N|_]|Frontier], Goal, Closed, Path, Cost) :-
    memberchk(N, Closed), !,
    astar_loop(Frontier, Goal, Closed, Path, Cost).

% Expand node
astar_loop([_-G-[N|Rest]|Frontier], Goal, Closed, Path, Cost) :-
    findall(F2-G2-[M, N|Rest],
            ( neighbor(N, M, C),
              \+ memberchk(M, Closed),
              G2 is G + C,
              h(M, H2),
              F2 is G2 + H2 ),
            Children),
    append(Frontier, Children, All),
    keysort(All, Sorted),                   % lowest f first
    astar_loop(Sorted, Goal, [N|Closed], Path, Cost).
