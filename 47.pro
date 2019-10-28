domains
	i = integer
	list = i* 
predicates
	nondeterm mnozh(list, list, list)
	nondeterm member(i, list)
	nondeterm do(char)
	nondeterm run 
clauses
	member(X, [X|_]).
	member(X, [_|T]):-
		member(X,T).
	mnozh([H|T], T1, R):-
		member(H,T),
		not(member(H,T1)),
		mnozh(T, [H|T1], R).
	mnozh([H|T], T1, R):-
		member(H, T),
		member(H, T1),
		mnozh(T,T1,R).
	mnozh([H|T], T1, R):-
		not(member(H, T)),
		mnozh(T, T1, R).
	mnozh([], R, R).
	run:-
		write("\n******Enter******\n"),
		write(" 1 to start\n"),
		write(" 0 to EXIT\n"),
		write("*****************\n"),
		write("»"),
		readchar(X),
		write(X),
		nl,
		do(X),
		run.
	do('1'):-
		write("Enter your list\n L = "),
		readterm(list, Z),
		nl,
		mnozh(Z,[],D),
		write(D).
	do('0'):-
		write("That's all."), exit.
	do(_):-
		write("Bad value\n\n").
	goal
	run.
