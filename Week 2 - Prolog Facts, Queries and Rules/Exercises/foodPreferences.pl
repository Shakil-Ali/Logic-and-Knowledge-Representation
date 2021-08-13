/* Rob Miller
   last updated: 30 Jan 2015
*/

/* Example program for INST0072 Logic and Knowledge Representation */

likes(john, big_mac).     /* comments in Prolog programs are    */
likes(mary, big_mac).     /* written between backslash and star */
likes(mary, ice_cream).   /* symbols like this.                 */
likes(sue, apple_pie).
likes(sue, ice_cream).    % Single-line comments can also start  
likes(chris, milkshake).  % with a percentage sign.

% (1) Rob likes food that both John and Mary like.

likes(rob, X) :- 
    likes(john, X),
    likes(mary, X).

likes(antonis, X) :- 
    likes(sue, X).


% (2) Antonis likes food that either Sue likes or Chris likes.

likes(antonis, X) :- 
    likes(chris, X).

