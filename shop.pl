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
randomGacha(),/*Fungsi buat ngerandom item yang didapat*/
shop.

shopMenu(3) :-
/* Fungsi untuk keluar dari shop */