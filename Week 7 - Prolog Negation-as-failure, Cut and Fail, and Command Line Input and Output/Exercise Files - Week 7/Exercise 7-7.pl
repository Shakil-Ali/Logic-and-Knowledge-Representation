% INST0072 program for exercise 7-7
a :- 
    b,
    c,
    write('1'),
    fail.
a :-    
    d,
    write('2').

b :- 
    c,
    !,
    d,
    write('3').

c :- 
    write('4'),
    fail.
c :- 
    write('5').

d :- 
    write('6').