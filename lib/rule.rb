module Rule
  def discard_dice(dice)
    self.remove_dice(dice) if dice.last_roll == "6"
  end

  def move_dice(opponent, dice)
    opponent.add_dice(self.remove_dice(dice)) if dice.last_roll == "1"
  end
end
