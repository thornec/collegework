numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X), Y, s(Z)) :- add(X,Y,Z).
add(p(X), Y, p(Z)) :- add(X,Y,Z).


/* Exercise 3 Solution */
minus(0,0).
/* minus(0,Z) :- minus(0,0). */ 
minus(s(p(X)),Y) :- minus(X,Y).
minus(p(s(X)),Y) :- minus(X,Y).

minus(s(X),p(Y)) :- minus(X,Y).
minus(p(X),s(Y)) :- minus(X,Y).

/* Exercise 4 Solution Minus Cases */
add2(-X,Y,Z) :- minus(X,A), add2(A,Y,Z).
add2(X,-Y,Z) :- minus(-Y,A), add2(X,A,Z).
add2(-X,-Y,Z) :- minus(-X,A), minus(-Y,B), add2(A,B,Z).

/* succ() cases */
add2(s(A+B),Y,s(Z)) :- add2(A+B,Y,Z).
add2(X,s(A+B),s(Z)) :- add2(X,A+B,Z).
add2(s(A+B),s(X+Y),s(s(Z))) :- add2(A+B,X+Y,Z).

/* s() and p() possibilities that cancel out */
add2(X,s(p(Y)),Z) 		:- 	add2(X,Y,Z).
add2(s(p(X)),Y,Z) 		:- 	add2(X,Y,Z).
add2(s(p(X)),s(p(Y)),Z) :- 	add2(X,Y,Z).
add2(p(s(X)),Y,Z) 		:- 	add2(X,Y,Z).
add2(X,p(s(Y)),Z) 		:- 	add2(X,Y,Z).
add2(p(s(X),p(s(Y)),Z) 	:- 	add2(X,Y,Z).

/* Alternative Canceling Cases */
add2(s(X),p(Y),Z) :- add2(X,Y,Z).
add2(p(X),s(Y),Z) :- add2(X,Y,Z).


/* Exercise 1 Solution */
add2(A+B,Y,Z):- add2(A,B,X), 
			add2(X,Y,Z).
add2(X,A+B,Z):- add2(A,B,Y), 
			add2(X,Y,Z).
add2(A+B,C+D,Z):- add2(A,B,Y), 
			add2(C,D,R),
			add2(Y,R,Z).


add2(X,Y,Z):- add(X,Y,Z).

/* Exercise 6 Adjustments */
add2(-X,Y,Z) :- minus(X,A),
			    add2(A,Y,Z).
add2(X,-Y,Z) :- minus(Y,B),
			    add2(X,B,Z).
add2(-X,-Y,Z) :- minus(X,A),
				 minus(Y,B),
				 add2(A,B,Z).

/* Exercise 5 Solution */

subtract(-X,Y,Z) :- minus(X,A),
				subtract(A,Y,Z).
subtract(X,-Y,Z) :- minus(Y,A),
				subtract(X,A,Z).
subtract(X,Y,Z) :- minus(Y,A),
				add2(X,A,Z).


