/* File map.pl */

/* Dynamic variable */
:- dynamic(mapHeight/1).
:- dynamic(mapWidth/1). 

/* New map */
newMap :- X is 20, Y is 10, asserta(mapWidth(X)), asserta(mapHeight(Y)).

/* Map edges */
edgeUpper(_,Y) :- Y=:=0, !.
/* edgeLower(_,Y) :- mapHeight(Y), YMax is Y+1, Y=:=YMax, !. */
edgeLower(_,Y) :- Y1 is Y - 1, mapHeight(Y1), !.
edgeLeft(X,_) :- X=:=0, !.
/* edgeRight(X,_) :- mapWidth(X), XMax is X+1 , X=:=XMax, !. */
edgeRight(X,_) :- X1 is X - 1, mapWidth(X1), !.


/* Print map */
printMap(2,2) :- write('P'), !.
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
printMap(_,_) :- write('-'), !.

map :- 	newMap,
		mapWidth(X),mapHeight(Y),
		XMin is 0, XMax is X+1,
		YMin is 0, YMax is Y+1, 
		forall(between(YMin,YMax,B),(
			forall(between(XMin,XMax,A),(printMap(A,B))))),nl,nl,
        write('Legend: P - Player\n'),
        write('        B - Boss\n'),
        write('        # - Fence (Cannot walk through)\n').