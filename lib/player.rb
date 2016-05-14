require_relative 'rule'

class Player
  include Rule
  attr_reader :dices, :name
  attr_accessor :stolen_dices

  def initialize(name)
    @name = name
    @dices = []
    @stolen_dices = []
  end

  def add_dice(dice)
    @dices << dice unless dice.nil?
  end

  def remove_dice(dice)
    @dices.delete(dice)
  end
end
