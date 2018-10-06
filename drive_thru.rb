
# Initial Solution
def drive_thru
  puts "Welcome to Ruby Burger. We have specials on Hamburgers, Fish Filet and Cookies for a dollar. Can I take your order?"
  order = ""
  while order != "THATS IT" # until order == "THATS IT"
    order = gets.chomp
    if order == "THATS IT"
      puts "Pull up to the first window."
    elsif order == order.upcase # if you shout
      # we have an array of prewritten questions
      questions = ["That comes with hash browns or fries. Which do you want?", "Do you want cheese on that?", "Do you want to supersize that?", "Hey, is this Paul?", "And then?", "What else?", "Do you think I could make it as a radio talk show host?"]
      # random question asked
      puts questions.sample
    else # order is not shouted
      # ask for louder voice
      puts "I'm sorry, you'll have to speak up Ma'am."
    end
  end
end

# Runner Code
drive_thru