% INST0072 example answer to exercise 7-3

teacher(bill).
teacher(frank).
teacher(sally).
teacher(eric).
teacher(bob).

teaches(bill, java).
teaches(frank, prolog).
teaches(sally, logic).
teaches(eric, xml).
teaches(bill, xml).
teaches(sally, algebra).
teaches(bob, java).
    
takes(john, java).
takes(john, logic).
takes(mary, java).
takes(mary, prolog).
takes(sue, java).
takes(chris, logic).
takes(chris, prolog).
takes(chris, xml).

hardworking(chris).

/* A teacher is happy if he/she is teaching at least one hardworking student. */
happy(Teacher) :- 
    teaches(Teacher, Course),
    takes(Student, Course),
    hardworking(Student).
    
/* A teacher is ecstatic if he/she teaches hardworking, and only hardworking, students. */
ecstatic(Teacher) :- 
    teaches(Teacher, Course),
    takes(Student, Course),
    hardworking(Student),
    \+ teaches_lazy_student(Teacher).

teaches_lazy_student(Teacher) :-
    teaches(Teacher, Course),
    takes(Student, Course),
    \+ hardworking(Student).

/* A teacher is lucky if he/she teaches a course that hardworking, and only hardworking, students are taking. */
lucky(Teacher) :- 
    teaches(Teacher, Course),
    takes(Student, Course),
    hardworking(Student),
    \+ has_lazy_students(Course).

has_lazy_students(Course) :-
    takes(Student, Course),
    \+ hardworking(Student).

/* A teacher is confused if he/she teaches a course that no students are taking. */
confused(Teacher) :- 
    teaches(Teacher, Course),
    \+ takes(Student, Course).

/* A teacher is sad if he/she is not teaching any hardworking students. */
sad(Teacher) :-
    teacher(Teacher),
    \+ happy(Teacher).
