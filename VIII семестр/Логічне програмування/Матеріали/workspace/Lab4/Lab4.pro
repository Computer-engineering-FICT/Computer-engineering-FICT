% Программа синтаксического контроля вводимого терма 
% с предварительной подсказкой синтаксического типа терма.
task1 :-
	write('Введите число, пожалуйста:'),
	read(X),
	handling(X).

handling(X) :-
	number(X),
	write('Ok.').
	
handling(X) :-
	not number(X),
	write('Wrong.').
	
	% Принадлежит ли элемент Х множеству
member(X, [X|T]).
member(X, [H|T]) :-
	member(X, T).	
% Программа для задания вопроса по групповым отношениям 
% с использованием  отношения  реляционной  алгебры "Объединение":
% r_union_s(X1,X2,...,Xn) :- r(X1,X2,...,Xn).
% r_union_s(X1,X2,...,Xn) :- s(X1,X2,...,Xn).
r_union_s([],S2,S2).
r_union_s([H|T],S2,S) :-
		member(H,S2),
		!,
		r_union_s(T,S2,S).
r_union_s([H|T],S2,[H|S]) :-
	r_union_s(T,S2,S).
	