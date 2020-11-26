/* Includes */
:- include('player.pl').
:- include('inventory.pl').
:- include('save.pl').

/* Inisialisasi */
/*player(Role, Level, Exp, Attack, Defense, HP, MaxHP, Hearts, Gold)*/
player(1, 1, 0, 15, 10, 65, 65, 3, 300). /* nanti pas digabungin jangan lupa dihapus */
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

/* potion(idPotion,namaPotion,attack,defense). potion bisa nambah status attack dan defense pemain */
potion(1,kalguksu,75,25).
potion(2,koreanbbq, 100,50).
potion(3,kimchi,50,25).
potion(4,coffee,10,20).
potion(5,samyang,10,25).
potion(6,bibimbap,20,20).
potion(7,gimbap,25,50).
potion(8,galbi,50,25).
potion(9,japchae,25,50).
potion(10,corndog,20,10).

/* Menu shop */
shop :-
    nl,
    write('░██████╗██╗░░██╗░█████╗░██████╗░'),nl,
    write('██╔════╝██║░░██║██╔══██╗██╔══██╗'),nl,
    write('╚█████╗░███████║██║░░██║██████╔╝'),nl,
    write('░╚═══██╗██╔══██║██║░░██║██╔═══╝░'),nl,
    write('██████╔╝██║░░██║╚█████╔╝██║░░░░░'),nl,
    write('╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░'),nl,
    write('What do you want to buy?\n1. Health Potion (100 Gold)\n2. Gacha (1000 Gold)\n3. Exit\n'),
    write('Your choice: '),
    read(X),nl,
    shopMenu(X),!.

/* Kondisi jika uang cukup */
shopMenu(1) :-
    subGold(100),
    player(_, _, _, _, _, _, _, _, Money),
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
    subGold(1000),
    player(_, _, _, _, _, _, _, _, Money),
    write('Your money: '),
    write(Money),nl,
    randomEq,
    shop,!.

/* Kondisi jika uang gacukup */
shopMenu(2) :-
    \+ subGold(1000),
    transactionFailed,
    shop,!.

shopMenu(3) :- exitShop, !.

randomEq :- 
    random(1,16,HasilGacha),
    equipment(HasilGacha,_,NamaEq,_,_),
    write('You get:\n'),nl,
    write(NamaEq),
    addItem(NamaEq),!. /* nambahin hasil gacha equipment ke inventory */
    

buyPotion(IdPotion) :-
    potion(IdPotion,NamaPotion,_,_),
    write('You buy: '),
    write(NamaPotion),nl,
    addItem(NamaPotion),!. /* nambahin pembelian potion ke inventory */

/* Rule untuk ngecek apakah uangnya cukup atau engga */
compareGold(Gold,Price) :- Gold >= Price.

/* Rule untuk mengurangi uang */
subGold(Price) :- 
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    compareGold(Gold,Price),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    NewGold is Gold - Price,
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, NewGold)).

transactionFailed :- write('Transaction failed.\nYou don\'t have enough money.\n').

exitShop :- write('Thanks for coming.\n'). /* nanti harusnya kembali ke menu awal/map gitu*/

usePotion(NamaPotion) :-
    % searchItem(NamaPotion,playerInventory,Found), 
    /* harusnya usePotion tuh potion yg dia punya doang, jadi harus dicek di listnya ada apa engga */
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    potion(_,NamaPotion,AttackPotion,DefensePotion),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    write('Your potion has been activated successfully.'),nl,
    NewAttack is Attack + AttackPotion,
    NewDefense is Defense + DefensePotion,
    asserta(player(Role, Lvl, Exp, NewAttack, NewDefense, MaxHP, HP, Hearts, Gold)),
    del(NamaPotion),!.

/* use Eq gatau sih perlu atau engga */
useEq(NamaEq) :-
    % searchItem(NamaEq,playerInventory,Found), 
    /* harusnya useEq tuh potion yg dia punya doang, jadi harus dicek di listnya ada apa engga */
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    equipment(_,_,_,AttackEq,DefenseEq),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    write('Your equipment has been activated successfully.'),nl,
    NewAttack is Attack + AttackEq,
    NewDefense is Defense + DefenseEq,
    asserta(player(Role, Lvl, Exp, NewAttack, NewDefense, MaxHP, HP, Hearts, Gold)),
    del(NamaEq),!.

% ['shop.pl'].
% initInventory.