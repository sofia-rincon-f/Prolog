padre_de(carlos, sofia).
padre_de(albeiro, carlos).
padre_de(albeiro, cristina).
padre_de(adolfo, antonia).

madre_de(elizabeth, sofia).
madre_de(amparo, carlos).
madre_de(amparo, cristina).
madre_de(graciela, elizabeth).
madre_de(cristina, antonia).

padre(X, Y) :- padre_de(X, Y).
madre(X, Y) :- madre_de(X, Y).

abuelo(X, Y) :-
    padre(X, Z),
    padre(Z, Y);
    madre(Z, Y).

abuela(X, Y) :-
    madre(X, Z),
    padre(Z, Y);
    madre(Z, Y).

hermano(X, Y) :-
    padre(Z, X),
    padre(Z, Y);
    madre(Z, X),
    madre(Z, X),
    X \= Y.

tio(X, Y) :-
    hermano(X, Z),
    padre(Z, Y);
    madre(Z, Y).

primo(X, Y) :-
    padre(A, X),
    madre(B, Y),
    hermano(A, B),
    X \= Y.
