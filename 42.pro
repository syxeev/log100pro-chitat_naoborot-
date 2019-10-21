domains 
i = integer
list = i*
predicates 
nondeterm do(char)
nondeterm run
nondeterm length(i, list)
nondeterm change(i, i, list, list)
clauses
length(0, []).
length(K,[_|T]):-
	length(NK, T),
	K = NK + 1.
change(C, X, [H|T],[H|T1]):-
	X>0,
	NX = X - 1,
	change(C, NX, T, T1).
change(C,0,[_|T],[C|T1]):-
	change(C,0,T,T1).
change(_,_,[],[]).
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
	readterm(list, R),
	length(V,R),
	write("How many numbers you want to change\nP ="),
	readint(P),
	write("Enter what constant you would like to insert\n C = "), 
	readint(C),
	X = V-P,
	change(C,X,R,E),
	write(E).
do('0'):-
	write("Enough.\n"), exit.
do(_):-
	write("bad value\n\n\n").
goal 
run.
