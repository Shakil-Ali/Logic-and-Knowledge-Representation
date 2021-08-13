% INST0072 example answer to exercise 7-8

/*
Example queries:
is_plan_without_loop(state(atDoor, onFloor, atWindow, hasNot), state(_, _, _, has), Plan).
is_plan_without_loop(state(atWindow, onBox, atWindow, hasNot), state(_, _, _, has), Plan).


*/

place(atWindow).
place(middle).
place(atDoor).
    
can_do(state(middle, onBox, middle, hasNot),  
       grab,
       state(middle, onBox, middle, has)).

can_do(state(Position, onFloor, Position, X),  
       climbOn,
       state(Position, onBox, Position, X)) :-
    place(Position).

can_do(state(Position_before, onFloor, Position_before, X),  
       push(Position_before, Position_after),
       state(Position_after, onFloor, Position_after, X)) :-
    place(Position_before),
    place(Position_after),
    Position_before \== Position_after.

can_do(state(Position_before, onFloor, X, Y),  
       walk(Position_before, Position_after),
       state(Position_after, onFloor, X, Y)) :-
    place(Position_before),
    place(Position_after),
    Position_before \== Position_after.

can_do(state(Position, onBox, Position, X),  
       jumpOff,
       state(Position, onFloor, Position, X)) :-
    place(Position).

is_plan(Goal_state, Goal_state, [], States_so_far).

is_plan(State, Goal_state, [Action|Plan_for_state_after], States_so_far):-
    can_do(State, Action, State_after),
    \+ member(State_after, States_so_far),
    is_plan(State_after, Goal_state, Plan_for_state_after, [State_after|States_so_far]).
    
is_plan_without_loop(State, Goal_state, Plan):-
    is_plan(State, Goal_state, Plan, [State]).
