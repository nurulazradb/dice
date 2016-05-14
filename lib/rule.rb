module Rule
  def discard_dices
    self.dices.each do |dice|
      self.dices.delete(dice) if dice.last_roll.include? "6"
    end
  end

  def move_dices(opponent)
    self.dices.each do |dice|
      if dice.last_roll.include? "1"
        opponent.stolen_dices << dice
        self.dices.delete(dice)
      end
    end
  end

  def last_rolls
    digits = []
    self.dices.each do |dice|
      digits << dice.last_roll
    end
    digits.join(', ')
  end
end
