domains
i=integer
list=i*
predicates
	nondeterm insert_sublist(list, i, list, list)  
	nondeterm append(list, list, list)
	nondeterm do(char) 
	nondeterm run

clauses
append([], List2, List2).
append([Head|Tail], List2, [Head|TailResult]):-
	append(Tail, List2, TailResult).
   
insert_sublist(A, 0, B, Result):-
	append(B, A, Result), !.
insert_sublist([Head|Tail], Pos, B, [Head|TailResult]):-
	NextPos = Pos - 1,
	insert_sublist(Tail, NextPos, B, TailResult).    

run:-	
	write("Press:"),nl,
	write(" 1 - to enter"),nl,
	write(" 0 - to close"),nl,
	write("==========================="),nl,
	write(">>"),readchar(X),
	write(X),
	nl,
	do(X),
	run.
do('1'):-
	write("Enter the first list\n"),
	readterm(list,L),
	nl, 
	write("Now enter the second list\n"),
	readterm(list,T),
	nl,
	write("Enter the position: "), readint(J),
	A=J-1,
	insert_sublist(L, A, T, X),
	write("New List: "), write(X),nl.
do('0'):-
	write("That's all"), exit.
do(_):-
	write("bad value\n\n").
goal
run.  
