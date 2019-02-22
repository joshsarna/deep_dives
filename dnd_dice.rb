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
    if sides < 1
      raise ArgumentError.new("A die must have at least one side")
    elsif sides % 1 != 0
      raise ArgumentError.new("A die must have an integer number of sides")
      
    end
    @sides = sides
  end

  def roll
    rand(1..sides)
  end
end

class DieCup
  def initialize(dice)
    @dice = dice
  end

  def roll_all
    rolls = []
    @dice.each do |die|
      rolls << die.roll
    end
    rolls
  end
end

# Commit 3 - Write Runner Code / Tests

normal_die = Die.new(6)
p "normal_die.sides:"
p normal_die.sides
p "normal_die.roll:"
p normal_die.roll

p "Any failed tests will print below here"
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
p "Any failed tests will print above here"

p "DieCup runner code:"
die1 = Die.new(4)
die2 = Die.new(6)
die3 = Die.new(8)
die4 = Die.new(12)
dice = [die1, die2, die3, die4]
cup = DieCup.new(dice)
p cup.roll_all

p "Argument error runner code:"
# Die.new(0)
# Die.new(1.5)