/* Includes */
:- include('map.pl').
:- include('movement.pl').
:- include('player.pl').
:- include('inventory.pl').
:- include('help.pl').
:- include('battle.pl').
:- include('quest.pl').
:- include('shop.pl').
:- include('save.pl').

:- dynamic(opened/1).
:- dynamic(started/1).
:- dynamic(inBattle/1).
:- dynamic(enemy/5). 
:- dynamic(enemySpecialAttack/1). 
:- dynamic(specialAttackCount/1). 
:- dynamic(meetEnemy/1).
:- dynamic(chancetorun/1).

openGame :-
    opened(_),
    write('The game is already open!'), !.

openGame :-
    nl,nl,
    write('         888                     888\n'),                      
    write('         888                     888\n'),                      
    write('         888                     888\n'),                      
    write('.d8888b  888888  8888b.  888d888 888888 888  888 88888b.\n'),  
    write('88K      888        "88b 888P"   888    888  888 888 "88b\n'), 
    write('"Y8888b. 888    .d888888 888     888    888  888 888  888\n'), 
    write('     X88 Y88b.  888  888 888     Y88b.  Y88b 888 888 d88P\n'), 
    write(' 88888P\'  "Y888 "Y888888 888      "Y888  "Y88888 88888P"\n'),  
    write('                                                 888\n'),      
    write('              𝙖 𝙨𝙪𝙧𝙫𝙞𝙫𝙖𝙡 𝙧𝙤𝙡𝙚𝙥𝙡𝙖𝙮𝙞𝙣𝙜 𝙜𝙖𝙢𝙚        888\n'),      
    write('                                                 888\n'),
    nl,nl,
    write('  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('  %               S T A R T  M E N U              %\n'),
    write('  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('  %   start  : start your adventure!              %\n'),
    write('  %   load   : load saved game                    %\n'),
    write('  %   help   : open help menu                     %\n'),
    write('  %   quit   : quit game                          %\n'),
    write('  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    asserta(opened(1)), !.

start :-
    opened(_),
    started(_),
    write('The game has already started!\n'),!.

start :-
    opened(_),
    logo,nl,nl,
    write('Welcome to Samsan Tech. Choose your job\n'),
    write('1. Web Developer\n'),
    write('2. ML Engineer\n'),
    write('3. Mobile Developer\n'),
    write('Enter choice: '),
    read(Job), nl,
    asserta(boss('Work Stolen', 10, 400, 100, 80)),
    asserta(quest(0,0,0)),
    welcomePlayer(Job),
    initInventory, !.

start :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n').

logo:-
    write('               ▒         ░         █\n'),
    write('              ▒▒▒       ░░░       ███\n'),
    write('             ▒▒▒▒▒     ░░░░░     █████\n'),
    write('            ▒▒▒▒▒▒▒   ░░░░░░░   ███████\n'),
    write('           ▒▒▒▒▒▒▒▒▒ ░░░░░░░░░ █████████\n'),
    write('          ▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░██████████\n'),
    write('         ▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░██████████\n'),
    write('        ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░██████████\n'),
    write('       ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░██████████\n'),
    write('      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░██████████\n'),
    nl,
    write('          ██    █      ██    █    ███  █ █\n'),
    write('          ██    █      ██    █    █    █ █\n'),
    write('          ██    ███    ██    ███  ███ ██ █\n'),
    write('        ██  ██  █    ██  ██  █    █    █ █\n'),
    write('       ██    ██ █   ██    ██ █     ██  █ █\n'),
    nl,
    write('       ██████████   █             ████████\n'),
    write('       █        █   █                    █\n'),
    write('        ████████     █████████         ██\n'),
    nl,
    write('  ▒▒▒ ▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒ ▒  ▒   ▒▒▒ ▒▒▒ ▒▒▒ ▒ ▒\n'),
    write('  ▒   ▒  ▒ ▒ ▒ ▒ ▒   ▒  ▒ ▒▒ ▒    ▒  ▒   ▒   ▒ ▒\n'),
    write('   ▒  ▒▒▒▒ ▒   ▒  ▒  ▒▒▒▒ ▒▒▒▒    ▒  ▒▒▒ ▒   ▒▒▒\n'),
    write('    ▒ ▒  ▒ ▒   ▒   ▒ ▒  ▒ ▒ ▒▒    ▒  ▒   ▒   ▒ ▒\n'),
    write('  ▒▒▒ ▒  ▒ ▒   ▒ ▒▒▒ ▒  ▒ ▒  ▒    ▒  ▒▒▒ ▒▒▒ ▒ ▒\n'), % mohon maaf gw iseng WKWK %
    nl,nl,nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('%               S T A R T  M E N U              %\n'),
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('%   start  : start your adventure!              %\n'),
    write('%   map    : shows the map                      %\n'),
    write('%   status : shows your current status          %\n'),
    write('%   w      : move to the north                  %\n'),
    write('%   s      : move to the south                  %\n'),
    write('%   d      : move to the east                   %\n'),
    write('%   a      : move to the west                   %\n'),
    write('%   help   : open help menu                     %\n'),
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n').

/* INVENTORY */
/* Disimpan dalam bentuk list */
/*
inventory :-
    gatau tapi ngambil data dari database,
    writeInvetory(DataInventory).
/*Fungsi rekursif, Basis ketika Tail = 0*/

quit :- 
    nl,
    write('Thank you for playing!\n'),
    halt. /* ini buat keluar dari gprolog */