class Game
  attr_reader :score_board

  @@scoring_actions = ["aces", "twos", "threes", "fours", "fives", "sixes", "three of a kind", "four of a kind", "full house", "small straight", "large straight", "yahtzee", "chance"]
  @@high_score = 0

  def initialize
    @score_board = ScoreBoard.new
    die1 = Die.new(6)
    die2 = Die.new(6)
    die3 = Die.new(6)
    die4 = Die.new(6)
    die5 = Die.new(6)
    die5 = Die.new(6)
    @die_cup = DieCup.new([die1, die2, die3, die4, die5])
  end

  def play_again
    p "Play again? (yes/no)"
    if gets.chomp == "yes"
      3.times do
        puts ""
      end
      game = Game.new()
      game.play
    end
  end

  def turn
    puts ""
    @score_board.show_board
    turn_ended = false
    "Roll:"
    dice = @die_cup.roll_all
    rolls = 1
    while !turn_ended
      dice.each_with_index do |die, i|
        p "Die ##{i + 1}: #{die}"
      end
      if rolls < 3
        p "Type the numbers of the dice you would like to reroll, separated by spaces and hit enter; if you don't want to reroll any, just hit enter."
        rerolls = gets.chomp.split(' ').map { | number | number.to_i }.select { | number | [*1..5].include?(number) }
        if rerolls.length == 0
          turn_ended = true
        else
          rerolls.each do |reroll|
            dice[reroll - 1] = @die_cup.dice[reroll - 1].roll
          end
          rolls += 1
        end
      else
        turn_ended = true
      end
    end
    p "Which box do you want to fill in on your board?"
    input = ""
    while !@@scoring_actions.include?(input)
      input = gets.chomp
    end

    scored = false
    while !scored
      if eval("@score_board.score_#{input.gsub(" ", "_")}(dice)")
        scored = true
      else
        p "That box is already full"
        input = ""
        while !@@scoring_actions.include?(input)
          input = gets.chomp
        end
      end
    end
  end

  def play
    i = 1
    13.times do
      puts "TURN ##{i}"
      turn
      i += 1
    end
    score = @score_board.total
    @score_board.show_board

    2.times do
      puts "-" * 50
    end
    puts "FINAL SCORE: #{score}"
    if score > @@high_score
      @@high_score = score
    end
    puts "HIGH SCORE: #{@@high_score}"
    play_again
  end
end