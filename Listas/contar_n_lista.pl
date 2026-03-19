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


