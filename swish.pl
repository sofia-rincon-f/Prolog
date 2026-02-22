/* La ley dice que es un crimen para un Estadounidense vender armas a naciones
hostiles. Corea del Sur, enemigo de Estados Unidos, tiene algunos misiles, y todos
sus misiles les fueron vendidos por el Coronel West, quien es Estadounidense.
Pruebe que el Col. West es un criminal. */ 

estadounidense(west).
nacion_hostil(corea_del_sur).
arma(misil).
vendio(west, misil, corea_del_sur).

criminal(X) :-
    estadounidense(X), 
    vendio(X, Arma, Pais), 
    arma(Arma),
    nacion_hostil(Pais).
