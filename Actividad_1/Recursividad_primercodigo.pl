% --- HECHOS ---
padre_de(carlos, sofia).
padre_de(albeiro, carlos).
padre_de(albeiro, cristina).
padre_de(adolfo, antonia).

madre_de(elizabeth, sofia).
madre_de(amparo, carlos).
madre_de(amparo, cristina).
madre_de(graciela, elizabeth).
madre_de(cristina, antonia).

% --- REGLAS BASE ---
% Unificamos ambos sexos en una sola relación de poder
progenitor(X, Y) :- padre_de(X, Y).
progenitor(X, Y) :- madre_de(X, Y).

% --- RECURSIÓN (Ancestros) ---
% Caso Base: Relación directa
ancestro(X, Y) :- progenitor(X, Y).

% Caso Recursivo: X es antepasado de Y si X engendró a un Z que es ancestro de Y
ancestro(X, Y) :- 
    progenitor(X, Z), 
    ancestro(Z, Y).

% --- RELACIONES FAMILIARES ---
% Hermano: Comparten al menos un progenitor y no son la misma persona
hermano(X, Y) :- 
    progenitor(P, X), 
    progenitor(P, Y), 
    X \= Y.

% Tío: Hermano de un progenitor
tio(X, Y) :- 
    hermano(X, Z), 
    progenitor(Z, Y).

% Primo: Hijo de un tío
primo(X, Y) :- 
    progenitor(P, X), 
    tio(P, Y).
