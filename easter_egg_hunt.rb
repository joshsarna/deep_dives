# Commit 1 - Psuedocode
# input: [["G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "E",  "G",  "E"],
# ["G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G"],
# ["G",  "G",  "G",  "G",  "G",  "E",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G"],
# ["G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G"],
# ["G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G"],
# ["G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "E",  "G"],
# ["G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G"],
# ["G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G"],
# ["G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G"],
# ["G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E"],
# ["G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G"]]

# stored as: [{col: 0, row: 8}, ...]

# output: *************** Yard Report ***************

  # Yard: Clean
  # Divots: Replaced

#   Total Eggs Found: 13

#   Eggs found at the following coordinates
#   ---------------------------------------
#              col: 0  - row: 8
#              col: 0  - row: 11
#              col: 0  - row: 13
#              col: 1  - row: 2
#              col: 1  - row: 9
#              col: 2  - row: 5
#              col: 2  - row: 7
#              col: 3  - row: 3
#              col: 4  - row: 1
#              col: 5  - row: 7
#              col: 5  - row: 12
#              col: 6  - row: 12
#              col: 7  - row: 4
#              col: 8  - row: 2
#              col: 8  - row: 9
#              col: 9  - row: 4
#              col: 9  - row: 13
#              col: 10 - row: 11

#   Sir or Madam, 
#   Your Yard is safe for Horseshoe,
#   BBQ's, Beanbag-toss and the like. 
#   See you next year, Rabbit.

# *******************************************


# Steps

# make basket array
# two .each_with_index (i, j) loops, one for rows, one for columns
# if string == "E", basket << i,j
# spot = "G"
# p updated yard

# at end, puts report

# Commit 3 - Initial Solution

def clean_yard(yard)
  basket = []
  egg_count = 0
  yard.each_with_index do |row, row_number|
    row.each_with_index do |spot, column_number|
      if spot == "E"
        egg_count += 1
        basket << {row: row_number, col: column_number}
        yard[row_number][column_number] = "G"
        p "UPDATED YARD:"
        yard.each do |row|
          p row
        end
      end
    end
  end
  report = [
    "*************** Yard Report ***************",
    "",
    "  Yard: Clean",
    "  Divots: Replaced",
    "  Total Eggs Found: #{egg_count}",
    "  Eggs found at the following coordinates",
    "  ---------------------------------------"
  ]
  basket.each do |egg|
    report << "             col: #{egg[:col]} - row: #{egg[:row]}"
  end
  report += [
    "  Sir or Madam,",
    "  Your Yard is safe for Horseshoe,",
    "  BBQ's, Beanbag-toss and the like.",
    "  See you next year, Rabbit."
  ]
  return report
end

# Commit 4 - Refactor Solution



# Commit 2 - Write Runner Code / Tests

yard = [["G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "E",  "G",  "E"],
["G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G"],
["G",  "G",  "G",  "G",  "G",  "E",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G"],
["G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G"],
["G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G"],
["G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "E",  "G"],
["G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G"],
["G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G"],
["G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G"],
["G",  "G",  "G",  "G",  "E",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E"],
["G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "G",  "E",  "G",  "G"]]

puts clean_yard(yard)