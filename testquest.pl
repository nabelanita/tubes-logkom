/*quest.pl*/
:- include ('player.pl').
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

/* Level player : 1-5
   if level == 1, random(1,2,W), random(1,2,X), Y is 1, Z is 1.
   if level == 2, */

splitList([Head|Tail], Head, Tail) :- !.

concatenate([],[],[]) :- !.
concatenate([],SList,SList) :- !.

concatenate(FList, SList, RList) :-
    splitList(FList, Head, Tail),
    concatenate(Tail, SList, PrevList),
    splitList(RList, Head, PrevList), !.

initQuest :-
    asserta(quest([])),!.

addQuest(A) :-
    quest(QuestList),
    retract(quest(QuestList)),
    splitList(NewList, X, QuestList),
    asserta(quest(NewList)),
    %write(NewList),
    !.

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

startquest :-
    random(1,3,X),
    addQuest(X),nl,
    random(1,3,Y),
    %write(X),
    addQuest(Y),nl.

printQuest([]).
printQuest([H|T]) :-
    write(H),nl,
    %format('W: ~w~n',H),
    printQuest(T).


show(X) :-
    X = [A | B],
    write('\tW = '),
    A = [C | D],
    write(C),
    write('\tX = '),
    D = [E | F],
    format("~s", [E]),
    write('\tY = '),
    F = [G | H],
    write(G),
    nl,
    show(B).
