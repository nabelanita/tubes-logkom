/* udh connect ke database, tp blm fix  */
/* includes */

:- include('player.pl').
:- include('inventory.pl').

player(1, 1, 0, 15, 10, 65, 65, 3, 300).

/* Dynamic variables */
/* Kayaknya barang2 mau disatuin aja */
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
/* Weapons */
/* weapon(ID, name, damage) 
weapon(1,keyboard, 50).
weapon(2,code_editor, 75).
weapon(3,laptop, 100).
weapon(4,pc, 150).
weapon(5,super_computer, 200).*/

/* Armor */
/* armor(ID, name, defense). -> ini bisa digacha 
armor(6,headphones,25).
armor(7,wifi, 50).
armor(8,database, 75).
armor(9,server,125).
armor(10,ai, 175).
*/
/* Accessory */
/* Accessory target job */
accWebdev(figma).
accWebdev(framework).

accMobDev(simulator).
accMobDev(phone).

accML(voice_recog).
accML(robot).

/* acc(ID, name, damage+, defense+) -> ini bisa digacha 
accessory(11,figma, 50, 25).
accessory(12,framework, 75, 50).
accessory(13,simulator, 50, 25).
accessory(14,phone, 75, 50).
accessory(15,voice_recog, 50, 25).
accessory(16,robot, 75, 50). */

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
    write('***SHOP***\n'),
    write('What do you want to buy?\n1. Health Potion (100 Gold)\n2. Gacha (1000 Gold)\n3. Exit\n'),
    read(X),
    shopMenu(X).

/* Kondisi jika uang cukup */
shopMenu(1) :-
    subGold(100),
    %write('Your gold'),nl,
    %write(NewGold),
    nl,
    write('Daftar potion yang tersedia:\n1. Kalguksu\n2. Korean BBQ\n3. Kimchi\n4. Coffee\n5. Samyang\n6. Bibimbap\n7. Gimbap\n8. Galbi\n9. Japchae\n10. Corndog\n'),
    read(IdPotion),
    buyPotion(IdPotion),
    shop.

/* Kondisi jika uang tidak cukup */
shopMenu(1) :-
    \+ subGold(100),
    transactionFailed,
    shop.

/* Kondisi jika uang cukup */
shopMenu(2) :-
    subGold(1000),
    randomEq,
    shop.

/* Kondisi jika uang gacukup */
shopMenu(2) :-
    \+ subGold(1000),
    transactionFailed,
    shop.

shopMenu(3) :- exitShop.

randomEq :- 
    random(1,16,HasilGacha),
    equipment(HasilGacha,_,NamaEq,_,_),
    write('You get:\n'),nl,
    % write(HasilGacha),
    write(NamaEq).
    % addItem(NamaEq).  /* setelah itu nambahin ke inventory addItem(NamaEq) tapi  belum bisa*/

buyPotion(IdPotion) :-
    potion(IdPotion,NamaPotion,_,_),
    write('You buy: \n'),
    write(NamaPotion).
    % addItem(NamaEq).  /* setelah itu nambahin ke inventory addItem(NamaEq) tapi  belum bisa*/

/* Fungsi untuk ngecek apakah uangnya cukup atau engga */
compareGold(Gold,Price) :- Gold >= Price.

subGold(Price) :- 
    player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold),
    compareGold(Gold,Price),
    retract(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, Gold)),
    NewGold is Gold - Price,
    asserta(player(Role, Lvl, Exp, Attack, Defense, MaxHP, HP, Hearts, NewGold)).

transactionFailed :- write('Transaction failed.\nYou don\'t have enough money.\n').

exitShop :- write('Thanks for coming.\n').


% ['shop.pl'].