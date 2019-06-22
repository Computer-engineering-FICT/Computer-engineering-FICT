%------------------------------------------------------------------------------------------
lab4:-input_term(X),analiz_term(X,Y).
input_term(X):-write('input term'),put(13),put(10),read(X).
analiz_term(X,Y):-X=..[F|L],write('Functor: '),write(F),put(13),put(10),
		         write('Arguments: '),writeq(L),
		         anal_arg(L,Y).
analiz_term(X,Y):-true.

anal_arg([L|Ls],Y):-an_term(L,Y),anal_arg(Ls,Y).
anal_arg([],Y).

an_term(L,Y):-writeq(L),bagof(_,a_term(L),_).
an_term(L,Y):-write('unknown type'),true.

a_term(X):-float(X),write(' float ').
a_term(X):-integer(X),write(' integer ').
a_term(X):-number(X),write(' number ').
a_term(X):-string(X),write(' string ').
a_term(X):-atom(X),write(' atom ').
a_term(X):-atomic(X),write(' atomic ').
a_term(X):-var(X),write(' var ').
a_term([X|T]):- write('List').

a_term(X):-
	functor(X,N,A),A=\=0,write( ' structure ( arity='),write(A),write(')').

%-----------------------------------------------------------------------------------------------------

group('IV-23','student1').
group('IV-23','student2').
group('IV-24','student3').
group('IV-25','student4').

prof('student1',0).
prof('student2',1).
prof('student3',2).
prof('student4',0).

stependia('student1',false).
stependia('student2',false).
stependia('student3',true).
stependia('student4',true).

kontract(X):-prof(X,0),stependia(X,false).
%----------------------------------------------------------------------------------------

add_term:-write('adding term, input term: '),
            goal(X,Z),asserta(Z),keyb(_,_),exit_popup.
goal(N,Z):- pict(N,A,Lb), dialrd(A, Lb, La),
                   Z=..[N|La], write(Z),write(' added'),!;error.

dialrd(0, [], []).
dialrd(A, [X|L], La) :- A1 is A-1, dial(X,Y),
                        dialrd(A1, L, La1), La=[Y|La1].
dial(X,Y) :- write(X), write('='), read(Y).

pict(group,2,['String(group): ','String(Name): ']).
pict(prof,2,['String(Name): ','Integer(years): ']).

%------------------------------------------------------------
algebra:-write('reliachionnaya algebra'),
	write('input predikat r : '),
            read(G1),nl,assertz(G1),
            write('input predikat s : '),read(G2),assertz(G2),nl,
            write('input r_x_s : '),read(G3),nl,
            G1=..[R1|R],G2=..[S1|S],G3=..[RDS1|RDS],
            F1=..[R1|RDS],F2=..[S1|RDS],
            (r_x_s(F1,F2)->
                       write('rule is ok');
                       write('rule is err') ),
                       get0(B).

%------------------------------------------------------------------

add_argument:-write('Input term, please: '),read(G),
            write('In which position you want to add argument? '),read(N),
            write('Input argument:'),read(A),
        G=..[L|Li],inslst(Li,A,N,Lo),So=..[L|Lo],asserta(So),write(So).

inslst([],Atom,X,Z):-write('Number N is to big.'),fail.
inslst(Li,Atom,0,[Atom|Li]).
inslst([L|Li],Atom,N,[L|Lo]):-N>0,N1 is N-1,inslst(Li,Atom,N1,Lo).

inslst(Li,A,0,[A|Li]).
inslst([L|Li],A,N,[L|Lo]):-N>0,N1 is N-1,inslst(Li,A,N1,Lo).
