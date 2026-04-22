% ----- HECHOS (BASE DE DATOS) -----

progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

% ----- GENERO -----

mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).

hombre(tomas).
hombre(jose).
hombre(jaime).

% ----- REGLAS -----

% Madre
es_madre(X,Y) :-
    mujer(X),
    progenitor(X,Y).

% Padre
es_padre(X,Y) :-
    hombre(X),
    progenitor(X,Y).

% Hijo o hija
es_hijo(X,Y) :-
    progenitor(Y,X).

% Hermanos
hermanos(X,Y) :-
    progenitor(Z,X),
    progenitor(Z,Y),
    X \= Y.

% Hermana
hermana_de(X,Y) :-
    mujer(X),
    hermanos(X,Y).

% Abuelo
abuelo_de(X,Y) :-
    hombre(X),
    progenitor(X,Z),
    progenitor(Z,Y).

% Abuela
abuela_de(X,Y) :-
    mujer(X),
    progenitor(X,Z),
    progenitor(Z,Y).

% Tios (sin excluir al padre)
tio(X,Y) :-
    progenitor(Z,Y),
    progenitor(W,Z),
    progenitor(W,X).
