% Hechos
americano(west).

enemigo(corea_sur, usa).

hostil(X) :- enemigo(X, usa).

misil(m1).

tiene(corea_sur, m1).

vende(west, X, corea_sur) :- misil(X), tiene(corea_sur, X).

arma(X) :- misil(X).

% Regla principal
criminal(X) :-
    americano(X),
    arma(Y),
    vende(X,Y,Z),
    hostil(Z).