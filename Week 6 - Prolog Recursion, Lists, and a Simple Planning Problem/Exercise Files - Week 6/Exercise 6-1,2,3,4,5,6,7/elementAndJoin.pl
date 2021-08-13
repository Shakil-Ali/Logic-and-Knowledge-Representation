/* Rob Miller
   last updated: 30 Jan 2015
*/

/* Example program for INST0072 Logic and Knowledge Representation */

element(X, [X|Y]).
element(X, [Y|Z]) :- 
    element(X,Z).
    
join([], X, X).
join([H|T], X, [H|Y]) :- 
    join(T, X, Y).