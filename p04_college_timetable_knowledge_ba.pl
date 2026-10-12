timetable(monday,"9:00",python,ajay,101).
timetable(monday,"10:00",aiml,sanjay,102).
timetable(tuesday,"9:00",english,amit,102).
timetable(tuesday,"11:00",maths,iyer,102).
timetable(wednesday,"9:00",aiml,sanjay,101).
timetable(wednesday,"10:00",english,amit,102).
faculty_sc(Faculty,Day,Time,Subject,Room):-
    timetable(Day,Time,Subject,Faculty,Room).

find_faculty(Subject,Faculty):-     
    timetable(_,_,Subject,Faculty,_).

class_sc(Room,Day,Time,Subject,Faculty):-
    timetable(Day,Time,Subject,Faculty,Room).

