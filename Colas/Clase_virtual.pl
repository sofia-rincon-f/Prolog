%conexion(v, e, 16).
%conexion(v, c, 13).
%conexion(e, s, 12).
%conexion(c, e, 4).
%conexion(c, r, 14).
%conexion(s, c, 9).
%conexion(s, w, 20).
%conexion(r, s, 7).
%conexion(r, w, 4).


%diseño de estructuras 
%conexion(ciudad (v), ciudad (e), costos(16)).


%conexiones(ciudad(v), [destino(ciudad(e), costo(16)),
%					 destino(ciudad(c),costo(13))]).


%conexiones([conexion(ciudad(v),ciudad(e), costo(16)), 
%			conexion(ciudad(v),ciudad(c), costo(13)), 
%			conexion(ciudad(e),ciudad(s), costo(12)),
%			...])


conexiones([conexion(ciudad(v),ciudad(e), costo(16)), 
			conexion(ciudad(v),ciudad(c), costo(13)), 
			conexion(ciudad(e),ciudad(s), costo(12)),
			conexion(ciudad(c),ciudad(e), costo(4)),
            conexion(ciudad(c),ciudad(r), costo(14)),
           	conexion(ciudad(s),ciudad(c), costo(9)),
            conexion(ciudad(s),ciudad(w), costo(20)),
            conexion(ciudad(r),ciudad(s), costo(7)),
            conexion(ciudad(r),ciudad(w), costo(4))]).


hay_conexion(O,D):-
    conexiones(LC), %Lista de conexiones, darle nombre 
    member(conexion(ciudad(O), ciudad(D),_),LC) %Omito costo porque no me interesa

esta_conectado_con(O, D, C):-
    	conexiones(LC), 
    	member(conexion(ciudad(O), ciudad(D), costo(C)),LC).

    
//Parcial mismas reglas terminar con el resto de peticiones de las ciudades
