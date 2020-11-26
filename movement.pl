/* includes */
:- include('player.pl').
:- include('map.pl').
:- include('shop.pl').
:- include('battle.pl').
:- include('cobaquest.pl').
% :- include('quest.pl').

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
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
up :- 
    playerPos(X1,Y1), 
    questPos(X2,Y2),
    X1 is X2, 
    Y1 is Y2 + 1,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
up :- 
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateUpper(A), !.
up :- 
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateLower(A), !.
up :- 
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 + 1,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.
up :-
    inBattle(1),
    write('You cannot move during a battle!'), !.

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
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
down :- 
    playerPos(X1,Y1), 
    questPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
down :- 
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateUpper(A), !.
down :- 
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateLower(A), !.

down :- 
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2, 
    Y1 is Y2 - 1,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.

down :-
    inBattle(1),
    write('You cannot move during a battle!'), !.

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
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
right :- 
    playerPos(X1,Y1), 
    questPos(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
right :- 
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateUpper(A), !.
right :- 
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateLower(A), !.
right :- 
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2 - 1, 
    Y1 is Y2,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.
right :-
    inBattle(1),
    write('You cannot move during a battle!'), !.

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
    playerPos(X1,Y1), 
    shopPos(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('It\'s a shop. Enter shop? (yes/no)\n'),
    read(A),
    enterShop(A), !.
left :- 
    playerPos(X1,Y1), 
    questPos(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('Do you want to check tasks? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
left :- 
    playerPos(X1,Y1), 
    gateUpper(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateUpper(A), !.
left :- 
    playerPos(X1,Y1), 
    gateLower(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('It\'s the gate. Do you want to teleport? (yes/no)\n'),
    read(A),
    enterGateLower(A), !.

left :- 
    playerPos(X1,Y1), 
    bossPos(X2,Y2), 
    X1 is X2 + 1, 
    Y1 is Y2,
    write('Are you sure you want to fight the boss? (yes/no)\n'),
    read(A),
    initBoss(A), !.
left :-
    inBattle(1),
    write('You cannot move during a battle!'), !.

left :-
    inBattle(0),
    write('You moved west!\n'), 
    retract(playerPos(X,Y)), 
    X > 1, X1 is X-1, nl, 
    asserta(playerPos(X1,Y)), 
    randomEnemy,
    !.

    

/* Enter shop */
enterShop(yes) :- shop, !.
enterShop(_) :- !.

/* Enter quest */
enterQuest(yes) :- queststart, !. % Masuk ke menu task disini %
enterQuest(_) :- !.

/* Enter gate */
enterGateUpper(yes) :-
    gateLower(X1,Y1),
    retract(playerPos(X,Y)),
    X2 is X1,
    Y2 is Y1 + 1,
    asserta(playerPos(X2,Y2)),
    write('You have been teleported!\n'),!.
enterGateUpper(_) :- !.

enterGateLower(yes) :-
    gateUpper(X1,Y1),
    retract(playerPos(X,Y)), nl,
    X2 is X1,
    Y2 is Y1 - 1,
    asserta(playerPos(X2,Y2)), nl,
    write('You have been teleported!\n'),!.
enterGateLower(_) :- !.

