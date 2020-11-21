/* includes */
:- include('map.pl').

/* move commands */
w :- up, !.
a :- left, !.
s :- down, !.
d :- right, !.

/* change player position */
up :- player(_,Y), Y =:= 1, write('You just hit a wall!\n'), nl, !.
up :- retract(playerPos(X,Y)), Y > 1, Y1 is Y-1, nl, asserta(playerPos(X,Y1)),!.

down :- player(_,Y), Y =:= 10, write('You just hit a wall!\n'), nl, !.
down :- retract(playerPos(X,Y)), Y < 10, Y1 is Y+1, nl, asserta(playerPos(X,Y1)),!.

right :- player(X,_), X =:= 20, write('You just hit a wall!\n'),nl,!.
right :- retract(playerPos(X,Y)), X < 20, X1 is X+1, nl, asserta(playerPos(X1,Y)),!.

left :- player(X,_), X =:= 1, write('You just hit a wall!'), nl,!.
left :- retract(playerPos(X,Y)), X > 1, X1 is X-1, nl, asserta(playerPos(X1,Y)),!.