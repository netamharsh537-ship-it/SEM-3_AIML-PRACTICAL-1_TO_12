f(X, Y) :- Y is sin(3*X) + 0.5*X - 0.05*X*X.

% ---------- Plain hill climbing (step 0.1) ----------
hc(X, Best) :-
    Xr is X + 0.1,  Xl is X - 0.1,
    f(X, Fx),  f(Xr, Fr),  f(Xl, Fl),
    (   Fr > Fx, Fr >= Fl -> hc(Xr, Best)
    ;   Fl > Fx           -> hc(Xl, Best)
    ;   Best = X ).

% ---------- Simulated annealing ----------
% anneal(StartX, StartTemp, CoolingRate, MinTemp, BestX)
anneal(X0, T0, Alpha, Tmin, Best) :-
    f(X0, F0),
    anneal_loop(X0, F0, T0, Alpha, Tmin, Best).

anneal_loop(X, _, T, _, Tmin, X) :- T =< Tmin, !.
anneal_loop(X, F, T, Alpha, Tmin, Best) :-
    random(R),  Step is (R - 0.5) * 2,     % random step in [-1, 1]
    Xn is X + Step,
    f(Xn, Fn),
    Delta is Fn - F,
    random(U),
    (   ( Delta > 0 ; U < exp(Delta / T) )
    ->  X1 = Xn, F1 = Fn                   % accept (even if worse)
    ;   X1 = X,  F1 = F ),
    T1 is T * Alpha,
    anneal_loop(X1, F1, T1, Alpha, Tmin, Best).

compare(Start) :-
    hc(Start, XH),  f(XH, FH),
    anneal(Start, 10.0, 0.995, 0.001, XS), f(XS, FS),
    format("Hill Climbing : x = ~4f, f = ~4f~n", [XH, FH]),
    format("Annealing     : x = ~4f, f = ~4f~n", [XS, FS]).
