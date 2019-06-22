ifthenelse(Goal1,Goal2,Goal3) :- Goal1 -> Goal2 ; Goal3.

% Minimum A,B->R
min(A,B,R) :- A<B, R is A; A>=B, R is B.
min_if(A,B,R) :- ifthenelse(A@<B, R is A, R is B).

% Find minimum in list
min([H],H).
min([H|T],M) :- min(T,M2), min(H,M2,M).

min_if([H],H).
min_if([H|T],M) :- min_if(T,M2), min_if(H,M2,M).

% Sort ascending
del([H|T],El,R) :- ifthenelse(H=\=El, (del(T,El,T1),R=[H|T1]), R=T).
asort([],[]).
asort(L,[H|T]) :- min(L,H), del(L,H,L2), asort(L2,T).

% swapping
append([], X, X).
append([A|X], Y, [A|Z]) :- append(X,Y,Z).
swap([A1,B1,N1|T1],[A2,B2,N2|T2],A,B):- swap([N1|T1],[N2|T2],[A1,B2],[A2,B1],A,B).
swap([A1,B1,N1|T1],[A2,B2,N2|T2],[X1|Y1],[X2|Y2],A,B):- append([X1|Y1],[A1,B2],D),append([X2|Y2],[A2,B1],E),swap([N1|T1],[N2|T2],D,E,A,B).
swap([A1,B1],[A2,B2],[X1|Y1],[X2|Y2],A,B):- A = [X1|Y1], B = [X2|Y2].

% Tests
testmin1(X) :- min([4, 3, 45, 34, 23, 8, 19, 12, 11],X).
testmin2(X) :- min_if([4, 5, 9, 1, 3, 5, 2, 4, 12], X).
testsort(X) :- asort([4, 5, 9, 1, 3, 5, 2, 4, 12], X).
testswap(X,Y) :- swap([1,2,3,4,5,6,7,8],
                      [4,5,6,7,8,9,0,1],X,Y).
