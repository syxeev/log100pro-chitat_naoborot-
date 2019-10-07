domains
i = integer
list = i*
predicates
nondeterm get_N(i, list, i)
nondeterm make_list(list, list, list)
nondeterm run
nondeterm do(char)
clauses
	get_N(N,[_|T],R):-
		N<>1,
		NN=N-1,
		get_N(NN,T,R).
	get_N(1,[X|_],X).
	make_list(Source,[H|T],[K|T1]):-
		get_N(H, Source, K),
		make_list(Source,T,T1).
		make_list(_,[],[]).
	run:-
		write("\n******Enter******\n"),
		write(" 1 to start\n"),
		write(" 0 to EXIT\n"),
		write("*****************\n"),
		write(">>"),
		readchar(X),
		write(X),
		nl,
		do(X),
		run.
	do('1'):-
		write("Enter your list>>"),
		readterm(list, Source),
		write("Enter position list>>"),
		readterm(list, Position),
		make_list(Source, Position, Result),
		write(Result).
	do('0'):-
		write("That's all."), exit.
	do(_):-
		write("Bad value\n\n").
goal
	run.
