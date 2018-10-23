% member([H|T],H).
% member([H|T],X):-member(T,X).

% find_ith([H|T],X)

find_ith([H|T],0,X):-X is H.
find_ith([H|T],M,X ):-Z is M-1,find_ith([H|T],Z,X).
