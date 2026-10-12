color(red).
color(green).
color(blue).

regions([wa, nt, sa, q, nsw, v, t]).

adjacent(wa,  nt).   adjacent(wa,  sa).
adjacent(nt,  sa).   adjacent(nt,  q).
adjacent(sa,  q).    adjacent(sa,  nsw).
adjacent(sa,  v).    adjacent(q,   nsw).
adjacent(nsw, v).

% Conflict if a neighbour already has colour C
conflict(R, C, Assigned) :-
    member(R2-C, Assigned),
    ( adjacent(R, R2) ; adjacent(R2, R) ).

% Backtracking assignment
assign([], A, A).
assign([R|Rs], Assigned, Result) :-
    color(C),
    \+ conflict(R, C, Assigned),
    assign(Rs, [R-C|Assigned], Result).

solve(Result) :- regions(Rs), assign(Rs, [], Result).

show :- solve(R), reverse(R, Ordered),
        forall(member(Region-Col, Ordered),
               format("~w -> ~w~n", [Region, Col])).
