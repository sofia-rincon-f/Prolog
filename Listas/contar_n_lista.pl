k_elementos([a,b,c,d,e,f],k).


count([],0).
count([1|T],N) :- count(T,N1), N is N1 + 1.
count([X|T],N) :- X \= 1, count(T,N).


%--------------------------------------------------------------------------------


count([], 0).
count([H|T], N) :-
   count(T, X),
   (  H =:= 1
   -> N is X+1
   ;  N is X
   ).

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


%---------------CONTAR CUANTOS ELEMENTOS HAY 

% Caso Base: Una lista vacía tiene 0 elementos.
contar_elementos([], 0).

% Caso Recursivo:
contar_elementos([_|T], N) :-
    contar_elementos(T, N_resto), % 1. Cuenta cuántos hay en el resto (cola)
    N is N_resto + 1.           % 2. Al total del resto, súmale 1 por la cabeza que quitaste

    sumar_lista(T, SumaResto),    % 1. Primero sumamos el resto de la lista (Cola)
    Suma Total is H + SumaResto.  % 2. Luego sumamos la cabeza actual al resultado

    %?- contar_elementos([manzana, pera, uva, sandia], N).


