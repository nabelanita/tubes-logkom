:- include('enemy.pl').

w :-
    inBattle(1),
    write('You cant move during battle'), !.

w :-
    inBattle(0),
    randomEnemy,
    inBattle(0),
    write('You moved north'), !.

w :-
    inBattle(0),
    randomEnemy,
    inBattle(1),!.

a :-
    inBattle(1),
    write('You cant move during battle'), !.

a :-
    inBattle(0),
    randomEnemy,
    inBattle(0),
    write('You moved west'), !.

a :-
    inBattle(0),
    randomEnemy,
    inBattle(1),!.

s :-
    inBattle(1),
    write('You cant move during battle'), !.

s :-
    inBattle(0),
    randomEnemy,
    inBattle(0),
    write('You moved south'), !.

s :-
    inBattle(0),
    randomEnemy,
    inBattle(1),!.

d :-
    inBattle(1),
    write('You cant move during battle'), !.

d :-
    inBattle(0),
    randomEnemy,
    inBattle(0),
    write('You moved east'), !.

d :-
    inBattle(0),
    randomEnemy,
    inBattle(1),!.