splitList([Head|Tail], Head, Tail) :- !.

concatenate([],[],[]) :- !.
concatenate([],SList,SList) :- !.

concatenate(FList, SList, RList) :-
    splitList(FList, Head, Tail),
    concatenate(Tail, SList, PrevList),
    splitList(RList, Head, PrevList), !.

initInventory :-
    asserta(inventory([])),!.

addItem(X) :-
    inventory(ListItem),
    retract(inventory(ListItem)),
    splitList(NewList, X, ListItem),
    asserta(inventory(NewList)),!.

deleteItem(X, List, NewList) :-
    splitList(List, Head, Tail),
    Head =:= X,
    NewList = Tail, !.

deleteItem(X, List, NewList) :-
    splitList(List, Head, Tail),
    deleteItem(X, Tail, PrevList),
    splitList(NewList, Head, PrevList), !.

searchItem(X, List, 1) :-
    splitList(List, Head, Tail),
    Head =:= X, !.

searchItem(_, List, 0) :-
    List = [], !.

searchItem(X, List, Found) :-
    splitList(List, Head, Tail),
    searchItem(X, Tail, Found), !.



