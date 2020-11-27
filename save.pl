/* Save and load file */
/* Nanti bikin kondisi2 kapan dia bisa load & save,
apakah cmn bisa kalo lagi di main menu gitu? apa bisa di mana aja */

save :-
    open('file.pl',write,X),
    set_output(X),
    write(':- include(\'dynamic.pl\').'),
    listing,
    close(X),
    write('Saved.'),
    %retractstuff
    !.

load :-
    ['file.pl'],
    write('Loaded.'),!. 
/* Habis loaded, openGame? */