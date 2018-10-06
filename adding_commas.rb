# Commit 1 - Pseudocode
=begin

Note: =begin and =end are a way of commenting out an entire block of code. It is not very common, but it can be useful.

input: 5
output: "5"

input: 1000000
output: "1,000,000"

input: "hello"
output: "hello"

Steps
1 - define a method
2 - check whether input is an integer
3 - return the input if it's not a string and convert it to a string otherwise
4 - insert commas every three indices from the right end, until there is only one digit left on the left

=end

# Commit 2 - Initial Solution

def add_commas(number)
  if number.class != Integer
    return number
  else
    number = number.to_s
  end
  comma_count = (number.length - 1) / 3
  # this assumes the input number is positive; how would you make the method also accept negative numbers?
  index = -4
  comma_count.times do
    number.insert(index, ",")
    p number  # print the number after each comma insertion
    index -= 4
    # why do we have to incriment by 4 instead of 3?
  end
  p "*" * 50
  number
end

p add_commas(1000000)  # => "1,000,000"

# Playing with data types

# You can change this method so that it can accept numbers passed as strings; for example add_commas("1000") #=> "1,000"
# To do this, you can convert the inputted number into an integer right away; things that can't be converted into integers (like arrays) will throw errors, but non-numeric strings will become 0 when converted to integers
# What happens when you convert a string with commas and numeric digits in it to an integer?