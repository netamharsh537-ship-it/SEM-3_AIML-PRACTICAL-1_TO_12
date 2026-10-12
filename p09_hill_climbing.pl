f(X, Y) :- Y is -(X - 3) * (X - 3) + 10.

% hill_climb(CurrentX, BestX)
hill_climb(X, Best) :-
    Xr is X + 1,  Xl is X - 1,
    f(X, Fx),  f(Xr, Fr),  f(Xl, Fl),
    (   Fr > Fx, Fr >= Fl -> hill_climb(Xr, Best)     % move right
    ;   Fl > Fx           -> hill_climb(Xl, Best)     % move left
    ;   Best = X                                      % no better neighbour: peak
    ).

run(Start) :-
    hill_climb(Start, B), f(B, V),
    format("Start = ~w, Best x = ~w, f(x) = ~w~n", [Start, B, V]).
