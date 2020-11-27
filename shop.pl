
/* dyamic */
:- dynamic(inShop/1).

/* Inisialisasi */
/*player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)*/
%player(1, 1, 0, 15, 10, 65, 65, 3, 300). /* nanti pas digabungin jangan lupa dihapus */
/* initInventory di terminal gatau kenapa gabisa disini */

/* equipment(idEq,jenisEq,namaEq,attack,defense) */
/* WEAPON */
equipment(1,weapon, keyboard, 50, 0).
equipment(2,weapon, code_editor, 75, 0).
equipment(3,weapon, laptop, 100, 0).
equipment(4,weapon, pc, 150, 0).
equipment(5,weapon, super_computer, 200, 0).
/* ARMOR */
equipment(6,armor,headphones,0,25).
equipment(7,armor,wifi,0, 50).
equipment(8,armor,database,0, 75).
equipment(9,armor,server,0,125).
equipment(10,armor,ai,0,175).
/* ACCESSORY */
equipment(11,accessory,figma, 50, 25).
equipment(12,accessory, framework, 75, 50).
equipment(13,accessory,simulator, 50, 25).
equipment(14,accessory,phone, 75, 50).
equipment(15,accessory,voice_recog, 50, 25).
equipment(16,accessory,robot, 75, 50).

/* Accessory target job */
accWebdev(figma).
accWebdev(framework).
accMobDev(simulator).
accMobDev(phone).
accML(voice_recog).
accML(robot).

/* potion(idPotion,namaPotion,HP). potion bisa nambah status attack dan defense pemain */
potion(1,kalguksu,75).
potion(2,koreanbbq,100).
potion(3,kimchi,50).
potion(4,coffee,10).
potion(5,samyang,10).
potion(6,bibimbap,20).
potion(7,gimbap,25).
potion(8,galbi,50).
potion(9,japchae,25).
potion(10,corndog,20).

/* Menu shop */

shop :-
    \+opened(_),
	write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'), !.

shop :-
    opened(_),
    inShop(1),
    nl,
    write('░██████╗██╗░░██╗░█████╗░██████╗░'),nl,
    write('██╔════╝██║░░██║██╔══██╗██╔══██╗'),nl,
    write('╚█████╗░███████║██║░░██║██████╔╝'),nl,
    write('░╚═══██╗██╔══██║██║░░██║██╔═══╝░'),nl,
    write('██████╔╝██║░░██║╚█████╔╝██║░░░░░'),nl,
    write('╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░'),nl,
    write('What do you want to buy?\n1. Health Potion (100 Gold)\n2. Gacha (300 Gold)\n3. Exit\n'),
    write('Your choice: '),
    read(X),nl,
    shopMenu(X),!.


shop :-
    inShop(0),nl,
    write('█▀▀ █▀▀ ▀█▀   █▄▄ ▄▀█ █▀▀ █▄▀   ▀█▀ █▀█   █░█░█ █▀█ █▀█ █▄▀ █'),nl,
    write('█▄█ ██▄ ░█░   █▄█ █▀█ █▄▄ █░█   ░█░ █▄█   ▀▄▀▄▀ █▄█ █▀▄ █░█ ▄'),nl,!.

shop :-
    opened(_),
	write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'), !.
shop :-
	write('You haven\'t opened the game! \n'),
	write('Type \'open\' to start the game. \n'), !.

/* Kondisi jika uang cukup */
shopMenu(1) :-
    subGold(100),
    player(_, _, _, _, _, _, _, _, Money),
    write('Transaction successful!'),nl,
    write('Your money: '),
    write(Money),nl,
    write('Available potions:\n1. Kalguksu\n2. Korean BBQ\n3. Kimchi\n4. Coffee\n5. Samyang\n6. Bibimbap\n7. Gimbap\n8. Galbi\n9. Japchae\n10. Corndog\n'),
    write('Your choice: '),
    read(IdPotion),nl,
    buyPotion(IdPotion),shop,!.

/* Kondisi jika uang tidak cukup */
shopMenu(1) :-
    \+ subGold(100),
    transactionFailed,
    shop,!.

/* Kondisi jika uang cukup */
shopMenu(2) :-
    subGold(300),
    player(_, _, _, _, _, _, _, _, Money),
    write('Transaction successful!'),nl,
    write('Your money: '),
    write(Money),nl,
    randomEq,
    shop,!.

/* Kondisi jika uang gacukup */
shopMenu(2) :-
    \+ subGold(300),
    transactionFailed,
    shop,!.

shopMenu(3) :- exitShop, !.

shopMenu(_) :- 
    write('What\'s that? We don\'t sell that here!\n'),
    shop,!.

randomEq :- 
    random(1,16,HasilGacha),
    equipment(HasilGacha,_,NamaEq,_,_),
    write('You get:'),
    write(NamaEq),nl,
    addItem(NamaEq),!. /* nambahin hasil gacha equipment ke inventory */
    

buyPotion(IdPotion) :-
    potion(IdPotion,NamaPotion,_),
    write('You buy: '),
    write(NamaPotion),nl,
    addItem(NamaPotion),!. /* nambahin pembelian potion ke inventory */

/* Rule untuk ngecek apakah uangnya cukup atau engga */
compareGold(Gold,Price) :- Gold >= Price,!.

/* Rule untuk mengurangi uang */
subGold(Price) :- 
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    compareGold(Gold,Price),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    NewGold is Gold - Price,
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, NewGold)),!.

transactionFailed :- write('Transaction failed.\nYou don\'t have enough money.\n'),!.

exitShop :- 
    !,
    retract(inShop(1)),
    asserta(inShop(0)),nl,
    write('█▀▀ █▀█ █▀▄▀█ █▀▀   ▄▀█ █▀▀ ▄▀█ █ █▄░█ █\n'),
    write('█▄▄ █▄█ █░▀░█ ██▄   █▀█ █▄█ █▀█ █ █░▀█ ▄\n'),nl,nl,!. /* nanti harusnya kembali ke menu awal/map gitu*/

/* Mencari apakah potion dan equipment ada di inventory */
potion :-
    nl,
    write('What potion do you want to use? '), nl,
    read(X),
    usePotion(X), !.

cariPotion(NamaPotion) :-
    playerInventory(ListItem),
    member(NamaPotion,ListItem),!.

cariEq(NamaEq) :-
    playerInventory(ListItem),
    member(NamaEq,ListItem),!.

usePotion(NamaPotion) :-
    cariPotion(NamaPotion),
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    potion(_,NamaPotion,HPpotion),
    NewHP is HP + HPpotion,
    NewHP >= MaxHP,
    write('Your potion has been activated successfully.'),nl,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, MaxHP, Hearts, Gold)),
    delete(NamaPotion),!.

usePotion(NamaPotion) :-
    cariPotion(NamaPotion),
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    potion(_,NamaPotion,HPpotion),
    NewHP is HP + HPpotion,
    NewHP < MaxHP,
    write('Your potion has been activated successfully.'),nl,
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, NewHP, Hearts, Gold)),
    delete(NamaPotion),!.

/* Hee mager bikin menunya lagi 
usepotion :- 
    write('Your potions:'),nl,
    playerInventory(ListInventory), nl,
    writeInventory(1, ListInventory),
    write('Your choice: '),
    read(NamaPotion),nl,
    usePotion(NamaPotion),!.
*/ 
/* Kalo ternyata gaada di inventory */
usePotion(NamaPotion) :-
    \+ cariPotion(NamaPotion),
    write('You don\'t have '),
    write(NamaPotion),
    write(' in your inventory. Try to use another potion.'),nl,!.

/* use Eq gatau sih perlu atau engga */
equip :-
    nl,
    write('What equipment do you want to activate? '),nl,
    read(X),
    useEq(X), nl,
    !.

useEq(NamaEq) :-
    cariEq(NamaEq),
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    equipment(_,_,_,AttackEq,DefenseEq),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    write('Your equipment has been activated successfully.'),nl,
    NewAttack is Attack + AttackEq,
    NewDefense is Defense + DefenseEq,
    asserta(player(Role, Lvl, Exp, NewAttack, NewDefense, MaxHP, HP, Hearts, Gold)),
    delete(NamaEq),!.
/* Kalo ternyata gaada di inventory */
useEq(NamaEq) :-
    \+ cariEq(NamaEq),
    write('You don\'t have '),
    write(NamaEq),
    write(' in your inventory. Try to use another equipment.'),nl,!.

% ['shop.pl'].
% initInventory.