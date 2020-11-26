:- include('player.pl').
:- include('battle.pl').
:- dynamic(quest/3).

%initPlayer(1). 
/*initPlayer HARUS DI TERMINAL!!!!!!!!!*/

%player('Web Developer', 1, 0, 20, 10, 100, 100, 3, 500).

/* initQuest nanti dijalanin di main*/
initQuest :-
    asserta(quest(0,0,0)),!.

isQZero :-
    quest(0,0,0).

queststart :-
    isQZero,
    player(_, Lvl, _, _, _, _, _, _, _),
    questLevel(Lvl),
    printQuest,!.

queststart :-
    \+ isQZero,
    write('You still have tasks to be done!\n'),!.

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

questLevel(LvlPlayer) :-
    LvlPlayer =:= 1,
    random(1,2,W), addMile(W),
    random(1,2,X), addMaint(X),
    addData(1).

questLevel(LvlPlayer) :-
    LvlPlayer =:= 2,
    random(1,3,W), addMile(W),
    random(1,3,X), addMaint(X),
    random(1,2,Y), addData(Y).

questLevel(LvlPlayer) :-
    LvlPlayer > 2,
    A is LvlPlayer - 1,
    B is LvlPlayer + 3,
    random(A,B,W), addMile(W),
    random(A,B,X), addMaint(X),
    random(A,B,Y), addData(Y).

printQuest :-
    isQZero,
    write('You don\'t have any task to solve!\n'),!.

/* Menampilkan progress quest yang sedang berjalan*/
printQuest :-
    \+ isQZero,
    quest(W,X,Y),
    write('\n[  Your task  ]\n'),
    format('Milestone  : ~d\nMaintenance: ~d\nData Breach: ~d\n', [W,X,Y]).

finishQuest('Milestone') :-
    quest(X,Y,Z),
    newX is X - 1,
    retract(quest(X,Y,Z)),
    asserta(quest(newX,Y,Z)),!.

finishQuest('Maintenance') :-
    quest(X,Y,Z),
    newY is Y - 1,
    retract(quest(X,Y,Z)),
    asserta(quest(X,newY,Z)),!.

finishQuest('Data Breach') :-
    quest(X,Y,Z),
    newZ is Z - 1,
    retract(quest(X,Y,Z)),
    asserta(quest(X,Y,newZ)),!.

/* test di GNU */
/*
initPlayer(1).
initQuest.
queststart.
quest(X,Y,Z).
initEnemy(5).
enemy(A,B,C,D,E).
enemyDamaged(49).
enemy(A,B,C,D,E).
player(A,B,C,D,E,F,G,H,I).
reward('Milestone'). */