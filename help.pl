/* includes */

/* commands */
help:-
    opened(_),
    nl,
    write('██╗░░██╗███████╗██╗░░░░░██████╗░\n'),
    write('██║░░██║██╔════╝██║░░░░░██╔══██╗\n'),
    write('███████║█████╗░░██║░░░░░██████╔╝\n'),
    write('██╔══██║██╔══╝░░██║░░░░░██╔═══╝░\n'),
    write('██║░░██║███████╗███████╗██║░░░░░\n'),
    write('╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░░░░\n'),
    helpChoice, !.

help:-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n').

helpChoice:-
    nl,
    write('Welcome to the help menu!\n'),
    write('1. How to play\n'),
    write('2. Commands\n'),
    write('3. Story\n'),
    write('4. Credits\n'),
    write('5. Exit\n'),
    write('Enter your choice: '),
    read(X), nl,
    helpMenu(X), !.

helpMenu(1):-
    nl,
    write('█░█ █▀█ █░█░█   ▀█▀ █▀█   █▀█ █░░ ▄▀█ █▄█\n'),
    write('█▀█ █▄█ ▀▄▀▄▀   ░█░ █▄█   █▀▀ █▄▄ █▀█ ░█░\n'),
    nl,
    write('Startup is a survival role-playing game\n'),
    write('that sets inside an office named Samsan Tech.\n'),
    write('Explore the office by using the keys \'w\', \'a\',\n'),
    write('\'s\', or \'d\''),nl,nl,
    write('Each time you move, you can encounter a random\n'),
    write('enemy. Defeat them to gain money and experience.\n'),
    write('The money you gained can be spent inside the shop.\n'),
    write('For extra income, you can accept tasks from the\n'), 
    write('task board.'),nl,nl,
    write('To win the game, you must defeat the boss that\n'),
    write('located on the bottom of the office. You have\n'),
    write('3 hearts when starting the game. If you lost all\n'),
    write('hearts, you will be fired and the game will end.\n'),nl,nl,
    write('1. Back\n0. Exit\n'),
    write('Enter your choice: '),
    read(X),
    helpBack(X), !.

helpMenu(2):-
    nl,
    write('█▀▀ █▀█ █▀▄▀█ █▀▄▀█ ▄▀█ █▄░█ █▀▄ █▀\n'),
    write('█▄▄ █▄█ █░▀░█ █░▀░█ █▀█ █░▀█ █▄▀ ▄█\n'),
    nl,
    write('   save   : save your game\n'),
    write('   load   : load previously saved game\n'),
    write('   map    : view map\n'),
    write('   status : view current status\n'),
    write('   task   : view running tasks\n'),
    write('   w      : move north\n'),
    write('   s      : move south\n'),
    write('   d      : move east\n'),
    write('   a      : move west\n'),
    write('   code   : start coding! (in-battle only\n'),
    write('   stackoverflow : look up stackoverflow to\n'),
    write('                   significantly damage\n'),
    write('                   your opponent! (in-battle only)\n'),
    write('   vacation      : take a vacation from a\n'),
    write('                   battle (in-battle only)\n'),nl,nl,
    write('1. Back\n0. Exit\n'),
    write('Enter your choice: '),
    read(X),
    helpBack(X), !.

helpMenu(3):-
    nl,
    write('█▀ ▀█▀ █▀█ █▀█ █▄█\n'),
    write('▄█ ░█░ █▄█ █▀▄ ░█░\n'),
    nl,
    write('Seo Dalmi is an ordinary woman that dreams on being\n'),
    write('the greatest programmer in the world. In order to do\n'),
    write('that, she decided to join an aspiring startup company\n'),
    write('called Samsan Tech, even though she knows that she\n'),
    write('have zero knowledge about programming.\n'),nl,
    write('Help Dalmi decide her fate inside this new environment\n'),
    write('and help her achieve her dream!\n'),
    nl,nl,
    write('1. Back\n0. Exit\n'),
    write('Enter your choice: '),
    read(X),
    helpBack(X), !.

helpMenu(4):-
    nl,
    write('█▀▀ █▀█ █▀▀ █▀▄ █ ▀█▀ █▀\n'),
    write('█▄▄ █▀▄ ██▄ █▄▀ █ ░█░ ▄█\n'),
    nl,
    write('Developers:\n'),
    write(' 13519040 - Shafira Naya Aprisadianti\n'),
    write(' 13519100 - Aulia Adila\n'),
    write(' 13519104 - Nabelanita Utami\n'),
    write(' 13519192 - Gayuh Tri Rahutami\n'),
    nl,
    write('Special thanks to the drama \'Start-Up\' for\n'),
    write('the inspiration of making this game.'),
    nl,nl,
    write('1. Back\n0. Exit\n'),
    write('Enter your choice: '),
    read(X),
    helpBack(X), !.


helpMenu(_):- !.


helpBack(1) :-
    helpChoice, !.
helpBack(_) :- !.