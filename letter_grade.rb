# Commit 1 - Pseudocode

# input: 90, 100, 95
# output: "A"

# Steps
# 1 - define a method that can accept an arbitrary number of arguments
# 2 - find the average of those arguments (sum them and then divide by the number of them)
# 3 - attribute the average to a letter grade using conditionals

# Commit 2 - Initial Solution

# def calculate_letter_grade(*scores)  # the asterisk allows any number of arguments and puts them in an array
#   if scores.length == 0
#     return nil
#   end
#   average = scores.sum / scores.length
#   if average >= 90
#     return "A"
#   elsif average >= 80
#     return "B"
#   elsif average >= 70
#     return "C"
#   elsif average >= 60
#     return "D"
#   else # if average < 60
#     return "F"
#   end
# end

# Commit 4 - Refactor Solution
def calculate_letter_grade(*scores)  # the asterisk allows any number of arguments and puts them in an array
  if scores.length == 0
    return nil
  end
  average = scores.sum / scores.length
  letter_threshholds = {90 => "A", 80 => "B", 70 => "C", 60 => "D", 0 => "F"}
  letter_threshholds.each do |threshhold, grade|
    if average >= threshhold
      return grade
    end
  end
end


# Commit 3 - Write Runner Code / Tests
p calculate_letter_grade(90, 100, 95) #=> "A"
p calculate_letter_grade(0, 50, 100) #=> "F"
p calculate_letter_grade(75, 75, 76) #=> "C"
p calculate_letter_grade(100, 100, 50) #=> "B"
p calculate_letter_grade(77) #=> "C"
p calculate_letter_grade() #=> nil