%:- include('player.pl').
:- dynamic(quest/4).
%:- dynamic

/* inisialisi quest scr random, hrs menyelesaikan : 
   W buah milestone
   X buah maintenance
   Y buah data breach
   Z buah work stolen */
/*quest(W,X,Y,Z).*/
playerPos(2,1).

initQuest :-
    asserta(quest(0,0,0,0)),!.

isInQ :-
    playerPos(2,1).

/*initLvl :-
    random(1,3,LvlPlayer).*/

addMile(W) :-
    quest(Wawal,X,Y,Z),
    retract(quest(Wawal,X,Y,Z)),
    Wakhir is W + Wawal,
    asserta(quest(Wakhir,X,Y,Z)),!.

addMaint(X) :-
    quest(W,Xawal,Y,Z),
    retract(quest(W,Xawal,Y,Z)),
    Xakhir is X + Xawal,
    asserta(quest(W,Xakhir,Y,Z)),!.

addData(Y) :-
    quest(W,X,Yawal,Z),
    retract(quest(W,X,Yawal,Z)),
    Yakhir is Y + Yawal,
    asserta(quest(W,X,Yakhir,Z)),!.

addWork(Z) :-
    quest(W,X,Y,Zawal),
    retract(quest(W,X,Y,Zawal)),
    Zakhir is Z + Zawal,
    asserta(quest(W,X,Y,Zakhir)),!.

/*Jika player tidak berada dalam pos quest*/
questLevel(LvlPlayer) :-
    \+ isInQ, LvlPlayer is 0, write('You\'re not at the post!\n'),!.

questLevel(LvlPlayer) :-
    isInQ,
    LvlPlayer =:= 1,
    initQuest,
    random(1,2,W), addMile(W),
    random(1,2,X), addMaint(X),
    addData(1),
    addWork(1).

questLevel(LvlPlayer) :-
    isInQ,
    LvlPlayer =:= 2,
    initQuest,
    random(1,3,W), addMile(W),
    random(1,3,X), addMaint(X),
    random(1,2,Y), addData(Y),
    random(1,2,Z), addWork(Z).

questLevel(LvlPlayer) :-
    isInQ,
    LvlPlayer > 2,
    initQuest,
    A is LvlPlayer - 1,
    B is LvlPlayer + 3,
    random(A,B,W), addMile(W),
    random(A,B,X), addMaint(X),
    random(A,B,Y), addData(Y),
    random(A,B,Z), addWork(Z).

isEmptyQuest :- 
    quest(0,0,0,0),
    write('You don\'t have any task to solve!\n'),!.

printQuest :-
    \+ isEmptyQuest,
    quest(W,X,Y,Z),
    write('\n[  Your task  ]\n'),
    format('Milestone  : ~d\nMaintenance: ~d\nData Breach: ~d\nWork Stolen: ~d\n', [W,X,Y,Z]).

