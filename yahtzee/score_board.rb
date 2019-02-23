class ScoreBoard
  attr_reader :aces, :twos, :threes, :fours, :fives, :sixes, :three_of_a_kind, :four_of_a_kind, :full_house, :sm_straight, :lg_straight, :yahtzee, :chance
  attr_accessor :bonus, :additional_yahtzees

  def initialize
    @aces = nil
    @twos = nil
    @threes = nil
    @fours = nil
    @fives = nil
    @sixes = nil
    @bonus = nil
    @three_of_a_kind = nil
    @four_of_a_kind = nil
    @full_house = nil
    @sm_straight = nil
    @lg_straight = nil
    @yahtzee = nil
    @chance = nil
    @additional_yahtzees = 0
  end

  def upper_total
    upper_total = (aces || 0) + (twos || 0) + (threes || 0) + (fours || 0) + (fives || 0) + (sixes || 0)
    if upper_total >= 63
      bonus = 35
    else
      bonus = 0
    end
    upper_total += bonus
  end

  def lower_total
    lower_total = (three_of_a_kind || 0) + (four_of_a_kind || 0) + (full_house || 0) + (sm_straight || 0) + (lg_straight || 0) + (yahtzee || 0) + (chance || 0) + (100 * additional_yahtzees)
  end

  def total
    total = upper_total + lower_total
  end

  def show_board
    puts "--------------- UPPER BOARD ---------------"
    puts " | aces: #{aces}"
    puts " | twos: #{twos}"
    puts " | threes: #{threes}"
    puts " | fours: #{fours}"
    puts " | fives: #{fives}"
    puts " | sixes: #{sixes}"
    puts " | bonus: #{bonus}"
    puts "-------------------------------------------"
    puts " | upper total: #{upper_total}"
    puts "--------------- LOWER BOARD ---------------"
    puts " | three of a kind: #{three_of_a_kind}"
    puts " | four of a kind: #{four_of_a_kind}"
    puts " | full house: #{full_house}"
    puts " | small straight: #{sm_straight}"
    puts " | large straight: #{lg_straight}"
    puts " | yahtzee: #{yahtzee}"
    puts " | chance: #{chance}"
    puts " | additional yahtzees: #{'x' * additional_yahtzees}"
    puts "-------------------------------------------"
    puts " | lower total: #{lower_total}"
    puts "-------------------------------------------"
    puts " | total: #{total}"
    puts "-------------------------------------------"
    puts ""
  end
end