% Pattern match succeeds if both lists are empty
pattern_match([], []).

% If the head elements of both lists unify, proceed with the tail
pattern_match([H1|T1], [H2|T2]) :-
    H1 = H2,              
    pattern_match(T1, T2).

% Example usage of pattern matching with lists
% ?- pattern_match([X, 2, Y], [1, 2, 3]).
% X = 1, Y = 3.