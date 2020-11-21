/* Dynamic variables */
:- dynamic(playerPos/2).

/*
welcomePlayer(1) :-
    write('You have chosen Web Developer, let\'s explore the world of programming!').

welcomePlayer(2) :-
    write('You have chosen Machine Learning Engineer, let\'s explore the world of programming!').

welcomePlayer(3) :-
    write('You have chosen Mobile Developer, let\'s explore the world of programming!').*/

/* initialize player position */
/* mending ini digabung sama inisialisasi lain sih */
initPlayerPos:- X is 2, Y is 1, asserta(playerPos(X,Y)). 

/* Buat inisiasi player, belom kepikiran gimana implementasinya 
initPlayer :- 
    
    
/*
status :-
    gatau tapi ngambil data dari database
    write('Your status:\nJob: '),
    write(Job),
    write('\nLevel: '),
    write(Level),
    write('\nHealth: '),
    write(Health),
    write('\nAttack: '),
    write(Attack),
    write('\nDefense: '),
    write(Status),
    write('\nExp: '),
    write(Exp),
    write('\nGold: '),
    write(Gold). */