domains 
i = integer
list = i*
predicates
nondeterm do(char)
nondeterm run
nondeterm delete_odigits(list, list)
clauses
delete_odigits([H|T], [H|T1]):-
	H>-1,
	delete_odigits(T,T1).
delete_odigits([_|T], L):-
	delete_odigits(T, L).
delete_odigits([],[]):-!.
run:-
	write("Enter.\n****************\n"),
	write("1- to delete negative numbers\n"),
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
	write("Enough.\n\n\n"), exit.
do(_):-
	write("invalid input\n\n\n").
goal
	run.
