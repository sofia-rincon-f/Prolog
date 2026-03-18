ultimo([Result], Result). 					% Base			(Al final puedo unificar acá porque es una lista con un elemento
ultimo([_|L], Result) :- ultimo(L, Result). % Recursividad (Logra unificar acá al pasarla toda)
       
 %| Simbolo que separa los elementos, a mí me interesa es la cola, por eso en la cabeza le pongo _
