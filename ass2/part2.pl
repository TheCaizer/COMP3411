/*Jackie Cai z5259449 Assignment 2 - Machine Learning*/

:- op(300, xfx, <-).

inter_construction(C1 <- B1, C2 <- B2, C1 <- Z1B, C2 <- Z2B, C <- B) :-
    C1 \= C2,
    intersection(B1, B2, B),
    gensym(z, C),
    subtract(B1, B, B11),
    subtract(B2, B, B12),
    append(B11, [C], Z1B),
    append(B12, [C], Z2B).

% Question 2.1 Intra-construction

intra_construction(C1 <- B1, C1 <- B2, C1 <- B3, C <- Z1B, C <- Z2B) :-
    C1 = C1,
    intersection(B1, B2, B),
    gensym(z, C),
    subtract(B1, B, Z1B),
    subtract(B2, B, Z2B),
    append(B, [C], B3).

% Question 2.2 Absorption

absorption(C1 <- B1, C2 <- B2, C1 <- X1, C2 <- B2):-
    C1 \= C2,
    subset(B2, B1),
    intersection(B1, B2, B3),
    subtract(B1, B3, B4),
    append([C2], B4, X1).

% Question 2.3 Identification

identification(C1 <- B1, C1 <- B2, C1 <- B2, C <- X1):-
    C1 = C1,
    intersection(B1, B2, B3),
    subtract(B2, B3, B4),
    length(B4, 1),
    nth0(0, B4, C),
    subtract(B1, B3, X1). 

% Question 2.4 Dichotomisation
dichotomisation(C1 <- B1, not(C1) <- B2, C1 <- B3, not(C1) <- B4, C3 <- B5, not(C3) <- B6):-
    intersection(B1, B2, A1),
    gensym(z, C3),
    subtract(B1, A1, B5),
    subtract(B2, A1, B6),
    append(A1, [C3], B3),
    append(A1, [not(C3)], B4).

% Question 2.5 Truncation 
truncation(C1 <- B1, C1 <- B2, C1 <- B3):-
    C1 = C1,
    intersection(B1, B2, B3).

sum([], 0).
sum([H|T], S):-
    sum(T, R),
    S is H + R.