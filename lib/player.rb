class Player
  attr_reader :dices

  def initialize
    @dices = []
  end

  def add_dice(dice)
    @dices << dice
  end

  def remove_dice(dice)
    @dices.delete(dice)
  end
end
