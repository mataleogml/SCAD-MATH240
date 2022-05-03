/*
SCAD Spring 2022 - Math240-01 - Professor Juras
Project 1: Exercise 1

Gabriel Lam 
Amadeus Cameron
Vincent Lee
Jake Aicher
Yuting(Joy) Yang
*/

before(first,second).
before(second,third).
before(third,fourth).
before(fourth,fifth).
before(fifth,sixth).
before(sixth,seventh).
before(seventh,eight).
before(eight,nineth).
before(nineth,tenth). 

/* Transitive */
is_before(X,Y):-before(X,Y).
is_before(X,Y):-before(X,Z), is_before(Z,Y).
is_after(X,Y):- is_before(Y,X).

/* Conditions */
snail(Simple, Zebra, Frog, Apple, Fizzy, Minty, CD, Top, Kippers, Windy):-
    /* Simple Simon lost to Zebra Wings */
    is_after(Simple, Zebra),

    /* Zebra Wings beat Simple Simon, Frog Flippers and Apple Pie */
    is_before(Zebra, Simple),
    is_before(Zebra, Frog),
    is_before(Zebra, Apple),

    /* Fizzy Pop lost to Minty Mouth, Simple Simon and CD Player */
    is_after(Fizzy, Minty),
    is_after(Fizzy, Simple),
    is_after(Fizzy, CD),

    /* Frog Flippers beat Windy Hill, CD Player and Simple Simon */
    is_before(Frog, Windy),
    is_before(Frog, CD),
    is_before(Frog, Simple),

    /* Top Hat lost to CD Player, Kippers and Apple Pie */
    is_after(Top, CD),
    is_after(Top, Kippers),
    is_after(Top, Apple),

    /* CD Player beat Top Hat and Fizzy Pop */
    is_before(CD, Top),
    is_before(CD, Fizzy),

    /* Apple Pie lost to Zebra Wings and Simple Simon */
    is_after(Apple, Zebra),
    is_after(Apple, Simple),

    /* Kippers lost to Apple Pie and Frog Flippers */
    is_after(Kippers, Apple),
    is_after(Kippers, Frog),

    /* Frog Flippers beat Fizzy Pop, Minty Mouth and CD Player */
    is_before(Frog, Fizzy),
    is_before(Frog, Minty),
    is_before(Frog, CD),

    /* CD Player lost to Frog Flippers, Kippers and Apple Pie */
    is_after(CD, Frog),
    is_after(CD, Kippers),
    is_after(CD, Apple),

    /* Top Hat beat Fizzy Pop and Windy Hill */
    is_before(Top, Fizzy),
    is_before(Top, Windy),

    /* Minty Mouth lost to Windy Hill and Simple Simon */
    is_after(Minty, Windy),
    is_after(Minty, Simple),

    /* Windy Hill lost to Apple Pie and CD Player */
    is_after(Windy, Apple),
    is_after(Windy, CD).