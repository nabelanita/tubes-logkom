/*Include dan Dynamic*/
:- include('player.pl').
:- dynamic(inBattle/1).
:- dynamic(enemy/5). 
:- dynamic(enemySpecialAttack/1). 
:- dynamic(specialAttackCount/1). 
:- dynamic(meetEnemy/1).


/* enemy(enemyId, levelEnemy, hpEnemy, attackEnemy, defenseEnemy) */

/* initEnemy */
enemyStatus :-
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy),
    write('Enemy Status:\n'),
    format('Type: ~w\nLevel: ~d\nHealth: ~d\nAttack: ~d\nDefense: ~d\n', [Type, LevelEnemy, HP, Attack, Defense]),  !.

attackMenu :-
    enemyStatus,
    write('What\'s your next move?\n').

playerDamaged(Damage) :- Damage < 1, !.

playerDamaged(Damage) :-
    Damage > 0,
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    NewHP is HP - Damage,
    NewHP > 0,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, NewHP, Hearts, Gold)), !.

playerDamaged(Damage) :-
    Damage > 0,
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    NewHP is HP - Damage,
    NewHP < 1,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    write('You were defeated!\n'),
    NewHearts is Hearts - 1,
    NewHearts > 0, 
    format('Current hearts: ~d\n', [NewHearts]),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, MaxHP, NewHearts, Gold)), !.

playerDamaged(Damage) :-
    Damage > 0,
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    NewHP is HP - Damage,
    NewHP < 1,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    write('You were defeated!\n'),
    NewHearts is Hearts - 1,
    NewHearts =:= 0, 
    format('Current hearts: ~d\n', [NewHearts]),
    write('You got fired!'), !.

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
    enemy(Type, _, _, AttackEnemy, _),
    A is AttackEnemy - 5,
    B is AttackEnemy + 6, random(A, B, Attack),
    C is DefensePlayer - 2,
    D is DefensePlayer + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    Damage < 0, Damage is 0,
    checkEnemySpecialAttack, 
    format('~w performed attack\n', [Type]),
    format('~w deal ~d damage\n', [Type, Damage]), 
    playerDamaged(Damage),!.

enemyMove(1) :-
    player(_, _, _, _, DefensePlayer, _, _, _, _),
    enemy(Type, _, _, AttackEnemy, _),
    A is AttackEnemy - 5,
    B is AttackEnemy + 6, random(A, B, Attack),
    C is DefensePlayer - 2,
    D is DefensePlayer + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    Damage >= 0,
    checkEnemySpecialAttack, 
    format('~w performed attack\n', [Type]),
    format('~w deal ~d damage\n', [Type, Damage]), 
    playerDamaged(Damage),!.

/* special attack */
enemyMove(2) :-
    player(_, _, _, _, DefensePlayer, _, _, _, _),
    enemy(Type, _, _, AttackEnemy, _),
    A is 2 * AttackEnemy - 5, B is 2 * AttackEnemy + 6, random(A, B, Attack),
    C is DefensePlayer - 2, D is DefensePlayer + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    Damage >= 0,
    format('~w performed special attack\n', [Type]),
    format('~w deal ~d damage\n', [Type, Damage]), 
    playerDamaged(Damage), 
    retract(enemySpecialAttack(_)),
    asserta(enemySpecialAttack(2)), !.

enemyMove(2) :-
    player(_, _, _, _, DefensePlayer, _, _, _, _),
    enemy(Type, _, _, AttackEnemy, _),
    A is 2 * AttackEnemy - 5, B is 2 * AttackEnemy + 6, random(A, B, Attack),
    C is DefensePlayer - 2, D is DefensePlayer + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    Damage =< 0, Damage is 0,
    format('~w performed special attack\n', [Type]),
    format('~w deal ~d damage\n', [Type, Damage]), 
    playerDamaged(Damage), 
    retract(enemySpecialAttack(_)),
    asserta(enemySpecialAttack(2)), !.

% kayaknya ada masalah disini tapi gatau kenapa

randomEnemyMove(X) :- 
    X =:= 0,
    random(1,3,Move),
    enemyMove(Move),!.

randomEnemyMove(X) :-
    X > 0,
    enemyMove(1),!.

enemyDamaged(Damage) :- Damage < 1, !.

enemyDamaged(Damage) :-
    Damage > 0,
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy),
    NewHP is HPEnemy - Damage,
    NewHP > 0,
    retract(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)),
    asserta(enemy(Type, LevelEnemy, NewHP, AttackEnemy, DefenseEnemy)).

enemyDamaged(Damage) :-
    Damage > 0,
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy),
    NewHP is HPEnemy - Damage,
    NewHP < 1,
    retract(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    format('You defeated a ~w!', [Type]), !.

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
    enemy(_, _, _, _, DefenseEnemy),
    A is AttackPlayer - 5, B is AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense, 
    Damage >= 0,
    format('You deal ~d damage\n', [Damage]), 
    enemyDamaged(Damage), checkSpecialAttack,
    enemySpecialAttack(X), randomEnemyMove(X), !.

attack :-
    inBattle(1),
    player(_, _, _, AttackPlayer, _, _, _, _, _),
    enemy(_, _, _, _, DefenseEnemy),
    A is AttackPlayer - 5, B is AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    Damage < 0, Damage is 0,
    format('You deal ~d damage\n', [Damage]), 
    enemyDamaged(Damage), checkSpecialAttack, 
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
    specialAttackCount(X),
    X =:= 0,
    player(_, _, _, AttackPlayer, _, _, _, _, _),
    enemy(_, _, _, _, DefenseEnemy),
    A is 2 * AttackPlayer - 5, B is 2 * AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    Damage < 0, Damage is 0,
    format('You deal ~d damage\n', [Damage]), 
    enemyDamaged(Damage),
    retract(specialAttackCount(_)),
    asserta(specialAttackCount(2)),
    enemySpecialAttack(X), randomEnemyMove(X), !.

specialattack :-
    inBattle(1),
    specialAttackCount(X),
    X =:= 0,
    player(_, _, _, AttackPlayer, _, _, _, _, _),
    enemy(_, _, _, _, DefenseEnemy),
    A is 2 * AttackPlayer - 5, B is 2 * AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    Damage >= 0,
    format('You deal ~d damage\n', [Damage]),
    enemyDamaged(Damage), 
    retract(specialAttackCount(_)),
    asserta(specialAttackCount(2)),
    enemySpecialAttack(X), randomEnemyMove(X), !.

run :-
    random(1,3,X),
    runSucceed(X), !.

runSucceed(1) :- 
    write('You managed to run!'), 
    retractall(enemy(_,_,_,_,_)), 
    retract(inBattle(1)),
    asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), !.

runSucceed(2) :- write('You failed to run!\nChoose another move!'), !.

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
initEnemy(5) :-
    write('Your boss gave you a milestone to finish!'),
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 20 + 50,
    AttackEnemy is (LevelEnemy - 1) * 2 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    asserta(enemy('Milestone', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)),
    asserta(specialAttackCount(0)),
    asserta(enemySpecialAttack(0)), 
    retract(inBattle(0)),
    asserta(inBattle(1)), !.

initEnemy(10) :-
    write('There is a maintenance you need to do!'), 
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 50,
    AttackEnemy is (LevelEnemy - 1) * 4 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    asserta(enemy('Maintenance', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)), 
    asserta(enemySpecialAttack(0)),
    asserta(specialAttackCount(0)),
    retract(inBattle(0)),
    asserta(inBattle(1)), !.

initEnemy(15) :-
    write('A data breach has happened!'),
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 50,
    AttackEnemy is (LevelEnemy - 1) * 2 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 4 + 10,
    asserta(enemy('Data Breach', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)), 
    asserta(enemySpecialAttack(0)),
    asserta(specialAttackCount(0)),
    retract(inBattle(0)),
    asserta(inBattle(1)), !.

/* initEnemy(X) :- X \= 5, X \= 10, X \= 15, !. */

randomEnemy :-
    random(0,20,X),
    initEnemy(X), !.

/*pas attack, kalo HP enemynya udah 0, berarti bisa dikalahkan.
kalo udah kalah, quest - 1, update tuple quest*/
