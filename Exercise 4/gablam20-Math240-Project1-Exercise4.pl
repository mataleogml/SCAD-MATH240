/*
SCAD Spring 2022 - Math240-01 - Professor Juras
Project 1: Exercise 4

Gabriel Lam 
Amadeus Cameron
Vincent Lee
Jake Aicher
Yuting(Joy) Yang
*/

% define the type of the constants
attribute(honest).
attribute(robber).

% biconditional
% bi(A,B):-(A->B),(B->A).

% construct the relation "exclusive or"
xor(X,Y):- X,\+Y;\+X,Y.

% define the relation that "only one person committed the theft"
only_one(Arnold, Brian, Charles, Derek, Edward):-
    Arnold==robber, Brian==honest, Charles==honest, Derek==honest, Edward==honest;
    Arnold==honest, Brian==robber, Charles==honest, Derek==honest, Edward==honest;
    Arnold==honest, Brian==honest, Charles==robber, Derek==honest, Edward==honest;
    Arnold==honest, Brian==honest, Charles==honest, Derek==robber, Edward==honest;
    Arnold==honest, Brian==honest, Charles==honest, Derek==honest, Edward==robber.

bank_robbery(Arnold, Brian, Charles, Derek, Edward):-
    attribute(Arnold), attribute(Brian), 
    attribute(Charles), attribute(Derek), attribute(Edward),
% It wasn’t Edward. It was Brian.
    xor(Edward\==robber, Brian == robber),

% It wasn’t Charles. It wasn’t Edward.
     xor(Charles\==robber, Edward\==robber),

% It was Edward. It wasn’t Arnold.
     xor(Edward==robber, Arnold\==robber),

% It was Charles. It was Brian.
     xor(Charles == robber, Brian == robber),

% It was Derek. It wasn’t Arnold.
     xor(Derek==robber, Arnold\==robber),

% Only one person committed the theft.
    only_one(Arnold, Brian, Charles, Derek, Edward).