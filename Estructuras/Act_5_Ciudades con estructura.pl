conexiones([conexion(ciudad(v),ciudad(e), costo(16)), 
            conexion(ciudad(v),ciudad(c), costo(13)), 
            conexion(ciudad(e),ciudad(s), costo(12)),
            conexion(ciudad(c),ciudad(e), costo(4)),
            conexion(ciudad(c),ciudad(r), costo(14)),
            conexion(ciudad(s),ciudad(c), costo(9)),
            conexion(ciudad(s),ciudad(w), costo(20)),
            conexion(ciudad(r),ciudad(s), costo(7)),
            conexion(ciudad(r),ciudad(w), costo(4))]).

hay_conexion(O,D):-
    conexiones(LC), 
    member(conexion(ciudad(O), ciudad(D),_),LC).

esta_conectado_con(O, D, C):-
    conexiones(LC), 
    member(conexion(ciudad(O), ciudad(D), costo(C)),LC).

tiene_aristas(Nodo) :-
    conexiones(LC),
    member(conexion(ciudad(Nodo), _, _), LC).

camino_por(X, Z, Y, CostoTotal) :-
    conexiones(LC),
    member(conexion(ciudad(X), ciudad(Y), costo(C1)), LC),
    member(conexion(ciudad(Y), ciudad(Z), costo(C2)), LC),
    CostoTotal is C1 + C2.

camino(X, Y, C) :- 
    conexiones(LC),
    member(conexion(ciudad(X), ciudad(Y), costo(C)), LC).

camino(X, Y, CostoTotal) :-
    conexiones(LC),
    member(conexion(ciudad(X), ciudad(Z), costo(C1)), LC),
    camino(Z, Y, C2),
    CostoTotal is C1 + C2.
