openGame :-
    write('Let\'s play and be a programmer\n
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n
    %                              ~Genshin Asik~                                  %\n
    % 1. start  : untuk memulai petualanganmu                                      %\n
    % 2. map    : menampilkan peta                                                 %\n
    % 3. status : menampilkan kondisimu terkini                                    %\n
    % 4. w      : gerak ke utara 1 langkah                                         %\n
    % 5. s      : gerak ke selatan 1 langkah                                       %\n
    % 6. d      : gerak ke ke timur 1 langkah                                      %\n
    % 7. a      : gerak ke barat 1 langkah                                         %\n
    % 9. Status : menampilkan status pemain                                        %\n
    % 8. help   : menampilkan segala bantuan                                       %\n
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%').

startGame :-
    write('Welcome to Genshin Asik. Choose your job\n
            1. Web Developer\n
            2. ML Engineer\n
            3. Mobile Developer\n'),
    read(Job),
    welcomePlayer(Job),
    initPlayer(Job).

/*MAP
Disimpan dalam bentuk list of lists.
Diprint secara rekursif -> Basisnya ketika tail kosong.
*/
map :-
    printMap(FileMap).

printMap(FileMap). /*Fungsi rekursif*/

/* INVENTORY */
/* Disimpan dalam bentuk list */
inventory :-
    /*gatau tapi ngambil data dari database*/,
    writeInvetory(DataInventory).

writeInvetory. /*Fungsi rekursif, Basis ketika Tail = 0*/

/* EXPLORATION */
/* generateEnemy adalah fungsi yang menentukan apakah akan ada enemy yang muncul atau tidak ketika player pindah tempat */
w :-
/* Y = Y - 1*/,
generateEnemy().

a :-
/* X = X - 1*/,
generateEnemy().

s :-
/* Y = Y + 1*/,
generateEnemy().

d :-
/* X = X + 1*/,
generateEnemy().

