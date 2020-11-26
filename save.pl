/* Save and load file */
/* Nanti bikin kondisi2 kapan dia bisa load & save,
apakah cmn bisa kalo lagi di main menu gitu? apa bisa di mana aja */

save :-
    open('file.txt',write,X),
    set_output(X),
    listing,
    close(X),
    write('Saved.'),!.

load :-
    ['file.txt'],
    write('Loaded.'),!.
/* Habis loaded, openGame? */