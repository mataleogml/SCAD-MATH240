/*
SCAD Spring 2022 - Math240-01 - Professor Juras
Project 1: Exercise 3

Gabriel Lam 
Amadeus Cameron
Vincent Lee
Jake Aicher
Yuting(Joy) Yang
*/


/*
After the recent SCAD snail racing contest, the four contestants were congratulating each other. 
1. Only one snail wore the same number as the position it finished in.
 Sydney is in Seat 4 and she is next to Gabbie (Clue 6), so Gabbie is in either Seat 3 or Seat
 5. But Gabbie has a higher seat number than Sydney (Clue 7). Therefore Gabbie is in Seat 
 William is next to Alisa and Nick (Clue 1), so Alisa and Nick are in Seat 2 and Seat 8 (either
 way around). But Alisa is not in Seat 2 (Clue 8). Therefore Alisa is in Seat 8 and Nick is in
 Seat 2.
 2. Alfred's snail wasn't painted yellow nor blue, and the snail who wore 3, which was painted
 red, beat the snail who came in third.
3. Arthur's snail beat Anne's snail, whereas Alice's snail beat the snail who wore 1.
4. The snail painted green, Alice's, came second and the snail painted blue wore number 4. 5). Anne's snail wore number 1.
Can you work out who's snail finished where, its number and the color it was painted? */

/* define the atoms
Constants: first, second, third, fourth
Variables:
Names of girls: Jackie, Jane, Josie, Julie, 
Numbers they wore: One, Two, Three, Four,
Colors of shits: Blue, Green, Red, Yellow,
*/

% declare the type of constants
rank(first).
rank(second). 
rank(third).
rank(fourth).

% define the relation "to beat someone"
beat(first,second).
beat(second,third).
beat(third,fourth).

has_beaten(X,Y):- beat(X,Y); beat(X,Z),has_beaten(Z,Y).

%  define relation "to be different"
different(X,Y,Z,W):- X\=Y, X\=Z, X\=W,
                     Y\=Z, Y\=W,
                     Z\=W.

% the body of the program
sports_day(Alfred, Alice, Anne, Arthur, One, Two, Three, Four, 
           Red, Green, Blue, Yellow):-
    rank(Alfred), rank(Alice), rank(Anne), rank(Arthur), 
    rank(One), rank(Two), rank(Three), rank(Four), 
    rank(Red), rank(Green), rank(Blue), rank(Yellow),      
% 1.  1. Only one snail wore the same number as the position it finished in.
    (      
    One=first,Two\=second,Three\=third, Four\=fourth;
    One\=first,Two=second,Three\=third, Four\=fourth;
    One\=first,Two\=second,Three=third, Four\=fourth;
    One\=first,Two\=second,Three\=third, Four=fourth
    ),  
/*2. Alfred’s snail wasn’t painted yellow nor blue, and the snail who
    wore 3, which was painted red, beat the snail who came in third.*/
    Alfred\=Yellow, Alfred\=Blue,
    Three=Red, has_beaten(Three, third),
     
/*3.  Arthur’s snail beat Anne’s snail, whereas Alice’s snail beat the
    snail who wore 1. */
    has_beaten(Arthur, Anne),
    has_beaten(Alice, One),

     
/*4. The snail painted green, Alice’s, came second and the snail
    painted blue wore number 4.*/
    Alice=Green, Alice = second, Blue=Four,

%5   Anne’s snail wore number 1.
     Anne=One,       

% all are different.
    different(Alfred, Alice, Anne, Arthur),
    different(One, Two, Three, Four), 
    different(Blue, Green, Red, Yellow).

