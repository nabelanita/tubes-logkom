/* File map.pl */
/* includes */


/* Dynamic variable */
:- dynamic(mapHeight/1).
:- dynamic(mapWidth/1). 

/* New map */
newMap :- X is 20, Y is 10, asserta(mapWidth(X)), asserta(mapHeight(Y)), initPlayerPos.


/* Map edges */
edgeUpper(_,Y) :- Y=:=0, !.
edgeLower(_,Y) :- Y1 is Y - 1, mapHeight(Y1), !.
edgeLeft(X,_) :- X=:=0, !.
edgeRight(X,_) :- X1 is X - 1, mapWidth(X1), !.

/* Objects on map */
player(X,Y) :- playerPos(X,Y), !.


/* Print map */
printMap(7,3) :- write('#'), !.
printMap(8,3) :- write('#'), !.
printMap(9,3) :- write('#'), !.
printMap(8,4) :- write('#'), !.
printMap(8,5) :- write('#'), !.
printMap(18,9) :- write('B'), !.
printMap(X,Y) :- edgeUpper(X,Y), edgeRight(X,Y), write('#\n'), !.
printMap(X,Y) :- edgeUpper(X,Y), write('#'), !.
printMap(X,Y) :- edgeLower(X,Y), write('#'), !.
printMap(X,Y) :- edgeRight(X,Y), write('#\n'), !.
printMap(X,Y) :- edgeLeft(X,Y), write('#'), !.
printMap(X,Y) :- edgeLower(X,Y), edgeRight(X,Y), write('#\n'), !.
printMap(X,Y) :- player(X,Y), !, write('P').
printMap(_,_) :- write('-'), !.

/* startmap digunakan untuk inisialisasi map -> pas baru mulai */
startmap :- newMap,
			mapWidth(X),mapHeight(Y),
			XMin is 0, XMax is X+1,
			YMin is 0, YMax is Y+1, 
			forall(between(YMin,YMax,B),(
				forall(between(XMin,XMax,A),(printMap(A,B))))),nl,nl,
        	write('Legend: P - Player\n'),
        	write('        B - Boss\n'),
        	write('        # - Fence (Cannot walk through)\n').

/* kalo mau cek map pas in-game pakenya ini */
map :- 	mapWidth(X),mapHeight(Y),
		XMin is 0, XMax is X+1,
		YMin is 0, YMax is Y+1, 
		forall(between(YMin,YMax,B),(
			forall(between(XMin,XMax,A),(printMap(A,B))))),nl,nl,
        write('Legend: P - Player\n'),
        write('        B - Boss\n'),
        write('        # - Fence (Cannot walk through)\n').