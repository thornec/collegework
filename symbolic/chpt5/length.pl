

length([], 0).
length([_|T], N) :- length(T,X), N is X+1