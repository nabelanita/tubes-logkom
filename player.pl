/* Dynamic variables */


welcomePlayer(1) :-
    write('You have chosen Web Developer, let\'s explore the world of programming!').

welcomePlayer(2) :-
    write('You have chosen Machine Learning Engineer, let\'s explore the world of programming!').

welcomePlayer(3) :-
    write('You have chosen Mobile Developer, let\'s explore the world of programming!').

/*player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)*/
/*player(_, _, _, _, _, _, _, _, _)*/
initPlayer(X) :- 
    X =:= 1,
    asserta(player(X, 1, 0, 15, 10, 65, 65, 3, 500)),!.

initPlayer(X) :- 
    X =:= 2,
    asserta(player(X, 1, 0, 20, 10, 50, 50, 3, 500)),!.

initPlayer(X) :- 
    X =:= 3,
    asserta(player(X, 1, 0, 15, 15, 50, 50, 3, 500)),!.

checkLevelUp :-
    player(_, Lvl, Exp, _, _, _, _, _, _),
    Exp =:= Lvl * 10,
    levelUp.

levelUp :-
    write('You\'ve leveled up!'),   
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    Role =:= 1,
    NewLvl is Lvl + 1,
    NewAttack is Attack + NewLvl,
    NewDefense is Defense + NewLvl,
    NewMaxHP is MaxHP + 2*10*NewLvl,
    asserta(player(Role, NewLvl, 0, NewAttack, NewDefense, NewMaxHP, NewMaxHP, Hearts, Gold)).

levelUp :-
    write('You\'ve leveled up!'),
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    Role =:= 2,
    NewLvl is Lvl + 1,
    NewAttack is Attack + 2*NewLvl,
    NewDefense is Defense + NewLvl,
    NewMaxHP is MaxHP + 10*NewLvl,
    asserta(player(Role, NewLvl, 0, NewAttack, NewDefense, NewMaxHP, NewMaxHP, Hearts, Gold)).

levelUp :-
    write('You\'ve leveled up!'),
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    Role =:= 3,
    NewLvl is Lvl + 1,
    NewAttack is Attack + NewLvl,
    NewDefense is Defense + 2*NewLvl,
    NewMaxHP is MaxHP + 10*NewLvl,
    asserta(player(Role, NewLvl, 0, NewAttack, NewDefense, NewMaxHP, NewMaxHP, Hearts, Gold)).
    
addExp :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    NewExp is Exp + 1,
    asserta(player(Role, Lvl, NewExp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    checkLevelUp,!.

status :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 1,
    write('Your status:\n'),
    format('Job: ~w\nLevel: ~d\nHealth: ~d/~d\nAttack: ~d\nDefense: ~d\nExp: ~d\nGold: ~d\nHearts:~d', ['Web Developer', Lvl, HP, MaxHP, Attack, Defense, Exp, Gold, Hearts]),!.

status :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 2,
    write('\nYour status:\n'),
    format('Job: ~w\nLevel: ~d\nHealth: ~d/~d\nAttack: ~d\nDefense: ~d\nExp: ~d\nGold: ~d\nHearts:~d', ['ML Engineer', Lvl, HP, MaxHP, Attack, Defense, Exp, Gold, Hearts]),!.

status :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    Role =:= 3,
    write('Your status:\n'),
    format('Job: ~w\nLevel: ~d\nHealth: ~d/~d\nAttack: ~d\nDefense: ~d\nExp: ~d\nGold: ~d\nHearts:~d', ['Mobile Developer', Lvl, HP, MaxHP, Attack, Defense, Exp, Gold, Hearts]),!.



/* Rule buat:
Nanti si player bisa menggunakan equipment/potion yang udah dia beli.
kalo ngegunain sesuatu, delete item tsb dari inventory */