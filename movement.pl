/* includes */
:- include('player.pl').

/* move commands */
w :- up, !.
a :- left, !.
s :- down, !.
d :- right, !.

/* change player position */
up :- playerPos(_,Y), Y =:= 1, nl, write('You just hit a wall!\n'), nl, !.
up :- playerPos(7,4), nl, write('You just hit a wall!\n'), nl, !.
up :- playerPos(9,4), nl, write('You just hit a wall!\n'), nl, !.
up :- playerPos(8,6), nl, write('You just hit a wall!\n'), nl, !.
up :- retract(playerPos(X,Y)), Y > 1, Y1 is Y-1, nl, asserta(playerPos(X,Y1)), write('You moved upwards!'), !.

down :- playerPos(_,Y), Y =:= 10, nl, write('You just hit a wall!\n'), nl, !.
down :- playerPos(7,2), nl, write('You just hit a wall!\n'), nl, !.
down :- playerPos(8,2), nl, write('You just hit a wall!\n'), nl, !, fail.
down :- playerPos(9,2), nl, write('You just hit a wall!\n'), nl, !, fail.
down :- retract(playerPos(X,Y)), Y < 10, Y1 is Y+1, nl, asserta(playerPos(X,Y1)), write('You moved downwards!'), !.

right :- playerPos(X,_), X =:= 20, nl, write('You just hit a wall!\n'),nl,!.
right :- playerPos(6,3), nl, write('You just hit a wall!\n'), nl, !.
right :- playerPos(7,4), nl, write('You just hit a wall!\n'), nl, !.
right :- playerPos(7,5), nl, write('You just hit a wall!\n'), nl, !.
right :- retract(playerPos(X,Y)), X < 20, X1 is X+1, nl, asserta(playerPos(X1,Y)), write('You moved right!'), !.

left :- playerPos(X,_), X =:= 1, nl, write('You just hit a wall!'), nl,!.
left :- playerPos(10,3), nl, write('You just hit a wall!\n'), nl, !.
left :- playerPos(9,4), nl, write('You just hit a wall!\n'), nl, !.
left :- playerPos(9,5), nl, write('You just hit a wall!\n'), nl, !.
left :- retract(playerPos(X,Y)), X > 1, X1 is X-1, nl, asserta(playerPos(X1,Y)), write('You moved left!'), !.