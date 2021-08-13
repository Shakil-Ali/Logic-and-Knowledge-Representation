father(geoffrey, sylvia).
father(geoffrey, katherine).
father(geoffrey, rob).
father(geoffrey, andrew).
father(rob, rebecca).
father(rob, natascia).
father(andrew, oscar).
father(andrew, spencer).
father(andrew, lucy).
father(steve, bene).
father(antonio, virgilio).
father(antonio, alessandra).
father(antonio, giuseppe).
father(antonio, rosalba).
father(virgilio, barbara).
father(giuseppe, letizia).
father(giuseppe, leonardo).
father(simone, lorenzo).
father(simone, alice).

mother(daphne, sylvia).
mother(daphne, katherine).
mother(daphne, rob).
mother(daphne, andrew).
mother(alessandra, rebecca).
mother(alessandra, natascia).
mother(linda, oscar).
mother(linda, spencer).
mother(linda, lucy).
mother(katherine, bene).
mother(adriana, virgilio).
mother(adriana, alessandra).
mother(adriana, giuseppe).
mother(adriana, rosalba).
mother(fulvia, barbara).
mother(marijke, letizia).
mother(marijke, leonardo).
mother(rosalba, lorenzo).
mother(rosalba, alice).

male(X) :- 
    father(X, Y).
male(oscar).
male(spencer).
male(bene).
male(leonardo).
male(lorenzo).

female(X) :- 
    mother(X, Y).
female(sylvia).
female(rebecca).
female(natascia).
female(lucy).
female(barbara).
female(letizia).
female(alice).

grandfather(X, Z) :- 
    father(X, Y), father(Y, Z).
grandfather(X, Z) :- 
    father(X, Y), mother(Y, Z).
    
parent(X, Y) :-
    father(X, Y).
parent(X, Y) :-
    mother(X, Y).
    
grandmother(X, Z) :- 
    mother(X, Y), parent(Y, Z).

son(X, Y) :-
    parent(Y, X),
    male(X).
    
daughter(X, Y) :-
    parent(Y, X),
    female(X).
    
grandson(X, Y) :-
    grandfather(Y, X),
    male(X).
grandson(X, Y) :-
    grandmother(Y, X),
    male(X).

granddaughter(X, Y) :-
    grandfather(Y, X),
    female(X).
granddaughter(X, Y) :-
    grandmother(Y, X),
    female(X).
    
brother(X, Y) :-
    father(F, X),
    father(F, Y),
    mother(M, X),
    mother(M, Y),
    male(X),
    X \= Y.
    
sister(X, Y) :-
    father(F, X),
    father(F, Y),
    mother(M, X),
    mother(M, Y),
    female(X),
    X \= Y.
    
partner(X, Y) :-
    parent(X, Z),
    parent(Y, Z),
    X \= Y.    
    
aunt(X, Y) :-
    sister(X, Z),
    parent(Z, Y).    
aunt(X, Y) :-
    partner(X, W),
    brother(W, Z),
    parent(Z, Y).
    
uncle(X, Y) :-
    brother(X, Z),
    parent(Z, Y).
uncle(X, Y) :-
    partner(X, W),
    sister(W, Z),
    parent(Z, Y).
    
niece(X, Y) :-
    aunt(Y, X),
    female(X).
niece(X, Y) :-
    uncle(Y, X),
    female(X).
   
nephew(X, Y) :-
    aunt(Y, X),
    male(X).
nephew(X, Y) :-
    uncle(Y, X),
    male(X).
