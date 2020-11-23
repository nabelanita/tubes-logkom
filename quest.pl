/*quest.pl*/
:- include('player.pl').
:- include('inventory.pl').
:- dynamic(quest/4).
player(_, _, _, _, _, _, _, _, _).
/* enemy(enemyId, levelEnemy, hpEnemy, attackEnemy, defenseEnemy) */
/* player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)*/
/* player(_, _, _, _, _, _, _, _, _)*/
/* Role:
    1. Web Developer
    2. ML Engineer
    3. Mobile Developer */

/* quest(w,x,y,z) bilangan
Dalam satu waktu, tidak boleh terdapat dua 
quest yang aktif, yang berarti pemain harus
menyelesaikan sebuah quest terlebih dahulu
sebelum dapat menerima quest yang baru. */

/* inisialisi quest scr random, hrs menyelesaikan : 
   W buah milestone
   X buah maintenance
   Y buah data breach
   Z buah work stolen */
/*
initQuest :-
    asserta(quest([])),!. */

initQuest :-
    W is 0,
    X is 0,
    Y is 0,
    Z is 0,
    quest(W,X,Y,Z).

questStatus :-
    quest(W,X,Y,Z),
    write('Quest Status:\n'),
    format('Milestone: ~w\nMaintenance: ~d\nData Breach: ~d\nWork Stolen: ~d\n', [W,X,Y,Z]),  !.

addQuest(A) :-
    quest(QuestList),
    retract(quest(QuestList)),
    splitList(NewList, X, QuestList),
    asserta(quest(NewList)),!.

questLevel(LvlPlayer) :-
    LvlPlayer =:= 1,
    random(1,2,W),
    random(1,2,X),
    Y is 1,
    Z is 1,
    addQuest(W),addQuest(X),addQuest(Y),addQuest(Z).

questLevel(LvlPlayer) :-
    LvlPlayer =:= 2,
    random(1,3,W),
    random(1,3,X),
    random(1,2,Y),
    random(1,2,Z),
    addQuest(W),addQuest(X),addQuest(Y),addQuest(Z).

questLevel(LvlPlayer) :-
    LvlPlayer > 2,
    A is LvlPlayer - 1,
    B is LvlPlayer + 3,
    random(A,B,W),
    random(A,B,X),
    random(A,B,Y),
    random(A,B,Z),
    addQuest(W),addQuest(X),addQuest(Y),addQuest(Z).

printQuest([]).
printQuest([H|T]) :-
    write(H),nl,
    %format('W: ~w~n',H),
    printQuest(T).