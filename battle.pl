/*player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)*/
/* enemy(Type, LevelEnemy, HpEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus) */

goalState :-
    retract(inBattle(1)),
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)),
    nl,nl,
    write('                                                ▐                 ▌\n'),
    write('                                             █▀▀█                 █▀▀█\n'),
    write('                                             ▌  █▒      ██░       █  ▐\n'),
    write('                                             ▌  █▒▒      █░       █  ▐\n'),
    write('                                             ▀ ▄▄█▒▒     █░       █▄ ▀\n'),
    write('                                                  █▒▒           █\n'),
    write('                                                    █▒▒       █▌\n'),
    write('                                                     █████████\n'),
    write('                                                        ██▒\n'),
    write('                                                        ██▒\n'),
    write('                                                        ██▒\n'),
    write('                                                       █████\n'),
    write('                                                   ███▒     ▒███\n'),
    write('                                                  ██▒▒       ▒▒██\n\n\n'),

    write('░█████╗░░█████╗░███╗░░██╗░██████╗░██████╗░░█████╗░████████╗██╗░░░██╗██╗░░░░░░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗\n'),
    write('██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔══██╗██╔══██╗╚══██╔══╝██║░░░██║██║░░░░░██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝\n'),
    write('██║░░╚═╝██║░░██║██╔██╗██║██║░░██╗░██████╔╝███████║░░░██║░░░██║░░░██║██║░░░░░███████║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░\n'),
    write('██║░░██╗██║░░██║██║╚████║██║░░╚██╗██╔══██╗██╔══██║░░░██║░░░██║░░░██║██║░░░░░██╔══██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗\n'),
    write('╚█████╔╝╚█████╔╝██║░╚███║╚██████╔╝██║░░██║██║░░██║░░░██║░░░╚██████╔╝███████╗██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝\n'),
    write('░╚════╝░░╚════╝░╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░\n\n'),

    write('             ██╗░░░██╗░█████╗░██╗░░░██╗  ██╗░░██╗░█████╗░██╗░░░██╗███████╗  ░██╗░░░░░░░██╗░█████╗░███╗░░██╗\n'),
    write('             ╚██╗░██╔╝██╔══██╗██║░░░██║  ██║░░██║██╔══██╗██║░░░██║██╔════╝  ░██║░░██╗░░██║██╔══██╗████╗░██║\n'),
    write('             ░╚████╔╝░██║░░██║██║░░░██║  ███████║███████║╚██╗░██╔╝█████╗░░  ░╚██╗████╗██╔╝██║░░██║██╔██╗██║\n'),
    write('             ░░╚██╔╝░░██║░░██║██║░░░██║  ██╔══██║██╔══██║░╚████╔╝░██╔══╝░░  ░░████╔═████║░██║░░██║██║╚████║\n'),
    write('             ░░░██║░░░╚█████╔╝╚██████╔╝  ██║░░██║██║░░██║░░╚██╔╝░░███████╗  ░░╚██╔╝░╚██╔╝░╚█████╔╝██║░╚███║\n'),
    write('             ░░░╚═╝░░░░╚════╝░░╚═════╝░  ╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝  ░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚══╝\n\n'),
    
    write('             ▐░             ████████╗██╗░░██╗███████╗  ░██████╗░░█████╗░███╗░░░███╗███████╗             ▐░\n'),
    write('             ▐░             ╚══██╔══╝██║░░██║██╔════╝  ██╔════╝░██╔══██╗████╗░████║██╔════╝             ▐░\n'),
    write('             ▐░             ░░░██║░░░███████║█████╗░░  ██║░░██╗░███████║██╔████╔██║█████╗░░             ▐░\n'),
    write('             █▌░            ░░░██║░░░██╔══██║██╔══╝░░  ██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░             █▌░\n'),
    write('           ▄█░ █▄░          ░░░██║░░░██║░░██║███████╗  ╚██████╔╝██║░░██║██║░╚═╝░██║███████╗           ▄█░ █▄░\n'),
    write('          █░     █          ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝          █░     █ \n'), 
    write('     ▄▄ ▀░         ▀ ▄▄                                                                         ▄▄ ▀░         ▀ ▄▄\n'),
    write('          █▄    ▄█░                                                                                  █▄    ▄█░\n'),
    write('            █░ █░                                                                                      █░ █░\n'),
    write('             █▌░                                                                                        █▌░\n'),
    write('             ▐░                                                                                         ▐░\n'),
    write('             ▐░                                                                                         ▐░\n'),
    write('             ▐░                                                                                         ▐░\n'),
    retractstuff,nl,nl,nl,nl,
    write('Press any key to continue. '),
    read(X),nl,nl,nl,nl,
    backToMenu(X), !.

backToMenu(_) :- openGame, !.

battleCommandList :-
    nl,
    write('   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('   %                  B A T T L E  C O M M A N D S                 %\n'),
    write('   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('   %   code           : to write code for your program             %\n'),
    write('   %   stackoverflow  : to ask for help in stack overflow          %\n'),
    write('   %   vacation       : to ask for a vacation to your boss and     %\n'),
    write('   %                    give your current task to your co-worker   %\n'),
    write('   %                                                               %\n'),
    write('   %   You can also use potion in the middle of battle.            %\n'),
    write('   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n').

enemyType('Work Stolen') :-
    write('          █░█░█ █▀█ █▀█ █▄▀   █▀ ▀█▀ █▀█ █░░ █▀▀ █▄░█\n'),
    write('          ▀▄▀▄▀ █▄█ █▀▄ █░█   ▄█ ░█░ █▄█ █▄▄ ██▄ █░▀█\n'), !.

enemyType('Data Breach') :-
    write('          █▀▄ ▄▀█ ▀█▀ ▄▀█   █▄▄ █▀█ █▀▀ ▄▀█ █▀▀ █░█\n'),
    write('          █▄▀ █▀█ ░█░ █▀█   █▄█ █▀▄ ██▄ █▀█ █▄▄ █▀█\n'), !.

enemyType('Maintenance') :-
    write('          █▀▄▀█ ▄▀█ █ █▄░█ ▀█▀ █▀▀ █▄░█ ▄▀█ █▄░█ █▀▀ █▀▀\n'),
    write('          █░▀░█ █▀█ █ █░▀█ ░█░ ██▄ █░▀█ █▀█ █░▀█ █▄▄ ██▄\n'), !.

enemyType('Milestone') :-
    write('          █▀▄▀█ █ █░░ █▀▀ █▀ ▀█▀ █▀█ █▄░█ █▀▀\n'),
    write('          █░▀░█ █ █▄▄ ██▄ ▄█ ░█░ █▄█ █░▀█ ██▄\n'), !.

newTask :-
    write('   █▄█ █▀█ █░█   █▀▀ █▀█ ▀█▀   ▄▀█   █▄░█ █▀▀ █░█░█   ▀█▀ ▄▀█ █▀ █▄▀   ▀█▀ █▀█   █▀▄ █▀█\n'),
    write('   ░█░ █▄█ █▄█   █▄█ █▄█ ░█░   █▀█   █░▀█ ██▄ ▀▄▀▄▀   ░█░ █▀█ ▄█ █░█   ░█░ █▄█   █▄▀ █▄█\n'), !.

/* initEnemy */
enemyStatus :-
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    nl, enemyType(Type),
    nl,
    format('  LVL. ~d', [LevelEnemy]),
    write('  HP: '),
    Y is HPEnemy // 5,
    forall(between(0,Y,B),(write('▒'))), 
    format(' ~d\n', [HPEnemy]),
    format('          ATK. ~d\n          DEF. ~d\n', [AttackEnemy, DefenseEnemy]), !.

remainingHearts(2):-
    write('                   ██ ██       ██ ██       ██   █\n'),
    write('                  █▒▒█▒▒█     █▒▒█▒▒█     █▒▒█ █▒█\n'),
    write('                  █▒▒▒▒▒█     █▒▒▒▒▒█     █▒▒█ █▒█\n'),
    write('                   █▒▒▒█       █▒▒▒█       █▒█ █▒█\n'),
    write('                    ███         ███         █ ███\n'),nl,
    write('             █░░ █▀█ █▀ ▀█▀   ▄▀█   █░█ █▀▀ ▄▀█ █▀█ ▀█▀   ▀ ▄▀\n'),
    write('             █▄▄ █▄█ ▄█ ░█░   █▀█   █▀█ ██▄ █▀█ █▀▄ ░█░   ▄ ▀▄\n'),!.

remainingHearts(1):-
    write('                   ██ ██       ██   █       ██   █\n'),
    write('                  █▒▒█▒▒█     █▒▒█ █▒█     █▒▒█ █▒█\n'),
    write('                  █▒▒▒▒▒█     █▒▒█ █▒█     █▒▒█ █▒█\n'),
    write('                   █▒▒▒█       █▒█ █▒█      █▒█ █▒█\n'),
    write('                    ███         █ ███        █ ███\n'),nl,
    write('             █░░ █▀█ █▀ ▀█▀   ▄▀█   █░█ █▀▀ ▄▀█ █▀█ ▀█▀   ▀ ▄▀\n'),
    write('             █▄▄ █▄█ ▄█ ░█░   █▀█   █▀█ ██▄ █▀█ █▀▄ ░█░   ▄ ▀▄\n'),!.

remainingHearts(0):-
    write('                   ██   █        ██   █       ██   █\n'),
    write('                  █▒▒█ █▒█      █▒▒█ █▒█     █▒▒█ █▒█\n'),
    write('                  █▒▒█ █▒█      █▒▒█ █▒█     █▒▒█ █▒█\n'),
    write('                   █▒█ █▒█       █▒█ █▒█      █▒█ █▒█\n'),
    write('                    █ ███         █ ███        █ ███\n'),nl,
    write('             █░░ █▀█ █▀ ▀█▀   ▄▀█   █░█ █▀▀ ▄▀█ █▀█ ▀█▀   ▀ ▄▀\n'),
    write('             █▄▄ █▄█ ▄█ ░█░   █▀█   █▀█ ██▄ █▀█ █▀▄ ░█░   ▄ ▀▄\n'),!.

%belom game over

 checkPlayerDefeated(1) :-
    player(_, _, _, _, _, _, HP, _, _),
    HP > 0, nl,
    write('   █▀▀ █▀█ █▄░█ ▀█▀ █ █▄░█ █░█ █▀▀   █▄█ █▀█ █░█ █▀█   █░█░█ █▀█ █▀█ █▄▀\n'),
    write('   █▄▄ █▄█ █░▀█ ░█░ █ █░▀█ █▄█ ██▄   ░█░ █▄█ █▄█ █▀▄   ▀▄▀▄▀ █▄█ █▀▄ █░█\n\n'), !.

 checkPlayerDefeated(0) :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    HP =< 0,
    retract(chancetorun(_)),
    NewHearts is Hearts - 1,
    NewHearts > 0, 
    write('   █▄█ █▀█ █░█   █▀▄ █ █▀▄ █▄░█ ▀ ▀█▀   █▀▀ █ █▄░█ █ █▀ █░█ █▀▀ █▀▄\n'),
    write('   ░█░ █▄█ █▄█   █▄▀ █ █▄▀ █░▀█ ░ ░█░   █▀░ █ █░▀█ █ ▄█ █▀█ ██▄ █▄▀ \n\n'),

    write('   █▄█ █▀█ █░█ █▀█   █░█░█ █▀█ █▀█ █▄▀   █▀█ █▄░█   ▀█▀ █ █▀▄▀█ █▀▀\n'),
    write('   ░█░ █▄█ █▄█ █▀▄   ▀▄▀▄▀ █▄█ █▀▄ █░█   █▄█ █░▀█   ░█░ █ █░▀░█ ██▄\n\n'),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    remainingHearts(NewHearts),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, MaxHP, NewHearts, Gold)),
    retract(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),!.

%game over
%keknya nanti bikin fungsi game over aja buat ngeretract smua database
checkPlayerDefeated(0) :-
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    HP =< 0,
    retract(chancetorun(_)),
    NewHearts is Hearts - 1,
    NewHearts =< 0, 
    write('   █▄█ █▀█ █░█   █▀▄ █ █▀▄ █▄░█ ▀ ▀█▀   █▀▀ █ █▄░█ █ █▀ █░█ \n'),
    write('   ░█░ █▄█ █▄█   █▄▀ █ █▄▀ █░▀█ ░ ░█░   █▀░ █ █░▀█ █ ▄█ █▀█ \n\n'),

    write('   █▄█ █▀█ █░█ █▀█   █░█░█ █▀█ █▀█ █▄▀   █▀█ █▄░█   ▀█▀ █ █▀▄▀█ █▀▀\n'),
    write('   ░█░ █▄█ █▄█ █▀▄   ▀▄▀▄▀ █▄█ █▀▄ █░█   █▄█ █░▀█   ░█░ █ █░▀░█ ██▄\n\n'),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    remainingHearts(NewHearts),nl,nl,nl,nl,
    write('██╗░░░██╗░█████╗░██╗░░░██╗██╗██████╗░███████╗  ███████╗██╗██████╗░███████╗██████╗░░░░'),nl,
    write('╚██╗░██╔╝██╔══██╗██║░░░██║╚█║██╔══██╗██╔════╝  ██╔════╝██║██╔══██╗██╔════╝██╔══██╗░░░'),nl,
    write('░╚████╔╝░██║░░██║██║░░░██║░╚╝██████╔╝█████╗░░  █████╗░░██║██████╔╝█████╗░░██║░░██║░░░'),nl,
    write('░░╚██╔╝░░██║░░██║██║░░░██║░░░██╔══██╗██╔══╝░░  ██╔══╝░░██║██╔══██╗██╔══╝░░██║░░██║░░░'),nl,
    write('░░░██║░░░╚█████╔╝╚██████╔╝░░░██║░░██║███████╗  ██║░░░░░██║██║░░██║███████╗██████╔╝██╗'),nl,
    write('░░░╚═╝░░░░╚════╝░░╚═════╝░░░░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝'),nl,nl,
    retractstuff,nl,nl,nl,nl,
    write('Press any key to continue. '),
    read(X),nl,nl,nl,nl,
    openGame, !.

playerDamaged(Damage, 0) :- Damage < 1, 

    write('      █▄█ █▀█ █░█   █▀ ▀█▀ █ █░░ █░░   █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▀ █▀▄\n'),
    write('      ░█░ █▄█ █▄█   ▄█ ░█░ █ █▄▄ █▄▄   █░▀░█ █▀█ █░▀█ █▀█ █▄█ ██▄ █▄▀\n\n'),

    write('   ▀█▀ █▀█   █▀▀ █▀▀ ▀█▀   █▀▀ █▄░█ █▀█ █░█ █▀▀ █░█   █▀ █░░ █▀▀ █▀▀ █▀█\n'),
    write('   ░█░ █▄█   █▄█ ██▄ ░█░   ██▄ █░▀█ █▄█ █▄█ █▄█ █▀█   ▄█ █▄▄ ██▄ ██▄ █▀▀\n\n\n'),!.

playerDamaged(Damage, Damage) :-
    Damage > 0,

    write('   █▄█ █▀█ █░█ █▀█   █▀ ▀█▀ ▄▀█ █▀▄▀█ █ █▄░█ ▄▀█   █▀▄ █▀▀ █▀█ █░░ █▀▀ ▀█▀ █▀▀ █▀▄\n'),
    write('   ░█░ █▄█ █▄█ █▀▄   ▄█ ░█░ █▀█ █░▀░█ █ █░▀█ █▀█   █▄▀ ██▄ █▀▀ █▄▄ ██▄ ░█░ ██▄ █▄▀\n\n\n'), 

    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    NewHP is HP - Damage,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, NewHP, Hearts, Gold)),
    healthstatus, !.

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
    Damage is Attack - Defense, nl, nl,
    write('       █▄█ █▀█ █░█   █▀▀ █▀█ █░█ █▄░█ █▀▄\n'),
    write('       ░█░ █▄█ █▄█   █▀░ █▄█ █▄█ █░▀█ █▄▀\n\n'),

    write('   ▄▀█   █▀▄▀█ █ █▄░█ █▀█ █▀█   █▄▄ █░█ █▀▀ █\n'),
    write('   █▀█   █░▀░█ █ █░▀█ █▄█ █▀▄   █▄█ █▄█ █▄█ ▄\n\n\n'),
    playerDamaged(Damage, ActualDamage),
    checkEnemySpecialAttack,
    checkPlayerDefeated(X), !.

/* special attack */
enemyMove(2) :-
    player(_, _, _, _, DefensePlayer, _, _, _, _),
    enemy(Type, _, _, AttackEnemy, _, _, _),
    A is 2 * AttackEnemy - 5, B is 2 * AttackEnemy + 6, random(A, B, Attack),
    C is DefensePlayer - 2, D is DefensePlayer + 3, random(C, D, Defense),
    Damage is Attack - Defense, nl,nl,
    write('   █▄█ █▀█ █░█ █▀█   █▄▄ █▀█ █▀ █▀   ▄▀█ █▀ █▄▀ █▀▀ █▀▄   █▄█ █▀█ █░█\n'),
    write('   ░█░ █▄█ █▄█ █▀▄   █▄█ █▄█ ▄█ ▄█   █▀█ ▄█ █░█ ██▄ █▄▀   ░█░ █▄█ █▄█\n\n'),

    write('    ▀█▀ █▀█   █▀█ █▀▀ █▀▄ █▀█   █▄█ █▀█ █░█ █▀█   █░█░█ █▀█ █▀█ █▄▀\n'),
    write('    ░█░ █▄█   █▀▄ ██▄ █▄▀ █▄█   ░█░ █▄█ █▄█ █▀▄   ▀▄▀▄▀ █▄█ █▀▄ █░█\n\n\n'),
    playerDamaged(Damage, ActualDamage),
    retract(enemySpecialAttack(_)),
    asserta(enemySpecialAttack(2)), checkPlayerDefeated(X),!.

 checkEnemyDefeated(1) :-
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    HPEnemy > 0, !.

 checkEnemyDefeated(0) :-
    enemy('Work Stolen', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    HPEnemy =< 0,
    retract(chancetorun(_)), 
    retract(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    write('█▄█ █▀█ █░█ ▀ █░█ █▀▀   █▀▄ █▀▀ █▀▀ █▀▀ ▄▀█ ▀█▀ █▀▀ █▀▄   ▀█▀ █░█ █▀▀   █▄▄ █▀█ █▀ █▀\n'),
    write('░█░ █▄█ █▄█ ░ ▀▄▀ ██▄   █▄▀ ██▄ █▀░ ██▄ █▀█ ░█░ ██▄ █▄▀   ░█░ █▀█ ██▄   █▄█ █▄█ ▄█ ▄█\n\n'), 
    goalState, !.

 checkEnemyDefeated(0) :-
    enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    HPEnemy =< 0,
    retract(chancetorun(_)),
    retract(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    retract(inBattle(1)), asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)), 
    write('  █▄█ █▀█ █░█   █▀▀ █ █▄░█ █ █▀ █░█ █▀▀ █▀▄   █▄█ █▀█ █░█ █▀█\n'),
    write('  ░█░ █▄█ █▄█   █▀░ █ █░▀█ █ ▄█ █▀█ ██▄ █▄▀   ░█░ █▄█ █▄█ █▀▄ \n\n'),

    write('         █░█░█ █▀█ █▀█ █▄▀   █▀█ █▄░█   ▀█▀ █ █▀▄▀█ █▀▀\n'),
    write('         ▀▄▀▄▀ █▄█ █▀▄ █░█   █▄█ █░▀█   ░█░ █ █░▀░█ ██▄\n\n'),
    finishQuest(Type),
    player(Role, Level, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    NewGold is Gold + GoldBonus,
    retract(player(Role, Level, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, Level, Exp, Attack, Defense, MaxHP, HP, Hearts, NewGold)),
    addExp(ExpBonus),!.

randomEnemyMove(X) :- 
    checkEnemyDefeated(Status), 
    Status =:= 0, !.

randomEnemyMove(X) :- 
    X =:= 0,
    checkEnemyDefeated(Status),
    Status =:= 1,
    enemyStatus,
    random(1,3,Move),
    enemyMove(Move),!.

randomEnemyMove(X) :-
    X > 0,
    checkEnemyDefeated(Status),
    Status =:= 1,
    enemyStatus,
    enemyMove(1),!.

enemyDamaged(Damage) :- 
    Damage < 1, 
    write('   You wrote 0 lines of code\n\n'), !.

enemyDamaged(Damage) :-
    Damage > 0,
    format('   You wrote ~d lines of code\n\n', [Damage]),
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

code :-
    inBattle(0),
    write('You\'re currently not in a battle!'),!.
    
code :-
    inBattle(1),
    nl, nl,
    write('   █▀▀ █▀█ █▀▄ █▀▀ █\n'),
    write('   █▄▄ █▄█ █▄▀ ██▄ ▄\n\n'),
    player(_, _, _, AttackPlayer, _, _, _, _, _),
    enemy(_, _, _, _, DefenseEnemy, _, _),
    A is AttackPlayer - 5, B is AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense, 
    enemyDamaged(Damage),  
    retract(chancetorun(_)), 
    asserta(chancetorun(0)),
    checkSpecialAttack,
    enemySpecialAttack(X), randomEnemyMove(X), !.

stackoverflow :-
    inBattle(0),
    write('   You\'re currently not in a battle!'),!.

stackoverflow :-
    inBattle(1),
    specialAttackCount(X),
    X > 0, nl, nl,
    write('   █▄█ █▀█ █░█ █▀█   █ █▄░█ ▀█▀ █▀▀ █▀█ █▄░█ █▀▀ ▀█▀   █ █▀   █▀▄ █▀█ █░█░█ █▄░█   ▀ ▄▀\n'),
    write('   ░█░ █▄█ █▄█ █▀▄   █ █░▀█ ░█░ ██▄ █▀▄ █░▀█ ██▄ ░█░   █ ▄█   █▄▀ █▄█ ▀▄▀▄▀ █░▀█   ▄ ▀▄\n\n\n'),!.

stackoverflow :-
    inBattle(1),
    specialAttackCount(0), nl, nl,
    write('   █▀ ▀█▀ ▄▀█ █▀▀ █▄▀   █▀█ █░█ █▀▀ █▀█ █▀▀ █░░ █▀█ █░█░█ █\n'),
    write('   ▄█ ░█░ █▀█ █▄▄ █░█   █▄█ ▀▄▀ ██▄ █▀▄ █▀░ █▄▄ █▄█ ▀▄▀▄▀ ▄\n\n\n'),
    player(_, _, _, AttackPlayer, _, _, _, _, _),
    enemy(_, _, _, _, DefenseEnemy, _, _),
    A is 2 * AttackPlayer - 5, B is 2 * AttackPlayer + 6, random(A, B, Attack),
    C is DefenseEnemy - 2, D is DefenseEnemy + 3, random(C, D, Defense),
    Damage is Attack - Defense,
    enemyDamaged(Damage),
    retract(specialAttackCount(_)),
    asserta(specialAttackCount(2)),
    retract(chancetorun(_)), 
    asserta(chancetorun(1)),
    enemySpecialAttack(X), randomEnemyMove(X), !.

vacation :-
    chancetorun(0),nl,
    write('   █░█ █▀▄ █▀█ █▄░█ ▀ ▀█▀   █▄▄ █▀▀   █░░ ▄▀█ ▀█ █▄█ █ █░█\n'),
    write('   ░░░ █▄▀ █▄█ █░▀█ ░ ░█░   █▄█ ██▄   █▄▄ █▀█ █▄ ░█░ ▄ ░░░\n\n\n'),
    enemyMove(1), !.

vacation :-
    chancetorun(1),
    random(1,3,X),
    runSucceed(X), !.

runSucceed(1) :- 
    enemy('Work Stolen', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus),
    nl,
    write('   █▀▄ ▄▀█ █▄█   █▀█ █▀▀ █▀▀   █ █ █\n'),
    write('   █▄▀ █▀█ ░█░   █▄█ █▀░ █▀░   ▄ ▄ ▄\n\n\n'),
    retractall(boss(_,_,_,_,_)),
    asserta(boss(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy)),
    retractall(enemy(_,_,_,_,_,_,_)), 
    retract(chancetorun(_)),
    retract(inBattle(1)),
    asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)),!.

runSucceed(1) :- 
    enemy(Type,_,_,_,_,_,_),
    Type \= 'Work Stolen',nl,
    write('   █▀▄ ▄▀█ █▄█   █▀█ █▀▀ █▀▀   █ █ █\n'),
    write('   █▄▀ █▀█ ░█░   █▄█ █▀░ █▀░   ▄ ▄ ▄\n\n\n'),
    retractall(enemy(_,_,_,_,_,_,_)), 
    retract(chancetorun(_)),
    retract(inBattle(1)),
    asserta(inBattle(0)), 
    retract(specialAttackCount(_)),
    retract(enemySpecialAttack(_)),!.



runSucceed(2) :- 
    nl,
    write('   █░█ █▀▄ █▀█ █▄░█ ▀ ▀█▀   █▄▄ █▀▀   █░░ ▄▀█ ▀█ █▄█ █ █░█\n'),
    write('   ░░░ █▄▀ █▄█ █░▀█ ░ ░█░   █▄█ ██▄   █▄▄ █▀█ █▄ ░█░ ▄ ░░░\n\n\n'), 
    retract(chancetorun(_)), 
    asserta(chancetorun(0)),
    enemyMove(1),!.

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
    newTask,
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 15 + 80,
    AttackEnemy is (LevelEnemy - 1) * 2 + 15,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    GoldBonus is LevelEnemy * 15,
    ExpBonus is LevelEnemy * 5,
    asserta(enemy('Milestone', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    asserta(specialAttackCount(0)),
    asserta(enemySpecialAttack(0)), 
    asserta(chancetorun(1)),
    retract(inBattle(0)),
    asserta(inBattle(1)),
    enemyStatus, 
    battleCommandList, !.

initEnemy(6) :-
    newTask, 
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 65,
    AttackEnemy is (LevelEnemy - 1) * 4 + 20,
    DefenseEnemy is (LevelEnemy - 1) * 2 + 10,
    GoldBonus is LevelEnemy * 15,
    ExpBonus is LevelEnemy * 5,
    asserta(enemy('Maintenance', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    asserta(enemySpecialAttack(0)),
    asserta(specialAttackCount(0)),
    asserta(chancetorun(1)),
    retract(inBattle(0)),
    asserta(inBattle(1)),
    enemyStatus,
    battleCommandList, !.

initEnemy(9) :-
    newTask,
    player(_, Level, _, _, _, _, _, _, _),
    randomLevel(Level, LevelEnemy),
    HPEnemy is (LevelEnemy - 1) * 10 + 65,
    AttackEnemy is (LevelEnemy - 1) * 2 + 15,
    DefenseEnemy is (LevelEnemy - 1) * 4 + 12,
    GoldBonus is LevelEnemy * 15,
    ExpBonus is LevelEnemy * 5,
    asserta(enemy('Data Breach', LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, GoldBonus, ExpBonus)),
    asserta(enemySpecialAttack(0)),
    asserta(specialAttackCount(0)),
    asserta(chancetorun(1)),
    retract(inBattle(0)),
    asserta(inBattle(1)), 
    enemyStatus,
    battleCommandList, !.

initEnemy(X) :- X \= 3, X \= 6, X \= 9, !.

randomEnemy :-
    playerPos(X,Y),
    X =< 4, Y =< 10,
    random(1,4,Move),
    initEnemy(Move), !.

randomEnemy :-
    playerPos(X,Y),
    X > 4, X =< 7, Y =< 10,
    random(5,8,Move),
    initEnemy(Move), !.

randomEnemy :-
    playerPos(X,Y),
    X > 7, X =< 10, Y =< 10,
    random(7,10,Move),
    initEnemy(Move), !.

initBoss(yes) :-
    nl,
    write('░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░██╗  ░██████╗████████╗░█████╗░██╗░░░░░███████╗███╗░░██╗\n'),
    write('░██║░░██╗░░██║██╔══██╗██╔══██╗██║░██╔╝  ██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██╔════╝████╗░██║\n'),
    write('░╚██╗████╗██╔╝██║░░██║██████╔╝█████═╝░  ╚█████╗░░░░██║░░░██║░░██║██║░░░░░█████╗░░██╔██╗██║\n'),
    write('░░████╔═████║░██║░░██║██╔══██╗██╔═██╗░  ░╚═══██╗░░░██║░░░██║░░██║██║░░░░░██╔══╝░░██║╚████║\n'),
    write('░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██║░╚██╗  ██████╔╝░░░██║░░░╚█████╔╝███████╗███████╗██║░╚███║\n'),
    write('░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝  ╚═════╝░░░░╚═╝░░░░╚════╝░╚══════╝╚══════╝╚═╝░░╚══╝\n\n'),

    write('\n\n'),
    write('  █▀▄▀█ ▄▀█ █▄▀ █▀▀   ▄▀█ █▄░█ █▀█ ▀█▀ █░█ █▀▀ █▀█   █ █▄░█ █▄░█ █▀█ █░█ ▄▀█ ▀█▀ █ █▀█ █▄░█ █\n'),
    write('  █░▀░█ █▀█ █░█ ██▄   █▀█ █░▀█ █▄█ ░█░ █▀█ ██▄ █▀▄   █ █░▀█ █░▀█ █▄█ ▀▄▀ █▀█ ░█░ █ █▄█ █░▀█ ▄\n\n'),

    boss(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy),
    asserta(enemy(Type, LevelEnemy, HPEnemy, AttackEnemy, DefenseEnemy, 0, 0)),
    asserta(enemySpecialAttack(0)),
    asserta(specialAttackCount(0)),
    asserta(chancetorun(1)),
    retract(inBattle(0)),
    asserta(inBattle(1)), 
    enemyStatus, !.

initBoss(_) :- !.

/*pas attack, kalo HP enemynya udah 0, berarti bisa dikalahkan.
kalo udah kalah, quest - 1, date tuple quest*/