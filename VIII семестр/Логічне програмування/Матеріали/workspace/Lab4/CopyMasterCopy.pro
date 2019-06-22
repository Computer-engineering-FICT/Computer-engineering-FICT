% ������� ��������� ������ 4
lab4:-in_term(X),analiz(X,Y),true.
% ������� ������, ���� ����� � ������ ��������� ��� ������� �����.
in_term(X):-create_popup('Input term, please:',
            (8,7),(15,60),(14,3)),read(X),exit_popup.
% ����������� ������������ ���� � �������� ����� �����, ������
% ��������� ����� � ����� �� ������������ ����.
analiz(X,Y):-X=..[F|L],create_popup('Functor:',
             (2,7),(4,60),(14,3)),write(F),
             create_popup('Arguments:',(6,7),(23,75),(14,3)),
             writeq(L),nl,anal_arg(L,Y),get0(B),exit_popup,
             exit_popup.
analiz(X,Y):-true.
% ��������� � ��������� ����� �������� � ����������.
% ������� ������������ � ��������� ����, ����� ���������� ������
% ��������� anal_arg ��� ������� ������������ ����������.
anal_arg([L|Ls],Y):-an_term(L,Y),anal_arg(Ls,Y).
anal_arg([],Y).
% �������� anal_arg �������� ���������� ��� �����������������
% ������� ������ �� ������, ������� � ������ ������.
an_term(L,Y):-nl,writeq(L),tget(R,C),tmove(R,15),
              bagof(_,a_term(L),_).
an_term(L,Y):-err_win('Unknown type'),true.
%  ������ ������ ����������� � ������� ��������� bagof,  ����������� ��� ���������� ��������� ���������� ���� a_term.
a_term(L):-atom(L),tget(R,C),C1 is C+1,tmove(R,C1),
           write(' Atom ').
a_term(L):-atomic(L),tget(R,C),C1 is C+1,tmove(R,C1),
           write(' Atomic ').
a_term(L):-float(L),tget(R,C),C1 is C+1,tmove(R,C1),
           write(' Float ').
a_term(L):-integer(L),tget(R,C),C1 is C+1,tmove(R,C1),
           write(' Integer ').
a_term(L):-number(L),tget(R,C),C1 is C+1,tmove(R,C1),
           write(' Number ').
a_term(L):-string(L),tget(R,C),C1 is C+1,tmove(R,C1),
           write(' String(length='),string_length(L,Ln),
           write(Ln),write(') ').
a_term(L):-var(L),tget(R,C),C1 is C+1,tmove(R,C1),
           write(' Variable ').
a_term([L|Ls]):-length([L|Ls],Ln),Ln=\=1,tget(R,C),C1 is C+2,
                tmove(R,C1),write('List(length='),write(Ln),
                write(')').
a_term(L):-functor(L,N,A),A=\=0,tget(R,C),C1 is C+1,tmove(R,C1),
           write(' Structure(arity='),write(A),write(')').
%
err_win(A):-create_popup('',(19,15),(22,65),(12,7)),write(A),
            get0(B),exit_popup.
%        ?-query(Name) :- ��������� ���������� ��������� � �������� ������ � ����� "������-�����"
        query(N) :- form_goal(N,_,Z),call(Z).
        query(N,A) :- form_goal(N,A,Z),call(Z).
% form_fact :- ������ ��������� � ��������� ������ � ���������
form_fact(N) :- form_goal(N,_,Z), assert((Z)).
form_fact(N,A) :- form_goal(N,A,Z), assert((Z)).
% form_fact :- ������ ��������� � ������ ����������� ���������� ������
form_goal(N,A,Z):- pict(N,A,Lb), dialrd(A, Lb, La),
                   Z=..[N|La], write(Z).
% ���� ������ �� ��������
dialrd(0, [], []).
dialrd(A, [X|L], La) :- A1 is A-1, dial(X,Y),
                        dialrd(A1, L, La1), La=[Y|La1].
% ����-����� � ������� ����
dial(X,Y) :- write(X), write('='),
             read(Y).
% ��������� ������� ��� ������������� ��������
pict(p_module,6,['��� ������',
      '���������� ����� ������',
      '������� ���� ����������������',
      '��� ����� ��������� ������',
      '��� ��������� ����������',
      '������ ������ � ������ � ������']).
pict(entry_point,6,['��� ������',
      '���������� ����������',
      '��� ����� �����',
      '������������ ����������',
      'max ����� ����������',
      '������� ����� ����������']).
pict(pict,3,['��� �����',
      '���������� ����������',
      '������ ����������']).
% ����������� ���������: �������������� �������
 p_module(sin,2,assembler,'sin.asm','SLIBCE.LIB',37).
 p_module(sin,2,_,_,'SLIBCE.LIB',37).
% �������������� ������� �����
 entry_point(sin,'�����',sin,double(1,double),155,140).
 entry_point(sin,'�������',cos,double(1,double),155,140).
% ����� �������
func(A,X,Y):-
        entry_point(_,A,X,_,_,_), module(X,_,_,_,Y,_).
