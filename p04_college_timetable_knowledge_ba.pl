% teaches(Faculty, Subject)
teaches(dr_sharma, ai).
teaches(dr_patil,  dbms).
teaches(dr_khan,   os).
teaches(dr_sharma, ml).

% room(Subject, Classroom)
room(ai,   r101).
room(dbms, r102).
room(os,   r103).
room(ml,   r101).

% slot(Subject, Day, Time)
slot(ai,   monday,    '9:00').
slot(dbms, monday,    '10:00').
slot(os,   tuesday,   '9:00').
slot(ml,   wednesday, '11:00').

% ---- Rules ----
faculty_room(F, R)     :- teaches(F, S), room(S, R).
faculty_schedule(F, S, D, T) :- teaches(F, S), slot(S, D, T).
day_subjects(D, S)     :- slot(S, D, _).
clash(S1, S2) :- slot(S1, D, T), slot(S2, D, T), S1 \= S2.
