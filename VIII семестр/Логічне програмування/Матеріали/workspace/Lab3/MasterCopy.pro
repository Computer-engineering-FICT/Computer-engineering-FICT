% ��������� �����
sum(1,0,1).
sum(3,2,5).

% ������������� �����
sum(X,Y,X+Y).

% �������������� �������
sum(X,Y,Z) :- Z is X+Y.
mul(X,Y,Z) :- Z is '*'(X,Y).
div(X,Y,Z) :- is(Z,X/Y).

% ������������� �������
sub(X,Y,Z) :- Z = -(X,Y).
mul(X,Y,Z) :- Z = X*Y.

% ���������� Y=abs(X) ������������� ���������� ����������
abs(X,Y) :- number(X),(  X >= 0,  Y is X ,!  ;
Y is 0-X ,! ).

% ����������� ��� �������������� Y �� �������� X
abs(X,Y) :- number(Y),Y >= 0, !,( X is Y ; X is -Y ).
% ���� ����� ������ ?- abs(X,<�����>).

% is(Y,sqrt(X)) :- sqrt(X,Y).
sqrt(0,0).
sqrt(X,Y) :-
    X>=0, A is X/2, sq(X,A,Y).

% � - ��������� ����������� - ���������� ��������� ������
sq(X,Y0,Y1) :- Y2 is (Y0+X/Y0)/2, Dy is Y2-Y0, abs(Dy,E),
                ( E < 0.0001,!,Y1 = Y2 ; sq(X,Y2,Y1)).

% ������������� ������������� ������� � ���� ������� ������� ���������
sqed(A,B,C,Xa) :- 
	D = B*B-4*A*C, 
	D2=sqrt(D), 
   ( 
   	Xa = ( (-B-D2)/2/A, D>=0)  ;
		Xa = ( (D2-B)/2/A, D>=0) ;
     	Xr = -B/2/A, (Xi = D2/2/A ; Xi = -D2/2/A ),
     	Xa = ([Xr,Xi], D<0)    
	).

% ��������� ������� ����������� ���������
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
