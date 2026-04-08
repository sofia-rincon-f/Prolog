%punto(X,Y)
%Segmento(punto(X1,Y1), punto(X2, Y2)

%S(segmento(punto(0,0), punto(0,1))),
%S(segmento(punto(0,1), punto(1,0))),
%S(segmento(punto(1,0), punto(0,0))),

conectados(S1, S2):-
    S1=..[segmento,_,P],
    S2=..[segmento,P,_].

	%conectados(segmento(punto(0,0),punto(0,1)),segmento(punto(0,1),punto(1,0))).
	
	%=.. unificación de estructuras en una lista

conectados_v2(segmento(_,P),segmento(P,_)). 

%paso base

poligono([S1, S2]):-
    	conectados(S1, S2).

%paso recursivo 
poligono([S1][S2|Tail]) 
	conectados(S1,S2),
	append([S2], Tail, nombre), %append adiciona un elemento
	poligono(Nombre).
	
%consulta 


poligono_cerrado([S1|Tail]):-
	proper_length(Tail, Len),
	len>1,
	append([S1], Tall, Nombre),
	poligono(Nombre, L),
	conectados(L, S1). 
	
%consulta
	
