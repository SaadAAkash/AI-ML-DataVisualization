rev([H|T] , X ):- rev ([H|T] , [], X  ).
rev( [H|T], X, X).
rev([H|T] ,temp, X ):- rev( T, [H|temp], X).

