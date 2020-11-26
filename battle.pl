/*Include dan Dynamic*/
:- include('player.pl').
:- dynamic(inBattle/1).
:- dynamic(enemy/5). 
:- dynamic(enemySpecialAttack/1). 
:- dynamic(specialAttackCount/1). 
:- dynamic(meetEnemy/1).


/* enemy(enemyId, levelEnemy, hpEnemy, attackEnemy, defenseEnemy, goldBonus, ExpBonus) */

/* initEnemy */
enemyStatus :-
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    nl,
    write('            █▀▀ █▄░█ █▀▀ █▀▄▀█ █▄█\n'),
    write('            ██▄ █░▀█ ██▄ █░▀░█ ░█░\n'),
    nl, format('  TYPE  -  ~w\n', [Type]),
    format('  LVL. ~d', [LevelEnemy]),
    write('  HP: '),
    Y is HPEnemy // 5,
    forall(between(0,Y,B),(write('▒'))), 
    format(' ~d\n', [HPEnemy]),
    format('          ATK. ~d\n          DEF. ~d\n', [AttackEnemy, DefenseEnemy]), !.

attackMenu :-
    enemyStatus,
    write('What\'s your next move?\n').

%belom game over

 checkPlayerDefeated(1) :-
    player(_, _, _, _, _, _, HP, _, _),
    HP > 0, !.

 checkPlayerDefeated(0) :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    HP =< 0,
    NewHearts is Hearts - 1,
    NewHearts > 0, 
    write('You were defeated!\n'),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    format('Current hearts: ~d\n', [NewHearts]),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, MaxHP, NewHearts, Gold)), !.

%game over
%keknya nanti bikin fungsi game over aja buat ngeretract smua database
checkPlayerDefeated(0) :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    HP =< 0,
    NewHearts is Hearts - 1,
    NewHearts =< 0, 
    write('You were defeated!\n'),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    format('Current hearts: ~d\n', [NewHearts]),
    write('You got fired!\n'), !.

playerDamaged(Damage, 0) :- Damage < 1, !.

playerDamaged(Damage, Damage) :-
    Damage > 0,
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    NewHP is HP - Damage,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, NewHP, Hearts, Gold)), !.

checkEnemySpecialAttack :-
    enemySpecialAttack(X),
    X =:= 0, !.

checkEnemySpecialAttack :-
    enemySpecialAttack(X),
    X > 0,
    retract(enemySpecialAttack(X)),
    X1 is X - 1,
    asserta(enemySpecialAttack(X1)), !.

/* attack */
enemyMove(1) :-
    player(_, _, _, _, DefensePlayer, _, _, _, _),
    enemy(Type, _, _, AttackEnemy, _, _, _),
    A is AttackEnemy - 5,
    B is AttackEnemy + 6, random(A, B, Attack),
    C is DefensePlayer - 2,
    D is DefensePlayer + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    playerDamaged(Damage, ActualDamage),
    checkEnemySpecialAttack,
    format('~w performed attack\n', [Type]),
    format('~w deal ~d damage\n', [Type, ActualDamage]), checkPlayerDefeated(X), !.

/* special attack */
enemyMove(2) :-
    player(_, _, _, _, DefensePlayer, _, _, _, _),
    enemy(Type, _, _, AttackEnemy, _, _, _),
    A is 2 * AttackEnemy - 5, B is 2 * AttackEnemy + 6, random(A, B, Attack),
    C is DefensePlayer - 2, D is DefensePlayer + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    playerDamaged(Damage, ActualDamage),
    format('~w performed special attack\n', [Type]),
    format('~w deal ~d damage\n', [Type, ActualDamage]), 
    retract(enemySpecialAttack(_)),
    asserta(enemySpecialAttack(2)), checkPlayerDefeated(X),!.

 checkEnemyDefeated(1) :-
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    HPEnemy > 0, !.

 checkEnemyDefeated(0) :-
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    HPEnemy =< 0,
    retract(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    format('You defeated ~w!\n', [Type]),
    player(Role, Level, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    NewGold is Gold + GoldBonus,
    retract(player(Role, Level, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, Level, Exp, Attack, Defense, MaxHP, HP, Hearts, NewGold)),
    addExp(ExpBonus),!.

randomEnemyMove(X) :- 
    checkEnemyDefeated(Status), Status =:= 0, !.

randomEnemyMove(X) :- 
    X =:= 0,
    checkEnemyDefeated(Status),
    Status =:= 1,
    random(1,3,Move),
    enemyMove(Move),!.

randomEnemyMove(X) :-
    X > 0,
    checkEnemyDefeated(Status),
    Status =:= 1,
    enemyMove(1),!.

enemyDamaged(Damage, ActualDamage) :- Damage < 1, ActualDamage is 0, !.

enemyDamaged(Damage, ActualDamage) :-
    Damage > 0,
    ActualDamage is Damage,
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    NewHP is HPEnemy - Damage,
    retract(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    asserta(enemy(Type, LevelEnemy, NewHP, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)).

checkSpecialAttack :-
    specialAttackCount(X),
    X > 0,
    retract(specialAttackCount(X)),
    X1 is X - 1,
    asserta(specialAttackCount(X1)), !.

checkSpecialAttack :-
    specialAttackCount(X),
    X =:= 0, !.

attack :-
    inBattle(0),
    write('You\'re currently not in a battle!'),!.
    
attack :-
    inBattle(1),
    player(_, _, _, AttackPlayer, _, _, _, _, _),
    enemy(_, _, _, _, DefenseEnemy, _, _),
    A is AttackPlayer - 5, B is AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense, 
    enemyDamaged(Damage, ActualDamage), 
    format('You deal ~d damage\n', [ActualDamage]), 
    retract(chancetorun(_)), 
    asserta(chancetorun(0)),
    checkSpecialAttack,
    enemySpecialAttack(X), randomEnemyMove(X), !.

specialattack :-
    inBattle(0),
    write('You\'re currently not in a battle!'),!.

specialattack :-
    inBattle(1),
    specialAttackCount(X),
    X > 0,
    write('Special Attack not ready!'), !.

specialattack :-
    inBattle(1),
    specialAttackCount(0),
    player(_, _, _, AttackPlayer, _, _, _, _, _),
    enemy(_, _, _, _, DefenseEnemy, _, _),
    A is 2 * AttackPlayer - 5, B is 2 * AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    enemyDamaged(Damage, ActualDamage),
    format('You deal ~d damage\n', [ActualDamage]), 
    retract(specialAttackCount(_)),
    asserta(specialAttackCount(2)),
    retract(chancetorun(_)), 
    asserta(chancetorun(1)),
    enemySpecialAttack(X), randomEnemyMove(X), !.

run :-
    chancetorun(0),
    write('You failed to run!\nChoose another move!'), !.

run :-
    chancetorun(1),
    random(1,3,X),
    runSucceed(X), !.

runSucceed(1) :- 
    write('You managed to run!'), 
    retractall(enemy(_,_,_,_,_,_,_)), 
    retract(chancetorun(_)),
    retract(inBattle(1)),
    asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)),!.

runSucceed(2) :- 
    write('You failed to run!\nChoose another move!'), 
    retract(chancetorun(_)), 
    asserta(chancetorun(0)),!.

randomLevel(LvlPlayer, LevelEnemy) :-
    LvlPlayer =:= 1,
    random(1, 3, LevelEnemy), !.

randomLevel(LvlPlayer, LevelEnemy) :-
    LvlPlayer =:= 2,
    random(1, 5, LevelEnemy), !.

randomLevel(LvlPlayer, LevelEnemy) :-
    LvlPlayer > 2,
    A is LvlPlayer - 2,
    B is LvlPlayer + 2,
    random(A, B, LevelEnemy), !.

/* enemy(JenisEnemy, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)*/
initEnemy(3) :-
    write('Your boss gave you a milestone to finish!'),
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 15 + 60,
    AttackEnemy is (LevelEnemy - 1) * 2 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    GoldBonus is LevelEnemy * 15,
    ExpBonus is LevelEnemy * 5,
    asserta(enemy('Milestone', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    asserta(specialAttackCount(0)),
    asserta(enemySpecialAttack(0)), 
    asserta(chancetorun(1)),
    retract(inBattle(0)),
    asserta(inBattle(1)), !.

initEnemy(6) :-
    write('There is a maintenance you need to do!'), 
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 60,
    AttackEnemy is (LevelEnemy - 1) * 4 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    GoldBonus is LevelEnemy * 15,
    ExpBonus is LevelEnemy * 5,
    asserta(enemy('Maintenance', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    asserta(enemySpecialAttack(0)),
    asserta(specialAttackCount(0)),
    asserta(chancetorun(1)),
    retract(inBattle(0)),
    asserta(inBattle(1)), !.

initEnemy(9) :-
    write('A data breach has happened!'),
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 60,
    AttackEnemy is (LevelEnemy - 1) * 2 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 4 + 10,
    GoldBonus is LevelEnemy * 15,
    ExpBonus is LevelEnemy * 5,
    asserta(enemy('Data Breach', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    asserta(enemySpecialAttack(0)),
    asserta(specialAttackCount(0)),
    asserta(chancetorun(1)),
    retract(inBattle(0)),
    asserta(inBattle(1)), !.

initEnemy(X) :- X \= 3, X \= 6, X \= 9, !.

randomEnemy :-
    random(0,10,X),
    initEnemy(X), !.

/*pas attack, kalo HP enemynya udah 0, berarti bisa dikalahkan.
kalo udah kalah, quest - 1, date tuple quest*/
