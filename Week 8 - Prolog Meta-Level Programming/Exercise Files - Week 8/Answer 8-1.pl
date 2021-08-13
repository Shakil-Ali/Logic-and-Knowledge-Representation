% INST0072 example answer to exercise 8-1

:- dynamic selfDelete/0.

selfDelete :-
    retract((selfDelete :- Body)),
    write('program deleted!\n'),
    tell('answer5_1.pl'), 
    listing(selfDelete), 
    told.
