:- include('player.pl').
% :- include('movement.pl').
%:- include('main.pl').
:- dynamic(quest/3).
%:- dynamic

/* inisialisi quest scr random, hrs menyelesaikan : 
   W buah milestone
   X buah maintenance
   Y buah data breach */
/*quest(W,X,Y).*/

/*player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)
player(_, Level, _, _, _, _, _, _, _)*/

%initPlayer(1).

%playerPos(2,1). 
/*posisi questPos bakal random, dari abel*/

/*isQZero(Bool) :-
    \+ quest(0,0,0),
    Bool is false,
    quest(0,0,0),
    Bool is true,!.*/

/*( condition -> then_clause ; else_clause )*/
initQuest :-
    asserta(quest(0,0,0)),!.

queststart :-
    quest(0,0,0) ->
    player(_, Level, _, _, _, _, _, _, _),
    questLevel(Level);
    write('You still have tasks to be done!\n'),!.

/*initQuest :-
    isQZero(false),
    write('You still have tasks to be done!\n'),!.

initQuest :-
    isQZero(true),
    player(_, Level, _, _, _, _, _, _, _),
    questLevel(Level),!.*/

/*Player bisa mengakses Quest jika berada disebelah post Quest*/
/*isInQ :-
    playerPos(2,0); playerPos(3,1); playerPos(1,2); playerPos(2,2).
*/
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
    %\+ isInQ, 
    LvlPlayer is 0, write('You\'re not at the post!\n'),!.

questLevel(LvlPlayer) :-
    %isInQ,
    LvlPlayer =:= 1,
    %initQuest,
    random(1,2,W), addMile(W),
    random(1,2,X), addMaint(X),
    addData(1).

questLevel(LvlPlayer) :-
    %isInQ,
    LvlPlayer =:= 2,
    %initQuest,
    random(1,3,W), addMile(W),
    random(1,3,X), addMaint(X),
    random(1,2,Y), addData(Y).

questLevel(LvlPlayer) :-
    %isInQ,
    LvlPlayer > 2,
    %initQuest,
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



/* YANG BELOM : 
1. Rule untuk memberi tahu user jika quest telah selesai dan menambah gaji dan EXP.
2. Rule untuk mengecek jika player masih memiliki quest yang belum selesai. (Apabila
   player meminta quest baru tetapi quest lama belum selesai, inisialisasi quest akan gagal).
    //kalo quest(0,0,0)
3. Rule untuk menampilkan progress quest yang sedang berjalan. */
