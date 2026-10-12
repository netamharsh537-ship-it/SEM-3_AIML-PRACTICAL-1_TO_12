% ---- Facts ----
student(ravi).
student(sita).
student(amit).

course(ai).
course(dbms).
course(os).

likes(ravi, ai).
likes(ravi, dbms).
likes(sita, os).
likes(amit, ai).

% ---- Rule (clause with a body) ----
common_interest(X, Y) :- likes(X, C), likes(Y, C), X \= Y.
