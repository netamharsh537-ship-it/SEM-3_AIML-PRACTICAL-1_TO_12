% Graph (edge, cost)
edge(s, a, 1).  edge(s, b, 4).
edge(a, b, 2).  edge(a, c, 5).
edge(b, c, 1).  edge(b, g, 7).
edge(c, g, 3).

neighbor(X, Y) :- edge(X, Y, _).
neighbor(X, Y) :- edge(Y, X, _).

% Heuristic: estimated distance to goal g
h(s, 7).  h(a, 6).  h(b, 3).  h(c, 2).  h(g, 0).

% greedy(Start, Goal, Path)
greedy(Start, Goal, Path) :-
    h(Start, H),
    greedy_loop([H-[Start]], Goal, [Start], RevPath),
    reverse(RevPath, Path).

greedy_loop([_-[Goal|Rest]|_], Goal, _, [Goal|Rest]) :- !.
greedy_loop([_-[N|Rest]|Frontier], Goal, Visited, Path) :-
    findall(Hm-[M, N|Rest],
            (neighbor(N, M), \+ memberchk(M, Visited), h(M, Hm)),
            Children),
    findall(M, member(_-[M|_], Children), New),
    append(Visited, New, Visited1),
    append(Children, Frontier, All),
    keysort(All, Sorted),                   % lowest h first
    greedy_loop(Sorted, Goal, Visited1, Path).
