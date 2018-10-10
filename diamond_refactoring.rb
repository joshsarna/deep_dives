# Diamond Refactoring

# Initial Solution

def diamond_printer(word)
  message = word.split("")
  array = []

  characters_list = {
                     "A" => 1, 
                     "B" => 2, 
                     "C" => 3, 
                     "D" => 4, 
                     "E" => 5, 
                     "F" => 6, 
                     "G" => 7, 
                     "H" => 8, 
                     "I" => 9, 
                     "J" => 10, 
                     "K" => 11, 
                     "L" => 12, 
                     "M" => 13, 
                     "N" => 14, 
                     "O" => 15, 
                     "P" => 16, 
                     "Q" => 17, 
                     "R" => 18, 
                     "S" => 19, 
                     "T" => 20, 
                     "U" => 21, 
                     "V" => 22, 
                     "W" => 23, 
                     "X" => 24, 
                     "Y" => 25, 
                     "Z" => 26
                     }

  # we'll end up getting rid of this second array; it has all the same information as the origin character_list
  characters_list_reversed = {
                               "Z" => 26,
                               "Y" => 25, 
                               "X" => 24, 
                               "W" => 23, 
                               "V" => 22, 
                               "U" => 21, 
                               "T" => 20, 
                               "S" => 19, 
                               "R" => 18, 
                               "Q" => 17, 
                               "P" => 16, 
                               "O" => 15, 
                               "N" => 14, 
                               "M" => 13, 
                               "L" => 12, 
                               "K" => 11, 
                               "J" => 10, 
                               "I" => 9, 
                               "H" => 8, 
                               "G" => 7, 
                               "F" => 6, 
                               "E" => 5, 
                               "D" => 4, 
                               "C" => 3, 
                               "B" => 2, 
                               "A" => 1
                               }

  message.each do |l|
    upcased_l = l.upcase  # upcase so that capitals and lowercase are treated the same
    if upcased_l == " " || upcased_l == "?" || upcased_l == "." || upcased_l == "!" || upcased_l == "-"  # check for the case of it not being a letter
      array << [upcased_l]
    else
      word_array = [] # This represents a single diamond, corresponding to one letter; letter_array might be a better name, or diamond_array
      characters_list.each_key do |c| # What is c?
        upcased_c = c.upcase

        if characters_list[upcased_c] == 1
          if characters_list[upcased_l].even? # It doesn't matter here whether it's even or odd - these can be combined into one, with the conditional eliminated
            line = " " * (characters_list[upcased_l] * 2 - 1)
            middle = line.length / 2 
            line[middle] = "A"
            word_array << line
          end

          if characters_list[upcased_l].odd?
            line = " " * (characters_list[upcased_l] * 2 - 1)
            middle = line.length / 2
            line[middle] = "A"
            word_array << line
          end

          if characters_list[upcased_l] == 1
            break # This is not necessary
          end
        elsif characters_list[upcased_c] == characters_list[upcased_l]
          if characters_list[upcased_l].even?
            word_array << upcased_c + " " * (characters_list[upcased_c] * 2 - 3) + upcased_c
          end

          if characters_list[upcased_l].odd?
            word_array << upcased_c + " " * (characters_list[upcased_c] * 2 - 3) + upcased_c
          end 

          break # avoid using break whenever possible
        else
          if characters_list[upcased_l].even?
            line = " " * (characters_list[upcased_l] * 2 - 1) # This creates one row of the diamond with the correct number of spaces; the letter will then be inserted in the correct place below
            middle = line.length / 2
            placement_1 = middle - (characters_list[upcased_c] - 1) # This calculates where the letter should be inserted in the row of spaces; NB: your linter highlights this variable name because ruby convention is to not use underscores before numbers
            placement_2 = middle + (characters_list[upcased_c] - 1)
            line[placement_1] = upcased_c
            line[placement_2] = upcased_c
            word_array << line
          end

          if characters_list[upcased_l].odd?
            line = " " * (characters_list[upcased_l] * 2 - 1)
            middle = line.length / 2
            placement_1 = middle - (characters_list[upcased_c] - 1)
            placement_2 = middle + (characters_list[upcased_c] - 1)
            line[placement_1] = upcased_c
            line[placement_2] = upcased_c
            word_array << line
          end
        end
      end

      if upcased_l != "A" # This entire section just redoes work that's already been done; instead of doing this, we can just copy the rows that are already in the array, starting with word_array[-2] and moving back to word_array[1]
        characters_list_reversed.each_key do |c|
          upcased_c = c.upcase

          if characters_list[upcased_c] == 1
            if characters_list[upcased_l].even?
              line = " " * (characters_list[upcased_l] * 2 - 1)
              middle = line.length / 2 
              line[middle] = "A"
              word_array << line
            end

            if characters_list[upcased_l].odd?
              line = " " * (characters_list[upcased_l] * 2 - 1)
              middle = line.length / 2
              line[middle] = "A"
              word_array << line
            end     
          elsif characters_list[upcased_c] < characters_list[upcased_l]
            if characters_list[upcased_l].even?
              line = " " * (characters_list[upcased_l] * 2 - 1)
              middle = line.length / 2
              placement_1 = middle - (characters_list[upcased_c] - 1)
              placement_2 = middle + (characters_list[upcased_c] - 1)
              line[placement_1] = upcased_c
              line[placement_2] = upcased_c
              word_array << line
            end

            if characters_list[upcased_l].odd?
              line = " " * (characters_list[upcased_l] * 2 - 1)
              middle = line.length / 2
              placement_1 = middle - (characters_list[upcased_c] - 1)
              placement_2 = middle + (characters_list[upcased_c] - 1)
              line[placement_1] = upcased_c
              line[placement_2] = upcased_c
              word_array << line
            end
          end
        end
      end
      array << word_array
    end
  end
  array.flatten!.join("\n") + "\n"
end

#Commit 3 - Refactor Solution



#Commit 2 - Write Runner Code / Tests

puts diamond_printer("ace")
puts "========================="
puts diamond_printer("ghost")
puts "========================="
puts diamond_printer("De Beers")

