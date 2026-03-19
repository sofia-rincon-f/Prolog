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





