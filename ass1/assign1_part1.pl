/*Jackie Cai z5259449 Assignment 1 - Prolog & Search*/

% Question 1.1: List Processing 
% sum_even(Number, Sum) - sum the square of the even number, where Number is 
% a list of Number and Sum is the result. Number must be instantiated.s 

% When the list is empty the sum is zero
sumsq_even([], 0).

% When the head is even
sumsq_even([Head|Tail], Sum):-
    sumsq_even(Tail, Rest),
    0 is Head mod 2,
    Sum is Rest + (Head * Head).

% When the head is odd
sumsq_even([Head|Tail], Sum):-
    sumsq_even(Tail, Rest),
    1 is Head mod 2,
    Sum is Rest.

% Question 1.2: List Processing
% eliza1(List, X) - prepends  the list [what, makes, you, say] to X and 
% transforms you → i, me → you and my → your.List variable must be instantiated. 

% When the list is empty 
eliza1([], []).

% The top level predicate of eliza1 that takes a list and replace and appends
% makes sure that the list is not empty or else appends to a empty list. 
eliza1(List, X):-
    list_empty(List, false),
    replace(you, i, List, X1),
    replace(me, you, X1,X2),
    replace(my, your, X2,X3),
    append([what, makes, you, say], X3, X).

% replace(Old, New, [Head|Tail], [Head|Tail2])- replace the Old word with New word
% in a list when they find the word, original list is the third variable and the 
% new list is the fouth variable. Old, New and Third variable must be instantiated. 

% base case when the list is empty
replace(_, _, [], []).

% if the head of the list does not match with the element to be replaced skip
replace(Old, New, [Head|Tail], [Head|Tail2]):-
    Head \= Old,
    replace(Old, New, Tail, Tail2).

% replace Old with New in the list if they find the word 
replace(Old, New, [Old|Tail], [New| Tail2]):-
    replace(Old, New, Tail, Tail2).

% list empty checks first variable list if the list is empty return true when empty, false otherwise
list_empty([_],true).
list_empty([_|_], false).

% Question 1.3: List Processing
% eliza2(List, Y) - takes a List and finds you and me and appends "what makes you
% think" while keeping the words between you and me then replace you -> i and me -> you
% List must be instantiated and returns Y.

% When the list is empty return empty list
eliza2([], []).

% The top level predicate of eliza2 never empty as it checks for empty returns 
% empty list. 
eliza2(List, Y):-
    list_empty(List, false),
    split(you, List, _, Result1),
    split(me, Result1, Result, _),
    append([what, makes, you, think, i], Result, Y1),
    append(Y1, [you], Y).

% split(Word, List, Before, After)- is given a word and then afterwards split the 
% List into two when it finds the word not including the word.
% Before is the list before the word and After is the list after the word.
split(Word, List, Before, After) :-
    append(Before, [Word|After], List).

% Question 1.4: List Processing
% eval(Expr, Val) - given Expr as an expression with add, mul, div and sub which
% are arithmetic expression to be evaluated and instantiated. Then return the answer as Val

% base case where there are two numbers check both are numbers and assign to Number
eval(Expr, Val):-
    number(Expr),
    Val is Expr.

% For adding, recurse through the function and then check for number then add
eval(add(X, Y), Val):-
    eval(X, Result1),
    eval(Y, Result2),
    number(Result1),
    number(Result2),
    Val is Result1 + Result2.

% For dividing, recurse through the function and then check for number then divide
eval(div(X, Y), Val):-
    eval(X, Result1),
    eval(Y, Result2),
    number(Result1),
    number(Result2),
    Result2 \= 0,
    Val is Result1/Result2.

% For multiplying, recurse through the function and then check for number then multiply
eval(mul(X, Y), Val):-
    eval(X, Result1),
    eval(Y, Result2),
    number(Result1),
    number(Result2),
    Val is Result1*Result2.

% For subtracting, recurse through the function and then check for number then subtract
eval(sub(X, Y), Val):-
    eval(X, Result1),
    eval(Y, Result2),
    number(Result1),
    number(Result2),
    Val is Result1 - Result2.