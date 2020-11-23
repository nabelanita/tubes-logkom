/* File map.pl */
/* includes */


/* Dynamic variable */
:- dynamic(mapHeight/1).
:- dynamic(mapWidth/1). 
:- dynamic(questPos/2).
:- dynamic(shopPos/2).

/* New map */
/* ukuran mapnya hardcoded idk */
newMap :- X is 10, 
		Y is 10, 
		asserta(mapWidth(X)), 
		asserta(mapHeight(Y)), 
		initPlayerPos, 
		initQuest, 
		initShop.


/* Map edges */
edgeUpper(_,Y) :- Y=:=0, !.
edgeLower(_,Y) :- Y1 is Y - 1, mapHeight(Y1), !.
edgeLeft(X,_) :- X=:=0, !.
edgeRight(X,_) :- X1 is X - 1, mapWidth(X1), !.

/* Randomize quest and store position*/
initQuest :-random(1,5,X1), 
			random(6,10,Y1), 
			asserta(questPos(X1,Y1)).

initShop :-random(6,10,X1), 
			random(1,5,Y1), 
			asserta(shopPos(X1,Y1)).


/* Objects on map */
printPlayer(X,Y) :- playerPos(X,Y), !.
printQuest(X,Y) :- questPos(X,Y), !.
printShop(X,Y) :- shopPos(X,Y), !.


/* Print map */
/* printMap(7,3) :- write('#'), !.
printMap(8,3) :- write('#'), !.
printMap(9,3) :- write('#'), !.
printMap(8,4) :- write('#'), !.
printMap(8,5) :- write('#'), !. */
printMap(10,10) :- write('B'), !.
printMap(X,Y) :- edgeUpper(X,Y), edgeRight(X,Y), write('#\n'), !.
printMap(X,Y) :- edgeUpper(X,Y), write('#'), !.
printMap(X,Y) :- edgeLower(X,Y), write('#'), !.
printMap(X,Y) :- edgeRight(X,Y), write('#\n'), !.
printMap(X,Y) :- edgeLeft(X,Y), write('#'), !.
printMap(X,Y) :- edgeLower(X,Y), edgeRight(X,Y), write('#\n'), !.
printMap(X,Y) :- printPlayer(X,Y), !, write('P').
printMap(X,Y) :- printQuest(X,Y), !, write('Q').
printMap(X,Y) :- printShop(X,Y), !, write('S').
printMap(_,_) :- write('-'), !.


/* kalo mau cek map pas in-game pakenya ini */
map :- 	mapWidth(X),mapHeight(Y),
		XMin is 0, XMax is X+1,
		YMin is 0, YMax is Y+1, 
		forall(between(YMin,YMax,B),(
			forall(between(XMin,XMax,A),(printMap(A,B))))),nl,nl,
        write('Legend: P - Player\n'),
        write('        B - Boss\n'),
        write('        # - Fence (Cannot walk through)\n').