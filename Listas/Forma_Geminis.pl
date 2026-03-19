%----Geminis-----------------------------------------------------------------------

% Caso Base: El elemento en la posición 0 es la cabeza (H) de la lista.
k_element([H|_], 0, H). 

% Caso Recursivo: El elemento en la posición K es el mismo que 
% el elemento en la posición K-1 del resto de la lista (T).
k_element([_|T], K, Elemento) :-
    K > 0,
    K_aux is K - 1,
    k_element(T, K_aux, Elemento).


%Consulta: k_element([a, b, c, d, e], 2, X).


%-----------------SUMA DE TODOS LOS ELEMENTOS

% Caso Base: La suma de una lista vacía es 0.
sumar_lista([], 0).

% Caso Recursivo:
sumar_lista([H|T], Suma Total) :-

   %?- sumar_lista([10, 20, 30, 5], Total).
