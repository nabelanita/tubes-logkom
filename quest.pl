:- dynamic(quest/4).

/* inisialisi quest scr random, hrs menyelesaikan : 
   W buah milestone
   X buah maintenance
   Y buah data breach
   Z buah work stolen */
/*quest(W,X,Y,Z).*/

initQuest :-
    asserta(quest(0,0,0,0)),!.

addMile(W) :-
    quest(Wawal,X,Y,Z),
    retract(quest(Wawal,X,Y,Z)),
    Wakhir is W + Wawal,
    asserta(quest(Wakhir,X,Y,Z)).

addMaint(X) :-
    quest(W,Xawal,Y,Z),
    retract(quest(W,Xawal,Y,Z)),
    Xakhir is X + Xawal,
    asserta(quest(W,Xakhir,Y,Z)).

addData(Y) :-
    quest(W,X,Yawal,Z),
    retract(quest(W,X,Yawal,Z)),
    Yakhir is Y + Yawal,
    asserta(quest(W,X,Yakhir,Z)).

addWork(Z) :-
    quest(W,X,Y,Zawal),
    retract(quest(W,X,Y,Zawal)),
    Zakhir is Z + Zawal,
    asserta(quest(W,X,Y,Zakhir)).

isEmptyQuest :- 
    quest(0,0,0,0),
    write('You don\'t have any task to solve!\n'),!.

printQuest :-
    \+ isEmptyQuest,
    quest(W,X,Y,Z),
    write('\n[  Your task  ]\n'),
    format('Milestone  : ~d\nMaintenance: ~d\nData Breach: ~d\nWork Stolen: ~d\n', [W,X,Y,Z]).

