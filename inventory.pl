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
    playerInventory(ListItem), countLength(ListItem, Length), Length =:= 100, write('Inventory penuh.'), !.

addItem(X) :-
    playerInventory(ListItem),
    countLength(ListItem, Length),
    Length < 100,
    retract(playerInventory(ListItem)),
    asserta(playerInventory([X|ListItem])),!.

/* deleteItem masih error */
deleteItem(X, [Head|Tail], Tail) :-
    Head =:= X, !.

deleteItem(X, [Head|Tail], NewList) :-
    deleteItem(X, Tail, PrevList),
    NewList = [Head|PrevList], !.

delete(X) :-
    playerInventory(ListItem), 
    deleteItem(X, ListItem, NewList),
    retract(playerInventory(ListItem)),
    asserta(playerInventory(NewList)), !.

/* coba bikin delItem */
delItem(X, [Head|Tail],Tail).
delItem(X, [Head|Tail], [Head|Tail1]) :- delete(X,Tail,Tail1), !.
del(X) :-
    playerInventory(ListItem), 
    delItem(X, ListItem, NewList),
    retract(playerInventory(ListItem)),
    asserta(playerInventory(NewList)), !.

searchItem(X, [Head|Tail], 1) :-
    Head =:= X, !.

searchItem(_, List, 0) :-
    List = [], !.

searchItem(X, [Head|Tail], Found) :-
    searchItem(X, Tail, Found), !.

writeInventory([]) :- !.

writeInventory([Head|Tail]) :-
    format('~w\n', [Head]), writeInventory(Tail), !.

inventory :-
    playerInventory(ListInventory), writeInventory(ListInventory), !.

