% marks(Student, Percentage)
marks(ravi,  85).
marks(sita,  60).
marks(amit,  30).
marks(neha,  92).
marks(john,  45).

% ---- Rules ----
grade(Name, topper)  :- marks(Name, M), M >= 75.
grade(Name, average) :- marks(Name, M), M >= 40, M < 75.
grade(Name, fail)    :- marks(Name, M), M < 40.

list_category(Cat) :-
    forall(grade(N, Cat), (write(N), nl)).
