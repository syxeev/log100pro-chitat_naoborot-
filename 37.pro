domains 
i = integer
list = i*
predicates 
nondeterm do(char)
nondeterm run
nondeterm cut(i, list, list)
clauses
cut(K,[_|T],T1):-
	K<>0,
	NK=K-1,
	cut(NK,T,T1).
cut(0,T,T).
run:-
	write("\n******Enter******\n"),
	write(" 1 to start\n"),
	write(" 0 to EXIT\n"),
	write("*****************\n"),
	write(">>"),
	readchar(Q),
	write(Q),
	nl,
	do(Q),
	run.
do('1'):-
	write("Enter your list>>"),
	readterm(list, T),
	write("Enter how many numbers do you want to cut\n K = "), 
	readint(K),
	cut(K,T,E),
	write(E).
do('0'):-
	write("Enough.\n"), exit.
do(_):-
	write("bad value\n\n\n").
goal 
run.
