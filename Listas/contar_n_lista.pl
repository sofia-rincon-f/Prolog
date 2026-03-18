k_elementos([a,b,c,d,e,f],k).


count([],0).
count([1|T],N) :- count(T,N1), N is N1 + 1.
count([X|T],N) :- X \= 1, count(T,N).





