#Commit 1 - Pseudocode

# daffy duck
# input: "This is ridiculous" (string)
# output: "Thith ith ridiculouth" (string)

# define a method that accepts a string as a parameter
# create a new string
# use gsub to replace 's' with 'th'
# return the new string

#Commit 2 - Initial Solution

def daffify(message)
  # write code here  
end

def porkify(message, dictionary)
  # write code here  
end

# Commit 4 - Refactor Solution


#Commit 3 - Write Runner Code / Tests

# daffy duck runner code
p daffify("Yes") == "Yeth"
p daffify("No") == "No"
p daffify("This is ridiculous") == "Thith ith ridiculouth"
p daffify("That's why I always work solo") == "That'th why I alwayth work tholo"

p daffify("Such a sourpuss") == "Thuch a thourputh" # bonus, needs more logic