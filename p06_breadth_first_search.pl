% Undirected graph
edge(a, b).  edge(a, c).
edge(b, d).  edge(c, d).
edge(c, e).  edge(d, f).
edge(e, f).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

% bfs(Start, Goal, Path)
bfs(Start, Goal, Path) :-
    bfs_loop([[Start]], Goal, [Start], RevPath),
    reverse(RevPath, Path).

% Goal reached: head of first path in queue
bfs_loop([[Goal|Rest]|_], Goal, _, [Goal|Rest]) :- !.

% Expand first path in queue
bfs_loop([[N|Rest]|Queue], Goal, Visited, Path) :-
    findall([M, N|Rest],
            (connected(N, M), \+ memberchk(M, Visited)),
            NextPaths),
    findall(M, member([M|_], NextPaths), NewNodes),
    append(Visited, NewNodes, Visited1),
    append(Queue, NextPaths, Queue1),      % FIFO queue => breadth-first
    bfs_loop(Queue1, Goal, Visited1, Path).
