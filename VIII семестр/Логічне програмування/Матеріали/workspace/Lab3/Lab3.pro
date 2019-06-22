	% преобразование  полинома  из  списковой формы в представление по схеме √орнера
		lst_to_gor([K|Ks],X,E*X+K) :- lst_to_gor(Ks,X,E).
		lst_to_gor([K|[]],_,K).
	% преобразование полинома из списковой  формы  в  форму  аналитического выражени€  
	% с  обозначением показателей степеней знаком "^";
		lst_to_anal([K|Ks],X,E+K*X^N) :-
			N is 0,
			N1 is N+1, 
			lst_to_anal(Ks,X,N1,E).
		lst_to_anal([K|Ks],X,N,E+K*X^N) :-
			N1 is N+1,
			lst_to_anal(Ks,X,N1,E).
		lst_to_anal([K|[]],X,N,K*X^N).
% преобразование  полинома  из  списковой формы в нормальную
	lst_to_norm([K|Ks],[E,(K,N)]) :-
		N is 0,
		N1 is 1, 
		lst_to_norm(Ks,N1,E).
	lst_to_norm([K|Ks],N,[E,(K,N)]) :-
		N1 is N+1,
		lst_to_norm(Ks,N1,E).
	lst_to_norm([K|[]],N,(K,N)).
% --- “ест ---
	test1(Y) :- 
		lst_to_norm([3,2,1],Y).
% ------------
	% „исленное решение квадратного уравнени€
	eq2(A,B,C,X) :- 
		D is B*B-4*A*C, 
		abs(D,D1), 
		RootD is sqrt(D1),
    	(
     		D>=0, !,  
     		( 
     			X is (-B-RootD)/2/A;
     			X is (RootD-B)/2/A
     		);
     		Xr is -B/2/A, !, 
     		( 
     			Xi is RootD/2/A ; 
     			Xi is -RootD/2/A 
     		),
     		X = [Xr,Xi]
     	).
	
% численное решение уравнени€ в виде дробно-рациональной функции 
% (Ax^2+Bx+C)(Dx+E)/(Fx+G)=0
	eq(A,B,C,D,E,F,G,Xa) :-
		X0 is -G/F,
		(
			eq2(A,B,C,X),
			(
				number(X),
					X0 =\= X,
					Xa is X;
				not number(X),
					Xa = X
			);
			X is -E/D,
				X0 =\= X,
				Xa is X
		).
% --- “ест ---
	test2_0(Xa) :- 
		eq(1,2,3,4,5,6,7,Xa).	
	test2_1(Xa) :- 
		eq(1,3,-2,4,5,6,7,Xa).
	test2_3(Xa) :- 
		eq(1,-3,2,4,5,4,-8,Xa).
	test2_4(Xa) :- 
		eq(1,-3,2,4,5,4,8,Xa).
% ------------
% аналитическое решение уравнени€ в виде дробно-рациональной функции 
% (Ax^2+Bx+C)(Dx+E)/(Fx+G)=0
	eq_anal(A,B,C,D,E,F,G,Xa) :-
		X0 is -G/F,
		DetS = B*B-4*A*C,
		DetS2 = sqrt(DetS),
		(
			Det is B*B-4*A*C,
			(Det >= 0,
				Det2 is sqrt(Det),	
				(
					X is (-B-Det2)/2/A,
						X0 =\= X,
						Xa = (-B-DetS2)/2/A;
					X is (-B+Det2)/2/A,
						X0 =\= X,
						Xa = (-B+DetS2)/2/A
				);
			Det < 0,
				Xr = -B/2/A, 
				(
					Xi = DetS2/2/A ; 
					Xi = -DetS2/2/A 
				),
     			Xa = [Xr,Xi]
			);
			X is -E/D,
			X0 =\= X,
			Xa = -E/D
		).
% --- “ест ---
	test3_0(Xa) :- 
		eq_anal(1,2,3,4,5,6,7,Xa).	
	test3_1(Xa) :- 
		eq_anal(1,3,-2,4,5,6,7,Xa).
	test3_3(Xa) :- 
		eq_anal(1,-3,2,4,5,4,-8,Xa).
	test3_4(Xa) :- 
		eq_anal(1,-3,2,4,5,4,8,Xa).
	test3_5(Xa) :- 
		eq_anal(1,-3,2,4,5,4,5,Xa).