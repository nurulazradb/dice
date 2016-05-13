$LOAD_PATH << '.'
require_relative 'rule'

class Player
  include Rule
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
