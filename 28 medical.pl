% Define diseases and their symptoms
symptom(flu, fever).
symptom(flu, cough).
symptom(flu, sore_throat).
symptom(covid19, fever).
symptom(covid19, cough).
symptom(covid19, shortness_of_breath).
symptom(cold, runny_nose).
symptom(cold, sore_throat).
symptom(allergy, runny_nose).
symptom(allergy, sneezing).

% Define rules for diagnosis
diagnose(Disease, Symptoms) :-
    findall(Disease, (member(Symptom, Symptoms), symptom(Disease, Symptom)), Diseases),
    list_to_set(Diseases, UniqueDiseases),
    member(Disease, UniqueDiseases),
    write('You may have '), write(Disease), nl,
    fail.

diagnose(_, _) :-
    write('Sorry, I cannot diagnose your condition.'), nl.

% Example usage:
% diagnose(Disease, [fever, cough, sore_throat]).