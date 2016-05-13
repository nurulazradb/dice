class Game
  attr_reader :players, :winners

  def initialize
    @players = []
    @winners = []
  end

  def add_player(player)
    @players << player
  end

  def add_winner(player)
    @winners << player
  end

  def is_ended?
    !@winners.empty?
  end
end
