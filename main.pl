/* Includes */
:- include('map.pl').
:- include('movement.pl').
:- include('player.pl').
:- include('inventory.pl').

:- dynamic(opened/1).
:- dynamic(started/1).

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
    write('%   map    : shows the map of the office        %\n'),
    write('%   status : shows your current status          %\n'),
    write('%   w      : move to the north                  %\n'),
    write('%   s      : move to the south                  %\n'),
    write('%   d      : move to the east                   %\n'),
    write('%   a      : move to the west                   %\n'),
    write('%   help   : open help menu                     %\n'),
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    asserta(opened(1)).

start :-
    opened(_),
    asserta(started(1)),
    write('Welcome to Samsan Tech. Choose your job\n'),
    write('1. Web Developer\n'),
    write('2. ML Engineer\n'),
    write('3. Mobile Developer\n'),
    write('Your choice: '),
    read(Job), nl,
    welcomePlayer(Job),
    initInventory,
    newMap, !.

start :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n').


