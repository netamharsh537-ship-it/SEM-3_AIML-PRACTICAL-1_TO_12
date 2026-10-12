% ---- Append ----
my_append([], L, L).
my_append([H|T], L, [H|R]) :- my_append(T, L, R).

% ---- Reverse (accumulator) ----
my_reverse(L, R) :- rev(L, [], R).
rev([], Acc, Acc).
rev([H|T], Acc, R) :- rev(T, [H|Acc], R).

% ---- Member ----
my_member(X, [X|_]).
my_member(X, [_|T]) :- my_member(X, T).

% ---- Length ----
my_length([], 0).
my_length([_|T], N) :- my_length(T, N1), N is N1 + 1.
