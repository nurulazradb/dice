class Dice
  attr_reader :faces

  def initialize
    @faces = %w(1 2 3 4 5 6)
  end

  def roll
    @faces.sample
  end
end
