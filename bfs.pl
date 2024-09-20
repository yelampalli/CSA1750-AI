edge(a, b, 4).
edge(a, c, 3).
edge(b, d, 5).
edge(c, d, 1).
edge(c, e, 6).
edge(d, e, 2).


heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 3).
heuristic(d, 2).
heuristic(e, 0).


best_first_search(Start, Goal, Path) :-
    best_first_search([node(Start, 0, 0)], Goal, [], Path).


best_first_search([node(Goal, _, Cost) | _], Goal, AccPath, Path) :-
    reverse([node(Goal, _, Cost) | AccPath], Path).


best_first_search([node(Current, _, Cost) | Rest], Goal, AccPath, Path) :-
    findall(node(Next, HValue, NewCost),
            (edge(Current, Next, StepCost),
            heuristic(Next, HValue),
            NewCost is Cost + StepCost),
            Children),
    append(Rest, Children, Queue),
    sort_queue(Queue, SortedQueue),
    best_first_search(SortedQueue, Goal, [node(Current, _, Cost) | AccPath], Path).


sort_queue([], []).
sort_queue(Queue, [H | T]) :-
    lowest_cost(Queue, H),
    delete(Queue, H, NewQueue),
    sort_queue(NewQueue, T).


lowest_cost([node(X, HValue, Cost) | Rest], node(X, HValue, Cost)) :-
    \+ (member(node(_, H, _), Rest), H < HValue).
lowest_cost([_ | Rest], Node) :-
    lowest_cost(Rest, Node).