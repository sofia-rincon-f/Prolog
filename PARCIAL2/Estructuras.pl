% Caso base: profundidad 0
generacion(0, [], []).

% Caso recursivo para profundidad 0 y lista no vacía
generacion(0, [t(_,R,_)|T], [R|L]) :-
    generacion(0, T, L).

% Caso base para profundidad > 0 y lista vacía
generacion(N, [], []) :- N > 0.

% Caso recursivo principal para profundidad > 0
generacion(N, [t(I, _, D) | T], L) :-
    N > 0,
    N1 is N - 1,
    generacion(N1, [I, D], L1),  % Asumiendo que I y D forman lista de nodos
    generacion(N, T, L2),
    append(L1, L2, L).


    %------------------------------------------------------------------------------------------

    Forma member

generacion(0, Arboles, Nodos) :- extraer_raices(Arboles, Nodos).
generacion(N, Arboles, Nodos) :-
    N > 0,
    N1 is N - 1,
    expandir_arboles(Arboles, SubArboles),
    generacion(N1, SubArboles, Nodos).
