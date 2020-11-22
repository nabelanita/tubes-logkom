/*Include dan Dynamic*/
:- include('player.pl').
/* :- dynamic('enemy/5'). */


/* enemy(enemyId, levelEnemy, hpEnemy, attackEnemy, defenseEnemy) */

/* initEnemy */

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

initEnemy(5) :-
    write('Your boss gave you a milestone to finish!'),
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 20 + 50,
    AttackEnemy is (LevelEnemy - 1) * 2 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    asserta(enemy(1, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)), !.

initEnemy(10) :-
    write('There is a maintenance you need to do!'), 
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 50,
    AttackEnemy is (LevelEnemy - 1) * 4 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    asserta(enemy(2, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)), !.

initEnemy(15) :-
    write('A data breach has happened!'),
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 50,
    AttackEnemy is (LevelEnemy - 1) * 2 + 10,
    DefenseEnemy is (LevelEnemy - 1) * 4 + 10,
    asserta(enemy(3, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)), !.

randomEnemy :-
    random(0,20,X),
    initEnemy(X), !.