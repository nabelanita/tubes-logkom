/* Includes */
:- include('map.pl').
:- include('movement.pl').
:- include('player.pl').
:- include('inventory.pl').

openGame :-
    nl,
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

start :-
    initQuest,
    write('Welcome to Samsan Tech. Choose your job\n'),
    write('1. Web Developer\n'),
    write('2. ML Engineer\n'),
    write('3. Mobile Developer\n'),
    write('Your choice: '),
    read(Job), nl,
    welcomePlayer(Job),
    initPlayer(Job),
    initInventory,
    newMap,
    initPlayer(Job), !.

/* INVENTORY */
/* Disimpan dalam bentuk list */
/*
inventory :-
    gatau tapi ngambil data dari database,
    writeInvetory(DataInventory).
/*Fungsi rekursif, Basis ketika Tail = 0*/


