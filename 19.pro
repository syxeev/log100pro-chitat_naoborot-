domains
i = integer
list = i*
predicates
nondeterm fi(i,i,i, list)
nondeterm run
nondeterm do(char)
clauses
run:-	
	write("\nenter\n***************\n"),
	write("1- to write down the list Fibonacci\n"),
	write("0- to exit\n"),
	write(">>"), readchar(X),write(X),nl,
	do(X),
	run.

fi(P,K,N,[P|L]):-
	N<>1, 
	NK = P + K,
	NN = N-1,
	fi(K, NK, NN, L).
fi(P,_,1,[P]).
do('1'):-
	write("N>>"),
	readint(N),
	fi(0,1,N,Result),
	write(Result).
do('0'):-
	write("Enough.\n"), exit.
do(_):-
	write("bad value\n\n\n").
goal
	run.
