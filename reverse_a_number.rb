# Commit 1 - Pseudocode

# We can start from the one's place and move up, determining whether there's another digit by dividing by 10, 100, etc. and checking whether the result is nonzero

# Each digit can be added to 10*our new number

# Steps
# 1 - define an output number
# 2 - create a while loop that continues as long as there are additional digits of the input number
# 3 - add each digit to the end of the output number

# Commit 2 - Initial Solution

def reverse_a_number(number)
  # write code here  
end

# Commit 3 - No Strings Solution



# Commit 4 - Refactor Solution



# Runner Code / Tests

puts reverse_a_number(67352193) == 39125376
puts reverse_a_number(97531) == 13579
puts reverse_a_number(24) == 42
puts reverse_a_number(1574362190881) == 1880912634751