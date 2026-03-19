% Relación base: Progenitor (Padre o Madre)
progenitor(X, Y) :- padre_de(X, Y).
progenitor(X, Y) :- madre_de(X, Y).

% REGLA RECURSIVA: ancestro(X, Y)
% Caso Base: X es ancestro de Y si es su progenitor directo.
ancestro(X, Y) :- progenitor(X, Y).

% Caso Recursivo: X es ancestro de Y si X es progenitor de un Z, 
% y ese Z es a su vez ancestro de Y.
ancestro(X, Y) :- 
    progenitor(X, Z), 
    ancestro(Z, Y).
