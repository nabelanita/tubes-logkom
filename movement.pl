/* includes */
:- include('player.pl').
:- include('map.pl').
:- include('shop.pl').
:- include('enemy.pl').

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
	write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'), !.
s :- 
    opened(_),
    started(_),
    down, !.
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
    write('Do you want to check quests? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
up :-
    randomEnemy, !,
    Y > 1, 
    Y1 is Y-1, nl, 
    asserta(playerPos(X,Y1)).
up :- 
    retract(playerPos(X,Y)), 
    Y > 1, 
    Y1 is Y-1, nl, 
    asserta(playerPos(X,Y1)), 
    write('You moved north!'), !.

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
    write('Do you want to check quests? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
down :- 
    randomEnemy, !,
    retract(playerPos(X,Y)), 
    Y < 10, 
    Y1 is Y+1, nl, 
    asserta(playerPos(X,Y1)).
down :- 
    retract(playerPos(X,Y)), 
    Y < 10, 
    Y1 is Y+1, nl, 
    asserta(playerPos(X,Y1)), 
    write('You moved south!'), !.

/* RIGHT */
right :- 
    playerPos(X,_), 
    X =:= 20, nl, 
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
    write('Do you want to check quests? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
right :- 
    randomEnemy, !,
    retract(playerPos(X,Y)), 
    X < 20, 
    X1 is X+1, nl, 
    asserta(playerPos(X1,Y)).
right :- 
    retract(playerPos(X,Y)), 
    X < 20, 
    X1 is X+1, nl, 
    asserta(playerPos(X1,Y)), 
    write('You moved east!'), !.

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
    write('Do you want to check quests? (yes/no)\n'),
    read(A),
    enterQuest(A), !.
left :- 
    randomEnemy, !, 
    retract(playerPos(X,Y)), 
    X > 1, X1 is X-1, nl, 
    asserta(playerPos(X1,Y)).
left :- 
    retract(playerPos(X,Y)), 
    X > 1, X1 is X-1, nl, 
    asserta(playerPos(X1,Y)), 
    write('You moved west!'), !.

/* Enter shop or quest */
enterShop(yes) :- shop, !.
enterShop(no) :- !.
enterShop(_):- write('That is not a valid answer, but okay.'), !.

enterQuest(yes) :- write('You checked quest!'), !. % Masuk ke menu quest disini %
enterQuest(no) :- !.
enterQuest(_):- write('That is not a valid answer, but okay.'), !.
