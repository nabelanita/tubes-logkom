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
    questLevel(Lvl),!.

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

/*player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)
player(_, Level, _, _, _, _, _, _, _)*/
addGold(X) :-
    player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold),
    NewGold is Gold + X,
    retract(player(Role, Lvl, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)),
    asserta(player(Role, Lvl, Exp, Attack, Defense, HP, MaxHP, Hearts, NewGold)), !.

addEXP(X) :-
    player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold),
    NewEXP is Exp + X,
    retract(player(Role, Lvl, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)),
    asserta(player(Role, Lvl, NewEXP, Attack, Defense, HP, MaxHP, Hearts, Gold)), !.

/* Quest telah selesai, tambah gold dan exp */
reward(Type) :-
    /*if enemy kalah*/
    enemy(Type, _, HPEnemy, _, _),
    HPEnemy < 2,
    /* equal to string belom jalan */
    Type is 'Milestone',
    addGold(10),
    addEXP(10).

reward(Type) :-
    /*if enemy kalah*/
    enemy(Type, _, HPEnemy, _, _),
    HPEnemy =:= 0,
    /* equal to string belom jalan */
    Type is 'Maintenance',
    addGold(30),
    addEXP(20).

reward(Type) :-
    /*if enemy kalah*/
    enemy(Type, _, HPEnemy, _, _),
    HPEnemy =:= 0,
    /* equal to string belom jalan */
    Type is 'Data Breach',
    addGold(50),
    addEXP(50).

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