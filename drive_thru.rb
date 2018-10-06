
# Refactored Solution
def collect_order
  @order = gets.chomp
end

def process_order
  if @order == "THATS IT"
    @thats_it_counter += 1
  end
  if @thats_it_counter == 3
    puts "Pull up to the first window."
  elsif @order == @order.upcase # if you shout
    questions = ["That comes with hash browns or fries. Which do you want?", "Do you want cheese on that?", "Do you want to supersize that?", "Hey, is this Paul?", "And then?", "What else?", "Do you think I could make it as a radio talk show host?"]
    puts questions.sample
  else # order is not shouted
    puts "I'm sorry, you'll have to speak up Ma'am."
  end
end

def drive_thru
  puts "Welcome to Ruby Burger. We have specials on Hamburgers, Fish Filet and Cookies for a dollar. Can I take your order?"
  # order and thats_it_counter must now be instance variables since they're being used in more than one method
  @order = ""
  @thats_it_counter = 0
  while @thats_it_counter < 3
    collect_order
    process_order
  end
end

# Runner Code
drive_thru