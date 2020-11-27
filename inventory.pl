:- dynamic(playerInventory/1).

splitList([Head|Tail], Head, Tail) :- !.

concatenate([],[],[]) :- !.
concatenate([],SList,SList) :- !.

concatenate(FList, SList, RList) :-
    splitList(FList, Head, Tail),
    concatenate(Tail, SList, PrevList),
    splitList(RList, Head, PrevList), !.

initInventory :-
    asserta(playerInventory([])),!.

countLength([], 0) :- !.

countLength([Head|Tail], Ans) :-
    countLength(Tail, Ans1), Ans is Ans1 + 1, !.

addItem(X) :-
    playerInventory(ListItem), countLength(ListItem, Length), Length =:= 100, write('Inventory is full.'), !.

addItem(X) :-
    playerInventory(ListItem),
    countLength(ListItem, Length),
    Length < 100,
    retract(playerInventory(ListItem)),
    asserta(playerInventory([X|ListItem])),!.

deleteItem(X, [X|Tail], Tail) :- !.

deleteItem(X, [Head|Tail], NewList) :-
    deleteItem(X, Tail, PrevList),
    NewList = [Head|PrevList], !.

delete(X) :-
    playerInventory(ListItem), 
    deleteItem(X, ListItem, NewList),
    retract(playerInventory(ListItem)),
    asserta(playerInventory(NewList)), !.

searchItem(X, [Head|Tail], 1) :-
    Head =:= X, !.

searchItem(_, List, 0) :-
    List = [], !.

searchItem(X, [Head|Tail], Found) :-
    searchItem(X, Tail, Found), !.

writeInventory(1, []) :- 
    write('Your inventory is empty!\n'),!.

writeInventory(0, []) :- !.

writeInventory(1, [Head|Tail]) :-
    format('~w\n', [Head]), writeInventory(0, Tail), !.

writeInventory(0, [Head|Tail]) :-
    format('~w\n', [Head]), writeInventory(0, Tail), !.

inventory :-
    opened(_),
    started(_),
    playerInventory(ListInventory), nl,
    write('█ █▄░█ █░█ █▀▀ █▄░█ ▀█▀ █▀█ █▀█ █▄█\n'),
    write('█ █░▀█ ▀▄▀ ██▄ █░▀█ ░█░ █▄█ █▀▄ ░█░\n'), nl,
    writeInventory(1, ListInventory), !.

inventory :- 
    opened(_),
    write('You haven\'t started the game! \n'),
	write('Type \'start\' to start the game. \n'),!.

inventory :-
    write('You haven\'t opened the game! \n'),
    write('Type \'openGame\' to open the game. \n'), !.