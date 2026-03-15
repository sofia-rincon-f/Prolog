% ----- HECHOS (BASE DE DATOS) -----
progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

% ----- GÉNEROS -----
mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).
hombre(tomas).
hombre(jose).
hombre(jaime).

% ----- REGLAS -----

% Madre y Padre (versión práctica)
es_madre(X, Y) :- mujer(X), progenitor(X, Y).
es_padre(X, Y) :- hombre(X), progenitor(X, Y).

es_padre(X) :- 
    hombre(X), 
    progenitor(X, _).

es_madre(X) :- 
    mujer(X), 
    progenitor(X, _).

% Hermanos (usando dif o \= para que no sea hermano de sí mismo)
hermanos(X, Y) :- 
    progenitor(P, X), 
    progenitor(P, Y), 
    X \= Y.

% --- REGLAS DE SEGUNDA GENERACIÓN ---

% Abuelo: Es hombre y es progenitor de alguien (Z) que a su vez es progenitor de Y.
abuelo_de(X, Y) :-
    hombre(X),
    progenitor(X, Z),
    progenitor(Z, Y).

% Abuela: Es mujer y es progenitora de alguien (Z) que a su vez es progenitor de Y.
abuela_de(X, Y) :-
    mujer(X),
    progenitor(X, Z),
    progenitor(Z, Y).

% Tío: Es hombre y es hermano del progenitor de Y.
tio_de(X, Y) :-
    hombre(X),
    hermanos(X, Z),
    progenitor(Z, Y).

% Tía: Es mujer y es hermana del progenitor de Y.
tia_de(X, Y) :-
    mujer(X),
    hermanos(X, Z),
    progenitor(Z, Y).


% ----- ARBOLES
    % ----- es_madre(X), es_padre(X), es_tia(X, Y)
