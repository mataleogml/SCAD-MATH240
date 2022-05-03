/*
SCAD Spring 2022 - Math240-01 - Professor Juras
Project 1: Exercise 2

Gabriel Lam 
Amadeus Cameron
Vincent Lee
Jake Aicher
Yuting(Joy) Yang
*/

/*
constants: s1, s2, s3, s4, s5, s6, s7, s8
variables: Harvey, Jennie, Joyce, Kenny, Lia,
Mark, Peter, Rick,
*/

% define the "type" of the constants
seat(s1).
seat(s2).
seat(s3).
seat(s4).
seat(s5).
seat(s6).
seat(s7).
seat(s8).


% define the relation "to be higher"
higher(s8,s7).
higher(s7,s6).
higher(s6,s5).
higher(s5,s4).
higher(s4,s3).
higher(s3,s2).
higher(s2,s1).

is_higher(X,Y):-higher(X,Y).                % ";" is logical "or"
is_higher(X,Y):-higher(X,Z),is_higher(Z,Y). % "," is logigal "and"

% define the relation "to be across"
across(s1,s5).
across(s2,s6).
across(s3,s7).
across(s4,s8).

is_across(X,Y):-across(X,Y);across(Y,X).

% define the relation "to be next to"
next(s1,s2).
next(s2,s3).
next(s3,s4).
next(s4,s5).
next(s5,s6).
next(s6,s7).
next(s7,s8).
next(s8,s1).

is_next(X,Y):-next(X,Y);next(Y,X). 

% define the relation "to be different"
is_different(X1,X2,X3,X4,X5,X6,X7,X8):-
    X1\=X2,X1\=X3,X1\=X4,X1\=X5,X1\=X6,X1\=X7,X1\=X8,
    X2\=X3,X2\=X4,X2\=X5,X2\=X6,X2\=X7,X2\=X8,
    X3\=X4,X3\=X5,X3\=X6,X3\=X7,X3\=X8,
    X4\=X5,X4\=X6,X4\=X7,X4\=X8,
    X5\=X6,X5\=X7,X5\=X8,
    X6\=X7,X6\=X8,
    X7\=X8.

% now we write the code
training_stars(Alisa, Amanda, Eric, Gabbie, Nick, Sarah, Sydney, William):-
    
    
    
    %1 William is next to Alisa and Nick.
    is_next(William, Alisa),
    is_next(William, Nick),
    
    %2 William is across from Gabbie.
    is_across(William, Gabbie),

    %3 Amanda is Next to Sarah
    is_next(Amanda, Sarah),

    %4 Sarah is acros from Eric
    is_across(Sarah, Eric),
    
    %5 Nick is next to Eric
    is_next(Nick, Eric),
    
    %6 Sydney is at seat 4, 
    %Sydney is next to Gabbie%
    is_next(Sydney,Gabbie),
    Sydney=s4,
    
    %7 Gabbie has a higher seat number than Sydney.
    is_higher(Gabbie, Sydney),

    %8  Alisa is not in Seat 2.
    Alisa\=s2,

    is_different(Alisa, Amanda, Eric, Gabbie, Nick, Sarah, Sydney, William).
    
% Query
% training_stars(Harvey, Jennie, Joyce, Kenny, Lia, Mark, Peter, Rick).