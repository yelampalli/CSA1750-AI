% Facts and Rules
parent(john, mary).
parent(john, tom).
parent(mary, ann).
parent(mary, pat).
parent(pat, jim).

ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Queries
% Query 1: Is John an ancestor of Jim?
query1 :- ancestor(john, jim).

% Query 2: Who are the ancestors of Ann?
query2 :- ancestor(X, ann), write(X), nl, fail.

% Query 3: Are there any descendants of Mary?
query3 :- ancestor(mary, X), write(X), nl, fail.

% Query 4: Is Pat a descendant of John?
query4 :- ancestor(john, pat).

% Query 5: Who are the descendants of John?
query5 :- ancestor(john, X), write(X), nl, fail.

% Query 6: Are there any ancestors of Tom?
query6 :- ancestor(X, tom), write(X), nl, fail.

% Query 7: Is Ann a parent of Pat?
query7 :- parent(ann, pat).