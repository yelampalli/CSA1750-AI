% Define rules
parent(john, mary).
parent(mary, ann).
parent(ann, peter).

ancestor(X, Y) :- Parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Define backward chaining query
:- dynamic(target/1).
target(ancestor(john, peter)).

query :- target(Goal), ancestor(X, Y) = Goal, format('~w is an ancestor of ~w.~n', [X, Y]).