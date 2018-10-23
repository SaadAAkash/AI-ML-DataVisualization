% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.
adjacent(a,b).
adjacent(a,c).
adjacent(a,d).
adjacent(b,e).
adjacent(e,f).
append([],X,[X]).
append([H|T],X,[H|L]):-append(T,X,L).
path(A,A,P,P).
path(A,B,P,Q):-adjacent(A,X), append(P,X,Y), path(X,B,Y,Q).
