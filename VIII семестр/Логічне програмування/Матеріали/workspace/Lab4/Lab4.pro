% ��������� ��������������� �������� ��������� ����� 
% � ��������������� ���������� ��������������� ���� �����.
task1 :-
	write('������� �����, ����������:'),
	read(X),
	handling(X).

handling(X) :-
	number(X),
	write('Ok.').
	
handling(X) :-
	not number(X),
	write('Wrong.').
	
	% ����������� �� ������� � ���������
member(X, [X|T]).
member(X, [H|T]) :-
	member(X, T).	
% ��������� ��� ������� ������� �� ��������� ���������� 
% � ��������������  ���������  �����������  ������� "�����������":
% r_union_s(X1,X2,...,Xn) :- r(X1,X2,...,Xn).
% r_union_s(X1,X2,...,Xn) :- s(X1,X2,...,Xn).
r_union_s([],S2,S2).
r_union_s([H|T],S2,S) :-
		member(H,S2),
		!,
		r_union_s(T,S2,S).
r_union_s([H|T],S2,[H|S]) :-
	r_union_s(T,S2,S).
	