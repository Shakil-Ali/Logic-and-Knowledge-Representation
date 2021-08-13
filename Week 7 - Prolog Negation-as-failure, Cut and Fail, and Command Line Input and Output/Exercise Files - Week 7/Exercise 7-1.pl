likes(dave, pete).
likes(dave, sally).
likes(eric, dave).
likes(mike, pete).

likes(john, X) :-
    \+ likes(dave, X).
    
likes(andy, X) :-
    \+ likes(john, X).