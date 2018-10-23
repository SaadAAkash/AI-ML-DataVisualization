my_append([],temp, ok).
my_append([H|T],temp, [H|ok]):- my_append(T,temp,ok).
