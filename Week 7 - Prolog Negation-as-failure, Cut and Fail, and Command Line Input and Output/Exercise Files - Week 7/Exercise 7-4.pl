% INST0072 modified program for exercise 7-4

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
    \+ male(X).

grandfather(X, Z) :- 
    father(X, Y), father(Y, Z).
grandfather(X, Z) :- 
    father(X, Y), mother(Y, Z).
