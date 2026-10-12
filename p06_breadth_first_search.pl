edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, g).

dfs(Start, Goal, Spath) :-
    dfs_search(Start, Goal, Spath).

dfs_search(Goal, Goal, [Goal]).
dfs_search(Node, Goal, [Node|Path]) :-
    edge(Node, Next),
    dfs_search(Next, Goal, Path).
