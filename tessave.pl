/* Read dari file eksternal */
readData(S,[]) :-
	at_end_of_stream(S), !.

readData(S,[X1|Tail]) :-
	get_char(S,X1),
	readData(S,Tail).

baca_file(NamaFile,Isi) :-
	open(NamaFile,read,S),
	repeat,
	readData(S,Isi),
	close(S),!.

/* Membaca file menjadi list of lines */
read_file_lines(Stream,[]) :-
    at_end_of_stream(Stream).

read_file_lines(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file_lines(Stream,L).
/*-----------------------------*/
/* Write ke file eksternal */
writeData(_,[]) :- !.
writeData(S,[X1|Tail]) :-
	write(S,X1),
	writeData(S,Tail).

write_list(NamaFile,L) :-
	open(NamaFile,write,S),
	repeat,
	writeData(S,L),
	close(S).
/*-----------------------------*/