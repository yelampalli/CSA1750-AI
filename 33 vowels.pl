% vowel/1 defines what characters are vowels
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% count_vowels/2 recursively counts the vowels in the list
count_vowels([], 0).  
count_vowels([H|T], Count) :- 
    vowel(H),            
    count_vowels(T, TailCount), 
    Count is TailCount + 1.     
count_vowels([H|T], Count) :- 
    \+ vowel(H),        
    count_vowels(T, Count).     

% To use the program, convert the string into a list of characters:
 count_vowels_in_text(Text, Count) :-
    string_chars(Text, CharList),
    count_vowels(CharList, Count).