padre(manuel, ricardo).
padre(ricardo, belen).
padre(belen, sara).

ancestro(X, Y) :- padre(X, Y).

ancestro(X, Y):-
    	padre(X, Z),
    	ancestro(Z, Y). %recursivo si se usa al final
