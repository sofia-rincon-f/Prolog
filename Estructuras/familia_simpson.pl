familia([relacion(abraham, hombre, herbert, hombre),
        relacion(abraham, hombre, homero, hombre),
        relacion(clancy, hombre, marge, mujer),
        relacion(clancy, hombre, patty, mujer),
        relacion(clandy, hombre, selma, mujer),
        relacion(homero, hombre, bart, hombre),
        relacion(homero, hombre, lisa, mujer),
        relacion(homero, hombre, maggie, mujer),
        relacion(mona, mujer, herbert, hombre),
        relacion(mona, mujer, homero, hombre),
        relacion(jacqueline, mujer, marge, mujer),
        relacion(jacqueline, mujer, patty, mujer),
        relacion(jacqueline, mujer, selma, mujer),
        relacion(marge, mujer, bart, hombre),
        relacion(marge, mujer, lisa, mujer),
        relacion(marge, mujer, maggie, mujer),
        relacion(selma, mujer, ling, mujer)]).


es_padre(P, H) :-
    familia(FM),
    member(relacion(P, hombre, H, _), FM). % Se cierra el member y luego el punto.

es_madre(M, H) :-
    familia(FM),
    member(relacion(M, mujer, H, _), FM).

es_hijo(H, P) :-
    familia(FM),
    member(relacion(P, _, H, hombre), FM).

es_hija(H, P) :-
    familia(FM),
    member(relacion(P, _, H, mujer), FM).

es_abuelo(A, N) :-
    familia(FM),
    member(relacion(A, hombre, H, _), FM),
    member(relacion(H, _, N, _), FM).

es_abuela(A, N) :-
    familia(FM),
    member(relacion(A, mujer, H, _), FM),
    member(relacion(H, _, N, _), FM).

hermana(A, B) :-
    familia(FM),
    member(relacion(P, hombre, A, mujer), FM),
    member(relacion(P, _, B, _), FM),
    A \= B.

hermano(A, B) :-
    familia(FM),
    member(relacion(P, hombre, A, hombre), FM),
    member(relacion(P, _, B, _), FM),
    A \= B.

es_tia(T, S) :-
    familia(FM), 
    hermana(T, P_M),
    member(relacion(P_M, _, S, _), FM).

es_tio(T, S) :-
    familia(FM), 
    hermano(T, P_M),
    member(relacion(P_M, _, S, _), FM).

