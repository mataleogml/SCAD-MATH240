/*
SCAD Spring 2022 - Math240-01 - Professor Juras
Project 1: Exercise 5

Gabriel Lam 
Amadeus Cameron
Vincent Lee
Jake Aicher
Yuting (Joy) Yang
*/

/*
At the recent SCAD Festival, the 100 meters heats were closely
monitored.
Each contestant had to run in two races so that the average place
could be determined.
Only one runner finished in the same place in both races.
Alan was never last. Charles always beat Darren. Brian had at
least one first place. Alan finished third in at least one of the
races. Both Darren and Charles had a second place.
In both races, determine the order in which the contestants
finished?

constants: first, second, third, fourth
variables: Alan, Charles, Brian, Darren
*/

rank(first).
rank(second).
rank(third).
rank(fourth).

before(first,second).
before(second,third).
before(third,fourth).

is_before(X, Y):- before(X, Y).
is_before(X, Y):- before(X, Z), 
is_before(Z, Y).  

xor(X,Y):- X,\+Y;\+X,Y.

same_place(X1, Y1, Z1, W1, X2, Y2, Z2, W2):-
    X1==X2, Y1\=Y2, Z1\=Z2, W1\=W2;
    X1\=X2, Y1==Y2, Z1\=Z2, W1\=W2;
    X1\=X2, Y1\=Y2, Z1==Z2, W1\=W2;
    X1\=X2, Y1\=Y2, Z1\=Z2, W1==W2.

is_different(X,Y,Z,W):- X\=Y, X\=Z, X\=W,
						Y\=Z, Y\=W,
						Z\=W.
 
run(Alan1, Charles1, Brian1, Darren1, Alan2, Charles2, Brian2, Darren2):-
    rank(Alan1),rank(Charles1), rank(Brian1), rank(Darren1), rank(Alan2), rank(Charles2), rank(Brian2), rank(Darren2),
    
% Only one runner finished in the same place in both races.
same_place(Alan1, Charles1, Brian1, Darren1, Alan2, Charles2, Brian2, Darren2),
    
% Alan was never last.
    Alan1\==fourth, 
	Alan2\==fourth,
    
% Charles always beat Darren.
    is_before(Charles1, Darren1),
    is_before(Charles2, Darren2),

% Brian had at least one first place.   
    (Brian1==third; Brian2==third),

% Alan finished third in at least one of the races.  
    (Alan1==third; Alan2==third),
    
    is_different(Alan1, Charles1, Brian1, Darren1),
    is_different(Alan2, Charles2, Brian2, Darren2),
    
% Both Darren and Charles had a second place.
    (Charles1 == second; Charles2\== second), %charles is second, Darren cant be
    (Darren1 == second; Darren2\== second).

