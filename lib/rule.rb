module Rule
  def discard_dices
    self.dices.each do |dice|
      # self.dices.delete(dice) if dice.last_roll.include? "6"
      if dice.last_roll.include? "6"
        self.dices.delete(dice)
        discard_dices
      end
    end
  end

  def move_dices(opponent)
    self.dices.each do |dice|
      if dice.last_roll.include? "1"
        opponent.stolen_dices << dice
        self.dices.delete(dice)
        move_dices(opponent)
      end
    end
  end

  def get_stolen_dices
    self.stolen_dices.each do |stolendice|
      self.add_dice(stolendice)
    end
    self.stolen_dices.clear
  end

  def last_rolls
    digits = []
    self.dices.each do |dice|
      digits << dice.last_roll
    end
    digits.join(', ')
  end
end
