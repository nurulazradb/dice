class Game
  attr_reader :players, :winner

  def initialize
    @players = []
    @winner = nil
  end

  def add_player(player)
    @players << player
  end

  def set_winner(player)
    @winner = player
  end

  def is_ended?
    !@winner.nil?
  end
end
