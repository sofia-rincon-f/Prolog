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






