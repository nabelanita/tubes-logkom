/* includes */

/* dynamic variables */

/* commands */
help:-
    nl,
    write('██╗░░██╗███████╗██╗░░░░░██████╗░\n'),
    write('██║░░██║██╔════╝██║░░░░░██╔══██╗\n'),
    write('███████║█████╗░░██║░░░░░██████╔╝\n'),
    write('██╔══██║██╔══╝░░██║░░░░░██╔═══╝░\n'),
    write('██║░░██║███████╗███████╗██║░░░░░\n'),
    write('╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░░░░\n'),
    nl,
    write('   Welcome to the help menu!\n'),
    helpChoice, !.

helpChoice:-
    write('       1. How to play\n'),
    write('       2. Story\n'),
    write('       3. Credits\n'),
    write('       4. Exit\n'),
    nl,
    write('Enter your choice: '),
    read(X),
    helpMenu(X), !.

helpMenu(1):-
    write('How to play..\n').

helpMenu(2):-
    write('Storyline..\n').

helpMenu(3):-
    write('Credits..\n').

helpMenu(4):- !.

helpMenu(_):-
    write('Not a valid choice! Choose again\n'), nl,
    helpChoice, !.