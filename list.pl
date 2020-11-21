/* List */

/* Gatau persisnya buat apa, tapi kayaknya pasti butuh */

/* Insert elemen X ke list L (kayak append) */
insertFirst(X,L,[X|L]).
insertFirst(X,[Head|Tail],[Head|Tail1]) :- insertFirst(X,Tail,Tail1).

/* Delete elemen pertama dari list L */
deleteFirst([_|Tail],Tail).

/* Mengecek apakah barang sudah ada di list */
isMember(X,[X|_]).
isMember(X,[_|T])  :-  isMember(X,T).