% ---- Basic arithmetic ----
add(X, Y, Z) :- Z is X + Y.
sub(X, Y, Z) :- Z is X - Y.
mul(X, Y, Z) :- Z is X * Y.
div(X, Y, Z) :- Y =\= 0, Z is X / Y.

% ---- Factorial ----
fact(0, 1).
fact(N, F) :- N > 0, N1 is N - 1, fact(N1, F1), F is N * F1.

% ---- Fibonacci ----
fib(0, 0).
fib(1, 1).
fib(N, F) :- N > 1, N1 is N - 1, N2 is N - 2,
             fib(N1, F1), fib(N2, F2), F is F1 + F2.

% ---- Print first N Fibonacci numbers ----
fib_series(N) :- N1 is N - 1, forall(between(0, N1, I), (fib(I, F), write(F), write(' '))), nl.
