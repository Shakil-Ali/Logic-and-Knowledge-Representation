% INST0072 example answer to exercise 7-2

person(dave).
person(pete).
person(sally).
person(eric).
person(mike).
person(john).
person(andy).

likes(dave, pete).
likes(dave, sally).
likes(eric, dave).
likes(mike, pete).

likes(john, X) :-
    person(X),
    \+ likes(dave, X).
    
likes(andy, X) :-
    person(X),
    \+ likes(john, X).