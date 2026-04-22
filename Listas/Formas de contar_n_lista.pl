% Caso base: La lista vacía tiene 0 elementos.
count([], 0).

% Caso recursivo: No importa qué sea la cabeza (_), 
% contamos 1 y seguimos con el resto.
count([_ | T], N) :- 
    count(T, N1), 
    N is N1 + 1.

%Consulta count([a,b,c,d,e,f],K).


%--------------------------------------------------------------------------------


% Lista: [fruta(manzana, roja), fruta(pera, verde), fruta(manzana, amarilla)]

contar_manzanas([], 0).
contar_manzanas([fruta(Nombre, _) | T], N) :-
    contar_manzanas(T, X),
    ( Nombre == manzana
    -> N is X + 1
    ;  N is X
    ).


%CONSULTA contar_manzanas([fruta(manzana, roja), fruta(pera, verde), fruta(manzana, amarilla)], K).


%---------------CONTAR CUANTOS ELEMENTOS HAY 
contar_elementos([], 0).  % Caso base

contar_elementos([_|T], N) :-
    contar_elementos(T, N_resto),
    N is N_resto + 1.   

% --- PREDICADO 2: SUMAR ---
sumar_lista([], 0).       % Caso base (la suma de nada es 0)

sumar_lista([H|T], SumaTotal) :- % <--- Aquí NECESITAS poner [H|T] para usar H
    sumar_lista(T, SumaResto),
    SumaTotal is H + SumaResto.  % <--- AQUÍ TERMINA esta regla.

%?- contar_elementos([manzana, pera, uva, sandia], N), sumar_lista([2,3,1,5],M).


