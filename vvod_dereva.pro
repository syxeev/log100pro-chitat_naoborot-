domains 
int=integer
intl=int*
tree = tr(int, tree, tree); nil
predicates
nondeterm insert(int,tree,tree)
nondeterm max(int,int,int)
nondeterm height(tree,integer)
nondeterm m_t(tree,integer,integer)
nondeterm run
nondeterm gen(tree,tree)
nondeterm out_t(tree,integer,integer)
nondeterm w_t(integer,int,int)
nondeterm write_tree(tree)
nondeterm menu(tree)
nondeterm solve(char, tree)
clauses
run:-
	write("Create binary dictionary:"),nl, 
	gen(nil, T), nl, 
	nl,nl,
	menu(T). 
	gen(Tree, NewTree):- 
	write("Enter number: "), 
	readint(X), 
	insert(X,Tree,TempTree), 
	gen(TempTree, NewTree). 
	gen(Tree, Tree). 
	insert(X,nil,tr(X,nil,nil)). 
	insert(X,tr(X,L,R),tr(X,L,R)):-!. 
	insert(X,tr(K,L,R),tr(K,L1,R)):- 
	X<K,!, 
	insert(X,L,L1). 
	insert(X,tr(K,L,R),tr(K,L,R1)):- 
	insert(X,R,R1). 

	max(X,Y,X):-X>Y. 
	max(X,Y,Y):-X<Y. 
	max(X,Y,Y):-X=Y. 
	height (nil,0):-!. 
	height (tr(_,Left,Right),H):-height (Left,NewH1),height (Right,NewH2),max(NewH1,NewH2,MaxH),H=MaxH+1. 
	write_tree(Tree) :- height(Tree, Height), 
	m_t(Tree, 0, Height). 
	m_t(_, Level, Height) :- Level>Height, !. 
	m_t(Tree, Level, Height) :- out_t(Tree, Level, 0), nl, 
	NewLevel=Level+1, 
	m_t(Tree, NewLevel, Height). 
	out_t(nil,_,_). 
	out_t(tr(E,Left,Right), Level, Depth) :- NewDepth=Depth+1, 
	out_t(Left, Level, NewDepth), 
	w_t(E, Level, Depth), 
	out_t(Right, Level, NewDepth). 
	w_t(E, Level, Level) :- !, writef("%2", E). 
	w_t(_,_,_):- writef("%5"," "). 
menu(T):-
	write("Menu"),nl, 
	write("input: "),nl, 
	write(" 1 - to print the tree"),nl, 
	write(" 0 - exit"),nl, 
	write(">> "), readchar(X),write(X),nl,solve(X,T),nl,nl,menu(T),nl. 
	solve('1', T):-
		write_tree(T).
	solve('0', _):- write("Enough"),exit,nl,nl.
goal
run.
