domains
i = integer
list = i*
predicates
nondeterm mnozh(list, list, list)/*создает множество элементов, входящих в список несколько раз*/
nondeterm member(i, list)/*узнает, принадлежит ли элемент списку*/
nondeterm do(char) %Взаимодействие с меню
nondeterm run %Запуск меню
clauses
member(X, [X|_]).
/*Если элемент является головой списка, то он принадлежит списку*/

member(X, [_|T]):-
/*Если первый элемент списка не совпадает
с переданным, то поиск элемента продолжается в хвосте списка,
если список опустеет, предикат станет ложным,
следовательно элемент не принадлежит списку*/
member(X,T).

mnozh([H|T], T1, R):-
/*Если элемент списка H принадлежит его хвосту, и ещё не
является элементов мультимножества, то он добавляется в него,
предикат продолжает работу с хвостом списка*/
member(H,T),
not(member(H,T1)),
mnozh(T, [H|T1], R).
mnozh([H|T], T1, R):-
/*Если элемент списка H принадлежит его хвосту, и уже
является элементов мультимножества, то он пропускается,
предикат продолжает работу с хвостом списка*/
member(H, T),
member(H, T1),
mnozh(T,T1,R).

mnozh([H|T], T1, R):-
/*Если элемент списка H не принадлежит его хвосту,
то он пропускается,
предикат продолжает работу с хвостом списка*/
not(member(H, T)),
mnozh(T, T1, R).
mnozh([], R, R).
