%1VerificarSiUnElementoPerteneceAUnaListaDada
pertenece(E,[E|_]).
pertenece(E,[_|F]) :- pertenece(E,F).

%2ObtenerLa LongitudDeUnaLista
longitud([], 0).
longitud([_|Xs], L):-
    longitud(Xs, L2),
    L is L2 + 1.

%3ObtenerLaConcatenaciónDe2ListasDadas
concatena([], Cs, Cs).
concatena([A|As],Bs,[A|Cs]):- 
    concatena(As, Bs, Cs).

%4EliminarUnElementoDeUnaLista
%VerificarSiUnElementoPerteneceAUnaListaDada
eliminar([],_,[]).
eliminar([E|L],E,L):- !.
eliminar([C|Q],E,L):- 
    eliminar(Q,E,N),
    append([C],N,L).

%5AgregarUElementoAUnLista
agrega(E,L1,[E|L1]).

%6SepararUnaListaEn2Listas(pares e impares) 
dividirIP([ ],[ ],[ ]).
dividirIP([L|R],[L|P],I):- E is L mod 2,E=0,dividirIP(R,P,I),!.
dividirIP([L|R],P,[L|I]):- C is L mod 2,C>0,dividirIP(R,P,I),!.

%7VerificarSiUnaListaSeEncuentraDeManeraAscendente
ascendente([]).
ascendente([X,Y|XS]):- X<Y;Y=:=nil, ascendente(XS).

%8VerificarSiUnaListaSeEncuentraDeManeraDescendente
descendente([]). 
descendente([X,Y|XS]):- X>Y;Y=:=nil,descendente(XS).

%9Aplanar(L,A),DondeLEsEnGeneralUnaListaDeListas
aplanar([],[]).
aplanar([X|L],S):-is_list(X),
aplanar(X,S1),
aplanar(L,S2),
append(S1,S2,S),!.
aplanar([X|L],S):-not(is_list(X)),
aplanar(L,S1),
S=[X|S1].

%10ObtenerUnaListaConElementosMenoresQuElElementoHEAD
menorHead([],[]).
menorHead([_],[]).
menorHead([X1,X2|XS],[X2|L]):- X1>X2, menorHead([X1|XS],L). 
menorHead([X1,X2|XS],L):-X1<X2,menorHead([X1|XS],L).

%11ObtenerUnaListaConElementosMayoresQuElElementoHEAD
mayorHead([],[]).
mayorHead([_],[]).
mayorHead([X1,X2|XS],[X2|X]):- X1<X2, mayorHead([X1|XS],X). 
mayorHead([X1,X2|XS],X):-X1>X2,mayorHead([X1|XS],X).

%12ObtenerUnaListaConLosElementosInvertidos
inversa([],[]).
inversa([C|Q],I):- inversa(Q,N),
    append(N,[C],I).
