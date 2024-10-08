diet_for(diabetes, low_carb_diet).
diet_for(hypertension, low_sodium_diet).
diet_for(obesity, low_calorie_diet).
diet_for(heart_disease, low_saturated_fat_diet).
diet_for(allergies, gluten_free_diet).
diet_for(general_health, balanced_diet).

suggest_diet(Disease, Diet) :-
    diet_for(Disease, Diet).