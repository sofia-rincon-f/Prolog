% Definimos nuestro propio predicado: pertenece(Elemento, Lista)

% 1. Si el Elemento es el primer ítem, hemos terminado con éxito.
pertenece(Elemento, [Elemento | _]).

% 2. Si no, descartamos la cabeza y buscamos en el resto.
pertenece(Elemento, [_ | Cola]) :-
    pertenece(Elemento, Cola).
