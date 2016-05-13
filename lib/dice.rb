class Dice
  attr_reader :faces, :last_roll

  def initialize
    @faces = %w(1 2 3 4 5 6)
    @last_roll = nil
  end

  def roll
    @last_roll = @faces.sample
  end
end
