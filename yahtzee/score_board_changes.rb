class ScoreBoard
  def score_additional_yahtzees(dice)
    if dice.uniq.length == 1 && yahtzee == 50
      @additional_yahtzees += 1
      return additional_yahtzees
    else
      return false
    end
  end

  def score_aces(dice)
    if !aces
      score_additional_yahtzees(dice)
      @aces = dice.count(1) * 1
    else
      return false
    end
  end

  def score_twos(dice)
    if !twos
      score_additional_yahtzees(dice)
      @twos = dice.count(2) * 2
    else
      return false
    end
  end

  def score_threes(dice)
    if !threes
      score_additional_yahtzees(dice)
      @threes = dice.count(3) * 3
    else
      return false
    end
  end

  def score_fours(dice)
    if !fours
      score_additional_yahtzees(dice)
      @fours = dice.count(4) * 4
    else
      return false
    end
  end

  def score_fives(dice)
    if !fives
      score_additional_yahtzees(dice)
      @fives = dice.count(5) * 5
    else
      return false
    end
  end

  def score_sixes(dice)
    if !sixes
      score_additional_yahtzees(dice)
      @sixes = dice.count(6) * 6
    else
      return false
    end
  end

  def score_three_of_a_kind(dice)
    if !three_of_a_kind
      score_additional_yahtzees(dice)
      if (dice.count(dice.uniq.max) >= 3 || dice.count(dice.uniq.min) >= 3) || (dice.uniq.length == 3 && dice.count(dice.uniq.max) == 1 || dice.count(dice.uniq.min) == 1)
        @three_of_a_kind = dice.sum
      else
        @three_of_a_kind = 0
      end
    else
      return false
    end
  end

  def score_four_of_a_kind(dice)
    if !four_of_a_kind
      score_additional_yahtzees(dice)
      if dice.count(dice.uniq.max) >= 4 || dice.count(dice.uniq.min) >= 4
        @four_of_a_kind = dice.sum
      else
        @four_of_a_kind = 0
      end
    else
      return false
    end
  end
  
  def score_full_house(dice)
    if !full_house
      score_additional_yahtzees(dice)
      if (
        (
          dice.uniq.length == 2 &&
          (dice.count(dice.uniq.min) == 2 ||
          dice.count(dice.uniq.min) == 3)
        ) ||
        dice.uniq.length == 1
      )
        @full_house = 25
      else
        @full_house = 0
      end
    else
      return false
    end
  end

  def score_small_straight(dice)
    if !sm_straight
      score_additional_yahtzees(dice)
      uniq_dice = dice.uniq.sort
      if (uniq_dice.length == 4 && uniq_dice.max - uniq_dice.min == 3) || (uniq_dice.length == 5 && (uniq_dice[3] - uniq_dice[0] == 3 || uniq_dice[4] - uniq_dice[1] == 3 ))
        @sm_straight = 30
      else
        @sm_straight = 0
      end
    else
      return false
    end
  end

  def score_large_straight(dice)
    if !lg_straight
      score_additional_yahtzees(dice)
      if dice.uniq.length == 5 && dice.max - dice.min == 4
        @lg_straight = 40
      else
        @lg_straight = 0
      end
    else
      return false
    end
  end

  def score_yahtzee(dice)
    if !yahtzee
      if dice.uniq.length == 1
        @yahtzee = 50
      else
        @yahtzee = 0
      end
    else
      return false
    end
  end

  def score_chance(dice)
    if !chance
      score_additional_yahtzees(dice)
      @chance = dice.sum
    else
      return false
    end
  end
end