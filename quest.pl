%:- include('player.pl').
:- dynamic(quest/3).
%:- dynamic

/* inisialisi quest scr random, hrs menyelesaikan : 
   W buah milestone
   X buah maintenance
   Y buah data breach */
/*quest(W,X,Y).*/
playerPos(2,1).

initQuest :-
    asserta(quest(0,0,0)),!.

isInQ :-
    playerPos(2,1).

/*initLvl :-
    random(1,3,LvlPlayer).*/

addMile(W) :-
    quest(Wawal,X,Y),
    retract(quest(Wawal,X,Y)),
    Wakhir is W + Wawal,
    asserta(quest(Wakhir,X,Y)),!.

addMaint(X) :-
    quest(W,Xawal,Y),
    retract(quest(W,Xawal,Y)),
    Xakhir is X + Xawal,
    asserta(quest(W,Xakhir,Y)),!.

addData(Y) :-
    quest(W,X,Yawal),
    retract(quest(W,X,Yawal)),
    Yakhir is Y + Yawal,
    asserta(quest(W,X,Yakhir)),!.

/*Jika player tidak berada dalam pos quest*/
questLevel(LvlPlayer) :-
    \+ isInQ, LvlPlayer is 0, write('You\'re not at the post!\n'),!.

questLevel(LvlPlayer) :-
    isInQ,
    LvlPlayer =:= 1,
    initQuest,
    random(1,2,W), addMile(W),
    random(1,2,X), addMaint(X),
    addData(1).

questLevel(LvlPlayer) :-
    isInQ,
    LvlPlayer =:= 2,
    initQuest,
    random(1,3,W), addMile(W),
    random(1,3,X), addMaint(X),
    random(1,2,Y), addData(Y).

questLevel(LvlPlayer) :-
    isInQ,
    LvlPlayer > 2,
    initQuest,
    A is LvlPlayer - 1,
    B is LvlPlayer + 3,
    random(A,B,W), addMile(W),
    random(A,B,X), addMaint(X),
    random(A,B,Y), addData(Y).

isEmptyQuest :- 
    quest(0,0,0),
    write('You don\'t have any task to solve!\n'),!.

printQuest :-
    \+ isEmptyQuest,
    quest(W,X,Y),
    write('\n[  Your task  ]\n'),
    format('Milestone  : ~d\nMaintenance: ~d\nData Breach: ~d\n', [W,X,Y]).

