/* Dynamic variables */
:- dynamic(playerPos/2).
:- dynamic(player/9).


welcomePlayer(1) :-
    write('You have chosen Web Developer, let\'s explore the world of programming!\n'),
    asserta(started(1)),
    asserta(inBattle(0)),
    initPlayer(1).

welcomePlayer(2) :-
    write('You have chosen Machine Learning Engineer, let\'s explore the world of programming!\n'),
    asserta(started(1)),
    asserta(inBattle(0)),
    initPlayer(2).

welcomePlayer(3) :-
    write('You have chosen Mobile Developer, let\'s explore the world of programming!\n'),
    asserta(started(1)),
    asserta(inBattle(0)),
    initPlayer(3).

welcomePlayer(_) :-
    write('Sorry, we\'re not hiring that position right now. Choose something else. \n\n'), 
    !, start.

/* initialize player position */
/* mending ini digabung sama inisialisasi lain sih */
initPlayerPos:- X is 2, Y is 1, asserta(playerPos(X,Y)). 

    
/*player(Role, Level, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)*/
/*player(_, _, _, _, _, _, _, _, _)*/
initPlayer(X) :- 
    X =:= 1,
    asserta(player(1, 1, 0, 20, 10, 100, 100, 3, 500)), newMap, !.

initPlayer(X) :- 
    X =:= 2,
    asserta(player(2, 1, 0, 30, 10, 75, 75, 3, 500)), newMap, !.

initPlayer(X) :- 
    X =:= 3,
    asserta(player(3, 1, 0, 20, 15, 75, 75, 3, 500)), newMap, !.

checkLevelUp(0) :-
    player(_, Lvl, Exp, _, _, _, _, _, _),
    Exp < Lvl * 10, !.

checkLevelUp(1) :-
    player(_, Lvl, Exp, _, _, _, _, _, _),
    Exp >= Lvl * 10,
    levelUp, !.

levelUp :- 
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 1, 
    write('                                                 ┼\n'),
    write('                                               ▐\n'),
    write('                                               ▐ \n'),
    write('                                         ┼     █░\n'),
    write('                                            ▀▀███▄▄░\n'),
    write('             █░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █   █░\n'),
    write('             █▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄   ▌ ┼\n'),
    write('                                               ▌\n'),
    NewLvl is Lvl + 1,
    format('                  Current level: ~w\n', [NewLvl]),
    NewAttack is Attack + NewLvl,
    NewDefense is Defense + NewLvl,
    NewMaxHP is MaxHP + 2*10*NewLvl,
    NewExp is Exp - 10*Lvl,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, NewLvl, NewExp, NewAttack, NewDefense, NewMaxHP, NewMaxHP, Hearts, Gold)), !.

levelUp :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 2,
    write('                                                 ┼\n'),
    write('                                               ▐\n'),
    write('                                               ▐ \n'),
    write('                                         ┼     █░\n'),
    write('                                            ▀▀███▄▄░\n'),
    write('             █░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █   █░\n'),
    write('             █▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄   ▌ ┼\n'),
    write('                                               ▌\n'),
    NewLvl is Lvl + 1,
    format('                  Current level: ~w\n', [NewLvl]),
    NewAttack is Attack + 2*NewLvl,
    NewDefense is Defense + NewLvl,
    NewMaxHP is MaxHP + 10*NewLvl,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, NewLvl, 0, NewAttack, NewDefense, NewMaxHP, NewMaxHP, Hearts, Gold)), !.

levelUp :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 3,
    write('                                                 ┼\n'),
    write('                                               ▐\n'),
    write('                                               ▐ \n'),
    write('                                         ┼     █░\n'),
    write('                                            ▀▀███▄▄░\n'),
    write('             █░░ █▀▀ █░█ █▀▀ █░░   █░█ █▀█ █   █░\n'),
    write('             █▄▄ ██▄ ▀▄▀ ██▄ █▄▄   █▄█ █▀▀ ▄   ▌ ┼\n'),
    write('                                               ▌\n'),
    NewLvl is Lvl + 1,
    format('                  Current level: ~w\n', [NewLvl]),
    NewAttack is Attack + NewLvl,
    NewDefense is Defense + 2*NewLvl,
    NewMaxHP is MaxHP + 10*NewLvl,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, NewLvl, 0, NewAttack, NewDefense, NewMaxHP, NewMaxHP, Hearts, Gold)), !.
    
addExp(X) :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    NewExp is Exp + X,
    asserta(player(Role, Lvl, NewExp, Attack, Defense, MaxHP, HP, Hearts, Gold)),checkLevelUp(_),!.

printExp(0):- !.
printExp(A):-
    write('▒'),
    X is A - 1,
    printExp(X).
    
printHearts(0):- nl, !.
printHearts(H):-
    write('♥ '),
    X is H - 1,
    printHearts(X).

healthstatus :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold), 
    HP =< 0, !.

healthstatus :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    HP > 0,
    nl,
    write('            █▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀\n'),
    write('            ▄█ ░█░ █▀█ ░█░ █▄█ ▄█\n'),
    nl, write('  HEARTS  -  '),
    printHearts(Hearts),
    format('  LVL. ~d', [Lvl]),
    write('  EXP: '),
    X is round((Exp / (Lvl*10))*20),
    printExp(X),
    format(' ~d/~d\n', [Exp, Lvl*10]),
    write('          Stamina: '),
    Y is round((HP / (MaxHP))*20),
    forall(between(0,Y,B),(write('▒'))), 
    format(' ~d/~d\n', [HP, MaxHP]),
    format('          ATK. ~d\n          DEF. ~d\n', [Attack, Defense]), !.

status :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 1, nl,
    write('            █▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀\n'),
    write('            ▄█ ░█░ █▀█ ░█░ █▄█ ▄█\n'),
    nl, write('  HEARTS  -  '),
    printHearts(Hearts),
    format('  LVL. ~d', [Lvl]),
    write('  EXP: '),
    X is round((Exp / (Lvl*10))*20),
    printExp(X),
    format(' ~d/~d\n', [Exp, Lvl*10]),
    write('          Stamina: '),
    Y is round((HP / (MaxHP))*20),
    forall(between(0,Y,B),(write('▒'))), 
    format(' ~d/~d\n', [HP, MaxHP]),
    format('          ATK. ~d\n          DEF. ~d\n', [Attack, Defense]),
    write('  You are a Web Developer!\n'),
    format('  Gold:  ~d  G\n', [Gold]),!.

status :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 2, nl,
    write('            █▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀\n'),
    write('            ▄█ ░█░ █▀█ ░█░ █▄█ ▄█\n'),
    nl, write('  HEARTS  -  '),
    printHearts(Hearts),
    format('  LVL. ~d', [Lvl]),
    write('  EXP: '),
    X is round((Exp / (Lvl*10))*20),
    printExp(X),
    format(' ~d/~d\n', [Exp, Lvl*10]),
    write('          Stamina: '),
     Y is round((HP / (MaxHP))*20),
    forall(between(0,Y,B),(write('▒'))), 
    format(' ~d/~d\n', [HP, MaxHP]),
    format('          ATK. ~d\n          DEF. ~d\n', [Attack, Defense]),
    write('You are a Machine Learning Engineer!\n'),
    format('Gold:  ~d  G\n', [Gold]),!.

status :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 3, nl,
    write('            █▀ ▀█▀ ▄▀█ ▀█▀ █░█ █▀\n'),
    write('            ▄█ ░█░ █▀█ ░█░ █▄█ ▄█\n'),
    nl, write('  HEARTS  -  '),
    printHearts(Hearts),
    format('  LVL. ~d', [Lvl]),
    write('  EXP: '),
    X is round((Exp / (Lvl*10))*20),
    printExp(X),
    format(' ~d/~d\n', [Exp, Lvl*10]),
    write('          Stamina: '),
     Y is round((HP / (MaxHP))*20),
    forall(between(0,Y,B),(write('▒'))), 
    format(' ~d/~d\n', [HP, MaxHP]),
    format('          ATK. ~d\n          DEF. ~d\n', [Attack, Defense]),
    write('  You are a Mobile Developer!\n'),
    format('  Gold:  ~d  G\n', [Gold]),!.


status :-
    opened(_),
    write('You haven\'t started the game! \n'),
    write('Type \'start\' to open the game. \n').

status :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n').


/* Rule buat:
Nanti si player bisa menggunakan equipment/potion yang udah dia beli.
kalo ngegunain sesuatu, delete item tsb dari inventory */