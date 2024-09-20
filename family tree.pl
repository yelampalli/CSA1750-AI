male(john).
male(bob).
male(jim).
male(tom).

female(lisa).
female(anna).
female(susan).

parent(john, bob).
parent(john, jim).
parent(anna, bob).
parent(anna, jim).

parent(bob, tom).
parent(bob, lisa).
parent(susan, tom).
parent(susan, lisa).


father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).


get_parents_details(Name) :-
    (father(Father, Name) -> format('Father of ~w is ~w.~n', [Name, Father]); true),
    (mother(Mother, Name) -> format('Mother of ~w is ~w.~n', [Name, Mother]); true).


get_males(Males) :-
    findall(X, male(X), Males).


get_females(Females) :-
    findall(X, female(X), Females).