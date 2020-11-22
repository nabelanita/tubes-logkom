/* potion(nama,attack,defense). potion bisa nambah status attack dan defense pemain */
potion(kalguksu,75,25).
potion(koreanbbq, 100,50).
potion(kimchi,50,25).
potion(coffee,10,20).
potion(instant_noodle,10,25).
potion(bibimbap,20,20).
potion(gimbap,25,50).
potion(galbi,50,25).
potion(japchae,25,50).
potion(corndog,20,10).

/* SHOP */
shop :-
write('What do you want to buy?\n1. Health Potion (100 Gold)\n2. Gacha (1000 Gold)\n3. Exit'),
read(X),
shopMenu(X).

shopMenu(1) :-
write('How many potion do you want to buy? '),
read(X),
/* Ambil data money dari database terus dikurang 100*X kalo cukup, kalo engga dikasih notif pembelian gagal */,
shop.

shopMenu(2) :-
write('How many gacha do you want to do? '),
read(X),
/* Ambil data money dari database terus dikurang 1000*X kalo cukup, kalo engga dikasih notif pembelian gagal*/,
/* gimana ya ambil data uang */
hargaGacha is (X*1000),
/* if -> then ; fail 
((hargaGacha <= dataUang ) -> %kurangin duit dan masukin ke inventory ; transactionFailed.),
randomGacha(),Fungsi buat ngerandom item yang didapat*/

shop.

shopMenu(3) :- exitShop.
/* Fungsi untuk keluar dari shop */

/* Fakta tentang equipment potion dan harganya */

/* Rule untuk membeli equipment dan potion */


/* Rule untuk random Gacha

randomGacha(namaEquipment) :-

*/

transactionFailed :- write('Transaction failed.').
exitShop :- write('Thanks for coming.').


