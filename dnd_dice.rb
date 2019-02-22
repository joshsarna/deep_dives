# Commit 1 - Psuedocode

# make a Die class
# make initialize method
  # accept number of sides as a parameter
# make sides getter
  # return integer
# make roll getter
  # grab sides attribute
  # generate a random number between 1 and the number of sides
  # return integer


# Commit 2 and 4 - Initial Solution

class Die
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def roll
    rand(1..sides)
  end
end

# Commit 3 - Write Runner Code / Tests

normal_die = Die.new(6)
p "normal_die.sides:"
p normal_die.sides
p "normal_die.roll:"
p normal_die.roll

p "Any failed tests will print here:"
(1..20).each do |i|
  die = Die.new(i)
  sides = die.sides
  roll = die.roll

  if sides != i
    p "test of sides getter fails for i = #{i}"
  end

  if roll < 1 || roll > sides
    p "test of roll method fails for i = #{i}"
  end

  i += 1
end