domains 
i = integer
list = i*
predicates
nondeterm create_list(i,i, list)
nondeterm do(char)
nondeterm run
clauses
create_list(E,E,[E]).
create_list(B,E,[B|T]):-B1=B+1, create_list(B1, E, T).
run:-
	write("enter\n***************\n"),
	write("1- to write down the list of numbers\n"),
	write("0- to exit\n"),
	write(">>"), readchar(X),write(X),nl,
	do(X),
	run.
do('1'):-
	write("T="), readint(B1),nl,
	readint(E),
	create_list (B1, E,T),
	write(T).
do('0'):-
	write("Enough.\n"), exit.
do(_):-
	write("bad value\n\n\n").
goal
run.
