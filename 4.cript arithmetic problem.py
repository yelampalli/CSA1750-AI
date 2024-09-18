print("cryptarthimetic")
def is_solution_valid(mapping, words, result):
    # Convert words and result to integers based on the mapping
    word_values = [int(''.join(str(mapping[c]) for c in word)) for word in words]
    result_value = int(''.join(str(mapping[c]) for c in result))

    return sum(word_values) == result_value

def solve_cryptarithmetic(words, result):
    all_letters = set(''.join(words + [result]))
    if len(all_letters) > 10:
        return None  # More than 10 unique letters; not solvable with single digits

    unique_letters = sorted(all_letters)
    permutations = range(10)  # All possible digit values

    from itertools import permutations as permute
    for perm in permute(permutations, len(unique_letters)):
        mapping = {letter: digit for letter, digit in zip(unique_letters, perm)}
        if mapping[result[0]] == 0:  # Leading zeros not allowed
            continue
        if is_solution_valid(mapping, words, result):
            return mapping

    return None  # No valid mapping found

# Example usage
print("SEND + MORE = MONEY")
words = ['send', 'more']
result = 'money'

solution = solve_cryptarithmetic(words, result)

if solution:
    print("Solution found:")
    for letter, digit in solution.items():
        print(f"{letter} = {digit}")
else:
    print("No solution found for the given cryptarithmetic problem.")
