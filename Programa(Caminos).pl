arista(vancouver, edmonton, 16).
arista(vancouver, calgary, 13).
arista(calgary, edmonton, 4).
arista(edmonton, saskatoon, 12).
arista(saskatoon, calgary, 9).
arista(saskatoon, winnipeg, 20).
arista(calgary, regina, 14).
arista(regina, saskatoon, 7).
arista(regina, winnipeg, 4).



conecta(X, Y, C) :-
    arista(X, Y, C).



conectado(X, Y, C) :-
    arista(X, Y, C).

conectado(X, Y, C) :-
    arista(Y, X, C).


estan_conectados(X, Y) :-
    arista(X, Y, _).

estan_conectados(X, Y) :-
    arista(Y, X, _).


camino_por(X, Y, Z, CostoTotal) :-
    arista(X, Y, C1),
    arista(Y, Z, C2),
    CostoTotal is C1 + C2.

camino(X, Y, C) :-
    arista(X, Y, C).

camino(X, Y, CostoTotal) :-
    arista(X, Z, C1),            
    camino(Z, Y, C2),            
    CostoTotal is C1 + C2.