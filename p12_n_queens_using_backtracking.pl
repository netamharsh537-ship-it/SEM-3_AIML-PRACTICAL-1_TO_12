% queens(N, Qs): Qs is a list of column positions, one per row
queens(N, Qs) :-
    numlist(1, N, Cols),
    place(Cols, [], Qs).

place([], Qs, Qs).
place(Unplaced, Safe, Qs) :-
    select(Q, Unplaced, Rest),       % try a column (backtracks on failure)
    \+ attack(Q, Safe),              % must not attack any placed queen
    place(Rest, [Q|Safe], Qs).

% Diagonal attack check (columns are unique by construction)
attack(Q, Safe) :- attack(Q, 1, Safe).
attack(X, N, [Y|_])  :- X is Y + N ; X is Y - N.
attack(X, N, [_|Ys]) :- N1 is N + 1, attack(X, N1, Ys).

% ---- Pretty-print the board ----
print_board(Qs) :-
    length(Qs, N),
    forall(member(Q, Qs),
           ( forall(between(1, N, C),
                    ( C =:= Q -> write('Q ') ; write('. ') )),
             nl )).

run(N) :- queens(N, Qs), write(Qs), nl, print_board(Qs).
