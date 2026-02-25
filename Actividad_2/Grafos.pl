% ==============================
% BASE DE CONOCIMIENTO (GRAFO)
% ==============================

arista(vancouver, edmonton, 16).
arista(vancouver, calgary, 13).

arista(calgary, edmonton, 4).

arista(edmonton, saskatoon, 12).

arista(saskatoon, calgary, 9).
arista(saskatoon, winnipeg, 20).

arista(calgary, regina, 14).

arista(regina, saskatoon, 7).
arista(regina, winnipeg, 4).


% ==============================
% CONEXIONES DIRECTAS
% ==============================

% Conexión directa (dirigida)
conecta(X, Y, C) :-
    arista(X, Y, C).

% Conexión en cualquier sentido
conectado(X, Y, C) :-
    arista(X, Y, C).
conectado(X, Y, C) :-
    arista(Y, X, C).


% ==============================
% ¿UN NODO TIENE ARISTAS?
% ==============================

estan_conectados(X, Y) :-
    arista(X, Y, _).
estan_conectados(X, Y) :-
    arista(Y, X, _).


% ==============================
% CAMINO PASANDO POR UN INTERMEDIO
% ==============================

camino_por(X, Y, Z, CostoTotal) :-
    arista(X, Y, C1),
    arista(Y, Z, C2),
    CostoTotal is C1 + C2.


% ==============================
% CAMINO GENERAL
% ==============================

% Caso base: conexión directa
camino(X, Y, Costo) :-
    arista(X, Y, Costo).
