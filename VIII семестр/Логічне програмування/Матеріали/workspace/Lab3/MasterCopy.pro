% Численные факты
sum(1,0,1).
sum(3,2,5).

% Аналитические факты
sum(X,Y,X+Y).

% Вычислительные правила
sum(X,Y,Z) :- Z is X+Y.
mul(X,Y,Z) :- Z is '*'(X,Y).
div(X,Y,Z) :- is(Z,X/Y).

% Невычисляемые правила
sub(X,Y,Z) :- Z = -(X,Y).
mul(X,Y,Z) :- Z = X*Y.

% Вычисление Y=abs(X) нестандартной двуместной процудурой
abs(X,Y) :- number(X),(  X >= 0,  Y is X ,!  ;
Y is 0-X ,! ).

% Утверждение для восстановления Y по значению X
abs(X,Y) :- number(Y),Y >= 0, !,( X is Y ; X is -Y ).
% если задан вопрос ?- abs(X,<число>).

% is(Y,sqrt(X)) :- sqrt(X,Y).
sqrt(0,0).
sqrt(X,Y) :-
    X>=0, A is X/2, sq(X,A,Y).

% А - начальное приближение - желательно подбирать точнее
sq(X,Y0,Y1) :- Y2 is (Y0+X/Y0)/2, Dy is Y2-Y0, abs(Dy,E),
                ( E < 0.0001,!,Y1 = Y2 ; sq(X,Y2,Y1)).

% Аналитическое представление решения в виде полного перечня вариантов
sqed(A,B,C,Xa) :- 
	D = B*B-4*A*C, 
	D2=sqrt(D), 
   ( 
   	Xa = ( (-B-D2)/2/A, D>=0)  ;
		Xa = ( (D2-B)/2/A, D>=0) ;
     	Xr = -B/2/A, (Xi = D2/2/A ; Xi = -D2/2/A ),
     	Xa = ([Xr,Xi], D<0)    
	).

% Численное решение квадратного уравнения
sqed(A,B,C,X) :- 
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
     		Xi is RootD/2/A; 
     		Xi is -RootD/2/A 
     	),
     	X = [Xr,Xi]
    ).
