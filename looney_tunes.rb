#Commit 1 - Pseudocode

# daffy duck
# input: "This is ridiculous" (string)
# output: "Thith ith ridiculouth" (string)

# define a method that accepts a string as a parameter
# create a new string
# use gsub to replace 's' with 'th'
# return the new string

# porky pig
# input: "this is a nice place" (string), dictionary (array)
# output: "eh th TH eh this is a nice eh pl PL eh place." (string)

# define a method that accepts a string and an array as parameters
# check the string for words in the array
# replace words in the string that are also in the array with porkified versions of themselves
# to porkify: "eh #{string[0..1]} #{string[0..1].upcase} eh #{string}"
# in the case that string[i] is a vowel, use string[0] + eh 

#Commit 2 - Initial Solution

def daffify(message)
  methage = message.gsub('s', 'th')
  methage = methage.gsub('S', 'Th')
  methage = methage.gsub('thth', 'th')
end

# def porkify(message, dictionary)
#   vowels = ["a", "e", "i", "o", "u", "y"]
#   words = message.split(" ")
#   words.each do |word|
#     if dictionary.include?(word)
#       if vowels.include?(word[1])
#         word.gsub!(word.gsub!(/[^a-z]/, ''), "eh #{word[0]}eh #{word[0].upcase}eh eh #{word}")
#       else
#         word.gsub!(word.gsub(/[^a-z]/, ''), "eh #{word[0..1]} #{word[0..1].upcase} eh #{word}")
#       end
#     end
#   end
#   porked_message = words.join(' ')
#   p porked_message
# end

# Commit 4 - Refactor Solution
def stutter(word)
  vowels = ["a", "e", "i", "o", "u", "y"]
  stuttered_word_without_punctuation = "eh #{word[0..1]} #{word[0..1].upcase} eh #{word}"
  if vowels.include?(word[1])
    stuttered_word_without_punctuation[4] = "eh"
    stuttered_word_without_punctuation[8] = "EH"
  end
  stuttered_word = word.gsub(word, stuttered_word_without_punctuation)
  return stuttered_word
end

def porkify(message, dictionary)
  words = message.split(' ')
  words.each_with_index do |word, i|
    word_without_punctuation = word.gsub(/\W/, '')
    if dictionary.include?(word_without_punctuation)
      words[i] = stutter(word)
    end
  end
  porked_message = words.join(' ')
end

#Commit 3 - Write Runner Code / Tests

# daffy duck runner code
# p daffify("Yes") == "Yeth"
# p daffify("No") == "No"
# p daffify("This is ridiculous") == "Thith ith ridiculouth"
# p daffify("That's why I always work solo") == "That'th why I alwayth work tholo"

# p daffify("Such a sourpuss") == "Thuch a thourputh" # bonus, needs more logic

# porky pig runner code
dictionary = ["this", "place", "tomorrow", "rust"]
p porkify("this is a nice place", dictionary) == "eh th TH eh this is a nice eh pl PL eh place"
p porkify("this is a nice rust.", dictionary) == "eh th TH eh this is a nice eh reh REH eh rust."
