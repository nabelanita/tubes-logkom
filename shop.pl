/* PS. KALO ADA YG PERLU DIUBAH, UBAH AJA : D */

/* includes */

:- include('player.pl').

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

/* SHOP */
shop :-
    write('What do you want to buy?\n1. Health Potion (100 Gold)\n2. Gacha (1000 Gold)\n3. Exit\n'),
    read(X),
    shopMenu(X).

shopMenu(1) :-
write('How many potion do you want to buy? \n'),
    read(X),
    /* Ambil data money dari database terus dikurang 100*X kalo cukup, kalo engga dikasih notif pembelian gagal, */
    write('Daftar potion yang tersedia:\n1. Kalguksu\n2. Korean BBQ\n3. Kimchi\n4. Coffee\n5. Samyang\n6. Bibimbap\n7. Gimbap\n8. Galbi\n9. Japchae\n10. Corndog\n'),
    shop.

shopMenu(2) :-
write('How many gacha do you want to do? \n'),
    read(X),
    player(_, _, _, _, _, _, _, _, Uang),
    /* Ambil data money dari database terus dikurang 1000*X kalo cukup, kalo engga dikasih notif pembelian gagal,*/
    /* gimana ya ambil data uang */
    %hargaGacha is (X*1000),
    write(Uang),
    %((hargaGacha =< Gold) -> (Gold-hargaGacha) ; transactionFailed),   
    /* if -> then ; else 
    ((hargaGacha <= dataUang ) -> %kurangin duit dan masukin ke inventory ; transactionFailed.),
    randomGacha(),Fungsi buat ngerandom item yang didapat*/
    randomGacha,
    shop.

shopMenu(3) :- exitShop.

randomGacha :- 
    random(1,16,HasilGacha),
    equipment(HasilGacha,_,NamaEq,_,_),
    write('You got:\n'),
    write(HasilGacha),
    write('\n'),
    write(NamaEq).
    /* setelah itu nambahin ke inventory
    addItem(NamaEq) */

transactionFailed :- write('Transaction failed.\n').

exitShop :- write('Thanks for coming.\n').


% ['shop.pl'].