% Fibo segun chat
fibonacci(0, 0).
fibonacci(1, 1).

% Caso recursivo
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.


%Fibo segun github
fibra ( 0 , 1 ) :-  ! .
mentira ( 1 , 1 ) :-  ! .
fib ( N , Resultado ) :-  N1 es N  -  1 , N2 es N  -  2 , fib( N1 , Resultado1 ), fib( N2 , Resultado2 ), Resultado es Resultado1  +  Resultado2 .


%Fibo según replica github

fibonacci(0,1):-!. % cut down the backtracking
fibonacci(1,1):-!.

fibonacci(N,X):-
  N > 0, % the constraint to make N always greater than 0; put the integer less than 0 doesn't make sense
  N2 is N - 2, % it doesn't work to pass N-2 into the fibonacci predicate. The "is" is the arithmetic operation, not "=" in other languages 
  N1 is N - 1,
  fibonacci(N2,X2), % get the X2 value
  fibonacci(N1,X1), % get the X1 value
  X is X1 + X2. % calculate the Fibonacci number
