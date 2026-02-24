% -------- SEXO --------
hombre(abraham_simpson).
hombre(herbert_powell).
hombre(homero_simpson).
hombre(bart_simpson).

mujer(mona_simpson).
mujer(marge_simpson).
mujer(patty_bouvier).
mujer(selma_bouvier).
mujer(jacqueline_bouvier).
mujer(lisa_simpson).
mujer(maggie_simpson).
mujer(ling_bouvier).

% -------- PADRES --------
padre(abraham_simpson, herbert_powell).
padre(abraham_simpson, homero_simpson).
padre(clancy_bouvier, marge_simpson).
padre(clancy_bouvier, patty_bouvier).
padre(clancy_bouvier, selma_bouvier).
padre(homero_simpson, bart_simpson).
padre(homero_simpson, lisa_simpson).
padre(homero_simpson, maggie_simpson).

% -------- MADRES --------
madre(mona_simpson, herbert_powell).
madre(mona_simpson, homero_simpson).
madre(jacqueline_bouvier, marge_simpson).
madre(jacqueline_bouvier, patty_bouvier).
madre(jacqueline_bouvier, selma_bouvier).
madre(marge_simpson, bart_simpson).
madre(marge_simpson, lisa_simpson).
madre(marge_simpson, maggie_simpson).
madre(selma_bouvier, ling_bouvier).



% progenitor general
progenitor(X,Y) :- padre(X,Y).
progenitor(X,Y) :- madre(X,Y).

% hijo / hija
hijo(X,Y) :- hombre(X), progenitor(Y,X).
hija(X,Y) :- mujer(X), progenitor(Y,X).

% abuelo / abuela
abuelo(X,Y) :-
    hombre(X),
    progenitor(X,Z),
    progenitor(Z,Y).

abuela(X,Y) :-
    mujer(X),
    progenitor(X,Z),
    progenitor(Z,Y).

% hermanos
hermano(X,Y) :-
    hombre(X),
    X \= Y,
    progenitor(P,X),
    progenitor(P,Y).

hermana(X,Y) :-
    mujer(X),
    X \= Y,
    progenitor(P,X),
    progenitor(P,Y).

% tíos
tio(T,N) :-
    hombre(T),
    progenitor(P,N),
    hermano(T,P).

tia(T,N) :-
    mujer(T),
    progenitor(P,N),
    hermana(T,P).
