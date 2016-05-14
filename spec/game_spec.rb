require 'game'
require 'player'

describe Game do
  game = Game.new

  context "when it first created" do
    it "has zero players" do
      expect(game.players.count).to be_zero
    end
  end

  context ".add_player" do
    it { is_expected.to respond_to(:add_player) }

    it "has 1 player" do
      p1 = Player.new("Player A")
      expect { game.add_player(p1) }.to change { game.players.count }.by 1
    end

    it "has 2 players" do
      p2 = Player.new("Player B")
      expect { game.add_player(p2) }.to change { game.players.count }.by 1
      expect(game.players.count).to eq 2
    end
  end

  context ".add_winner" do
    it { is_expected.to respond_to(:add_winner) }

    it "still in plays" do
      expect(game.is_ended?).to be_falsy
    end

    it "has a winner" do
      p1 = Player.new("Player C")
      game.add_winner(p1)

      expect(game.winners).to eql([p1])
    end

    it "has ended" do
      expect(game.is_ended?).to be_truthy
    end
  end
end
