% INST0072 program for exercise 7-6

a :- 
    b,
    c,
    write('1').
a :-    
    d,
    write('2').

b :- 
    c,
    d,
    write('3').

c :- 
    write('4').
c :- 
    write('5').

d :- 
    write('6').