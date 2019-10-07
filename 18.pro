domains 
i = integer
list = i*
predicates
nondeterm create_list(i,i, list)
nondeterm do(char)
nondeterm run
nondeterm delete_odigits(list, list)
clauses
create_list(E,E,[E]).
create_list(B,E,[B|T]):-B1=B+1, create_list(B1, E, T).
delete_odigits([H|T], [H|T1]):-
	H>-1,
	delete_odigits(T,T1).
delete_odigits([_|T], L):-
	delete_odigits(T, L).
delete_odigits([],[]):-!.
run:-
	write("scuk my mother fucking dick.\n"),
	write("now lets start.\n"),
	write("enter\n"),
	write("1- to write down the list of numbers\n"),
	write("0- to exit\n"),
	write(">>"), readchar(X),write(X),nl,
	do(X),
	run.
do('1'):-
	write("T="),
	readterm(list, E),
	delete_odigits(E, R),
	write(R).
do('0'):-
	write("go fuck yourself dumb ass bitch. screw you\n"), exit.
do(_):-
	write("u dumb as fuck").
goal
	run.
