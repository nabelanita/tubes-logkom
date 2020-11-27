/* includes */

/* move commands */
w :- 
    opened(_),
    started(_),
    up, !.
w :-
    opened(_),
	write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'), !.
w :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n'), !.
a :- 
    opened(_),
    started(_),
    left, !.
a :-
    opened(_),
	write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'), !.
a :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n'), !.
s :- 
    opened(_),
    started(_),
    down, !.
s :-
    opened(_),
	write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'), !.
s :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n'), !.
d :- 
    opened(_),
    started(_),
    right, !.
d :-
    opened(_),
	write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'), !.
d :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n'), !.

/* change player position */
/* UP */
up :- 
    inBattle(0),
    playerPos(_,Y), 
    Y =:= 1, nl, 
    write('You just hit a wall!\n'), nl, !.
/* up :- 
    playerPos(7,4), 
    nl, 
    write('You just hit a wall!\n'), nl, !.
up :- 
    playerPos(9,4), 
    nl, 
    write('You just hit a wall!\n'), nl, !.
up :- 
    playerPos(8,6), 
    nl, 
    write('You just hit a wall!\n'), nl, !. */
up :- 
    inBattle(0),
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
up :- 
    inBattle(0),
    playerPos(X1,Y1), 
    questPos(X2,Y2),
    X1 is X2, 
    Y1 is Y2 + 1,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
up :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    gateCLI,
    read(A),
    enterGateUpper(A), !.
up :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    gateCLI,
    read(A),
    enterGateLower(A), !.
up :- 
    inBattle(0),
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.
up :-
    inBattle(1),nl,
    write('    █░█░█ █░█ █▀▀ █▀█ █▀▀   ▄▀█ █▀█ █▀▀   █▄█ █▀█ █░█   █▀▀ █▀█ █ █▄░█ █▀▀ ▀█\n'),
    write('    ▀▄▀▄▀ █▀█ ██▄ █▀▄ ██▄   █▀█ █▀▄ ██▄   ░█░ █▄█ █▄█   █▄█ █▄█ █ █░▀█ █▄█ ░▄\n'),!.

up :-
    inBattle(0),
    write('You moved north!\n'), 
    retract(playerPos(X,Y)), 
    Y > 1, 
    Y1 is Y-1, nl, 
    asserta(playerPos(X,Y1)), 
    randomEnemy,
    !.


/* DOWN */
down :- 
    inBattle(0),
    playerPos(_,Y), 
    Y =:= 10, nl, 
    write('You just hit a wall!\n'), nl, !.
/* down :- 
    playerPos(7,2), nl, 
    write('You just hit a wall!\n'), nl, !.
down :- 
    playerPos(8,2), nl, 
    write('You just hit a wall!\n'), nl, !.
down :- 
    playerPos(9,2), nl, 
    write('You just hit a wall!\n'), nl, !. */
down :- 
    inBattle(0),
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
down :- 
    inBattle(0),
    playerPos(X1,Y1), 
    questPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
down :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    gateCLI,
    read(A),
    enterGateUpper(A), !.
down :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    gateCLI,
    read(A),
    enterGateLower(A), !.

down :- 
    inBattle(0),
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.

down :-
    inBattle(1),nl,
    write('    █░█░█ █░█ █▀▀ █▀█ █▀▀   ▄▀█ █▀█ █▀▀   █▄█ █▀█ █░█   █▀▀ █▀█ █ █▄░█ █▀▀ ▀█\n'),
    write('    ▀▄▀▄▀ █▀█ ██▄ █▀▄ ██▄   █▀█ █▀▄ ██▄   ░█░ █▄█ █▄█   █▄█ █▄█ █ █░▀█ █▄█ ░▄\n'),!.

down :-
    inBattle(0),
    write('You moved south!\n'), 
    retract(playerPos(X,Y)), 
    Y < 10, 
    Y1 is Y+1, nl, 
    asserta(playerPos(X,Y1)), 
    randomEnemy,
    !.


/* RIGHT */
right :- 
    inBattle(0),
    playerPos(X,_), 
    X =:= 10, nl, 
    write('You just hit a wall!\n'),nl,!.
/* right :- 
    playerPos(6,3), nl, 
    write('You just hit a wall!\n'), nl, !.
right :- 
    playerPos(7,4), nl, 
    write('You just hit a wall!\n'), nl, !.
right :- 
    playerPos(7,5), nl, 
    write('You just hit a wall!\n'), nl, !. */
right :- 
    inBattle(0),
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
right :- 
    inBattle(0),
    playerPos(X1,Y1), 
    questPos(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
right :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    gateCLI,
    read(A),
    enterGateUpper(A), !.
right :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    gateCLI,
    read(A),
    enterGateLower(A), !.
right :- 
    inBattle(0),
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.
right :-
    inBattle(1),nl,
    write('    █░█░█ █░█ █▀▀ █▀█ █▀▀   ▄▀█ █▀█ █▀▀   █▄█ █▀█ █░█   █▀▀ █▀█ █ █▄░█ █▀▀ ▀█\n'),
    write('    ▀▄▀▄▀ █▀█ ██▄ █▀▄ ██▄   █▀█ █▀▄ ██▄   ░█░ █▄█ █▄█   █▄█ █▄█ █ █░▀█ █▄█ ░▄\n'),!.

right :-
    inBattle(0),
    write('You moved east!\n'), 
    retract(playerPos(X,Y)), 
    X < 10, 
    X1 is X+1, nl, 
    asserta(playerPos(X1,Y)), 
    randomEnemy,
    !.



/* LEFT */
left :- 
    inBattle(0),
    playerPos(X,_), 
    X =:= 1, nl, 
    write('You just hit a wall!'), nl,!.
/* left :- 
    playerPos(10,3), nl, 
    write('You just hit a wall!\n'), nl, !.
left :- 
    playerPos(9,4), nl, 
    write('You just hit a wall!\n'), nl, !.
left :- 
    playerPos(9,5), nl, 
    write('You just hit a wall!\n'), nl, !. */
left :- 
    inBattle(0),
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
left :- 
    inBattle(0),
    playerPos(X1,Y1), 
    questPos(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
left :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    gateCLI,
    read(A),
    enterGateUpper(A), !.
left :- 
    inBattle(0),
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    gateCLI,
    read(A),
    enterGateLower(A), !.

left :-     
    inBattle(0),
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.
left :-
    inBattle(1),nl,
    write('    █░█░█ █░█ █▀▀ █▀█ █▀▀   ▄▀█ █▀█ █▀▀   █▄█ █▀█ █░█   █▀▀ █▀█ █ █▄░█ █▀▀ ▀█\n'),
    write('    ▀▄▀▄▀ █▀█ ██▄ █▀▄ ██▄   █▀█ █▀▄ ██▄   ░█░ █▄█ █▄█   █▄█ █▄█ █ █░▀█ █▄█ ░▄\n'),!.

left :-
    inBattle(0),
    write('You moved west!\n'), 
    retract(playerPos(X,Y)), 
    X > 1, X1 is X-1, nl, 
    asserta(playerPos(X1,Y)), 
    randomEnemy,
    !.



/* Enter shop */
enterShop(yes) :- 
    inShop(0),
    retract(inShop(0)),
    asserta(inShop(1)),
    shop, !.
enterShop(_) :- !.

/* Enter quest */
enterQuest(yes) :- queststart, !. % Masuk ke menu task disini %
enterQuest(_) :- !.

/* Enter gate */
enterGateUpper(yes) :-
    gateLower(X1,Y1),
    retract(playerPos(X,Y)),
    X2 is X1,
    Y2 is Y1 - 1,
    asserta(playerPos(X2,Y2)),
    write('                                            ▐\n'),
    write('                                            ▐ \n'),
    write('                                      ┼     █░\n'),
    write('                                         ▀▀███▄▄░\n'),
    write('▀█▀ █▀▀ █░░ █▀▀ █▀█ █▀█ █▀█ ▀█▀ █▀▀ █▀▄ █   █\n'),
    write('░█░ ██▄ █▄▄ ██▄ █▀▀ █▄█ █▀▄ ░█░ ██▄ █▄▀ ▄   ▌ ┼\n'),
    write('                                            ▌\n'),nl,!.
enterGateUpper(_) :- !.

enterGateLower(yes) :-
    gateUpper(X1,Y1),
    retract(playerPos(X,Y)), nl,
    X2 is X1,
    Y2 is Y1 + 1,
    asserta(playerPos(X2,Y2)), nl,
    write('                                            ▐\n'),
    write('                                            ▐ \n'),
    write('                                      ┼     █░\n'),
    write('                                         ▀▀███▄▄░\n'),
    write('▀█▀ █▀▀ █░░ █▀▀ █▀█ █▀█ █▀█ ▀█▀ █▀▀ █▀▄ █   █\n'),
    write('░█░ ██▄ █▄▄ ██▄ █▀▀ █▄█ █▀▄ ░█░ ██▄ █▄▀ ▄   ▌ ┼\n'),
    write('                                            ▌\n'),nl,!.
enterGateLower(_) :- !.

gateCLI :-
    nl,
    write('  ░██████╗░░█████╗░████████╗███████╗\n'),
    write('  ██╔════╝░██╔══██╗╚══██╔══╝██╔════╝\n'),
    write('  ██║░░██╗░███████║░░░██║░░░█████╗░░\n'),
    write('  ██║░░╚██╗██╔══██║░░░██║░░░██╔══╝░░\n'),
    write('  ╚██████╔╝██║░░██║░░░██║░░░███████╗\n'),
    write('  ░╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚══════╝\n'),nl,
    write('             ▒▒▒▒▒▒▒▒\n'),
    write('            ▒████████▒\n'),
    write('           ▒██████████▒\n'),
    write('          ▒████████████▒\n'),
    write('          ▒████████████▒\n'),
    write('         ▒▒████████████▒▒\n'),
    write('         ▒▒████████████▒▒\n'),
    write('         ▒▒████████████▒▒\n'),
    write('         ▒▒████▒▒▒▒████▒▒░\n'),
    write('        ▒▒▒███▒▒▒▒▒▒███▒▒▒\n'),
    write('        ▒▒▒██▒▒▒▒▒▒▒▒██░▒▒\n'),nl,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n').