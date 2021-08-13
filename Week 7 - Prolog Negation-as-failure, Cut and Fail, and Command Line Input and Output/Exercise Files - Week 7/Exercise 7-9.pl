% INST0072 example answer to exercise 7-9

go :-
    collect_user_input(X, a),
    write('Thankyou!\n').
    
collect_user_input(User_input, Correct_input) :-
    write('Type in "'),
    write(Correct_input),
    write('" followed by a full stop and RETURN: '),
    read(Possible_input),
    check_user_input(Possible_input, User_input, Correct_input).
    
check_user_input(Input, Input, Input).

check_user_input(Possible_input, User_input, Correct_input) :-
    Possible_input \== Correct_input,
    write('Incorrect input!\n'),
    collect_user_input(User_input, Correct_input).