% INST0072 example answer to exercise 7-10

/*
Example query:
is_plan_without_loop(state(hay(eastBank), man(eastBank), sheep(eastBank), wolf(eastBank)), state(hay(westBank), man(westBank), sheep(westBank), wolf(westBank)), Plan).

*/

result(yes, eastBank, westBank).  % taking something from the east bank puts it on the west bank
result(yes, westBank, eastBank).  % taking something from the west bank puts it on the east bank
result(no, eastBank, eastBank).  % not taking something from the east bank leaves it on the east bank
result(no, westBank, westBank).  % not taking something from the west bank leaves it on the west bank

% The action "take_to" takes things with a "yes" argument to position "New_man_position", and
% leaves things with a "no" agrument where they are
can_do(state(hay(Hay_position), man(Man_position), sheep(Sheep_position), wolf(Wolf_position)),  
       take_to(hay(Take_hay_yes_or_no), sheep(Take_sheep_yes_or_no), wolf(Take_Wolf_yes_or_no), New_man_position),
       state(hay(New_hay_position), man(New_man_position), sheep(New_sheep_position), wolf(New_wolf_position))) :-
    result(Take_hay_yes_or_no, Hay_position, New_hay_position),
    result(Take_sheep_yes_or_no, Sheep_position, New_sheep_position),
    result(Take_Wolf_yes_or_no, Wolf_position, New_wolf_position),
    result(yes, Man_position, New_man_position),
    same_side_or_not_taking(Man_position, Hay_position, Take_hay_yes_or_no),
    same_side_or_not_taking(Man_position, Sheep_position, Take_sheep_yes_or_no),
    same_side_or_not_taking(Man_position, Wolf_position, Take_Wolf_yes_or_no),
    \+ too_much_for_boat(Take_hay_yes_or_no, Take_sheep_yes_or_no, Take_Wolf_yes_or_no),
    \+ forbidden_state(hay(New_hay_position), man(New_man_position), sheep(New_sheep_position), wolf(New_wolf_position)).
    
same_side_or_not_taking(Man_and_X_position, Man_and_X_position, yes).
same_side_or_not_taking(Man_position, X_position, no).
    
too_much_for_boat(yes, yes, yes).

forbidden_state(hay(Hay_and_sheep_position), man(Man_position), sheep(Hay_and_sheep_position), wolf(Wolf_position)) :-
    Man_position \== Hay_and_sheep_position.
forbidden_state(hay(Hay_position), man(Man_position), sheep(Sheep_and_wolf_position), wolf(Sheep_and_wolf_position)) :-
    Man_position \== Sheep_and_wolf_position.

    
% GENERAL PLANNING PREDICATES:

is_plan(Goal_state, Goal_state, [], States_so_far).

is_plan(State, Goal_state, [Action|Plan_for_state_after], States_so_far):-
    can_do(State, Action, State_after),
    \+ member(State_after, States_so_far),
    is_plan(State_after, Goal_state, Plan_for_state_after, [State_after|States_so_far]).
    
is_plan_without_loop(State, Goal_state, Plan):-
    is_plan(State, Goal_state, Plan, [State]).
