# Commit 1 - Pseudocode

# input: 90, 100, 95
# output: "A"

# Steps
# 1 - define a method that can accept an arbitrary number of arguments
# 2 - find the average of those arguments (sum them and then divide by the number of them)
# 3 - attribute the average to a letter grade using conditionals

# Commit 2 - Initial Solution

def calculate_letter_grade(*scores)  # the asterisk allows any number of arguments and puts them in an array
  average = scores.sum / scores.length
  if average >= 90
    return "A"
  elsif average >= 80
    return "B"
  elsif average >= 70
    return "C"
  elsif average >= 60
    return "D"
  else # if average < 60
    return "F"
  end
end

# Commit 4 - Refactor Solution



# Commit 3 - Write Runner Code / Tests
p calculate_letter_grade(90, 100, 95) #=> "A"