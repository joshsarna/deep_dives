# Commit  Psuedocode

# input: 
# output: 

# Steps
# 1 - 
# 2 -
# 3 - 

# Commit 2 - Initial Solution

def permutation_checker(base_word, possible_permutation)
  is_permutation = true
  base_word_letters = base_word.split('')
  possible_permutation_letters = possible_permutation.split('')
  possible_permutation_letters.each do |letter|
    if !base_word.include?(letter)
      is_permutation = false
    end
  end
  return is_permutation
end

# Commit 4 - Refactored Solution



# Bonus Code (optional)



# Commit 3 & 5 Runner Code / Tests
