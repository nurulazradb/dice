require 'player'
require 'dice'

describe Player do
  player = Player.new

  context "when it is first created" do
    it "has empty dices" do
      expect(player.dices.count).to eq(0)
    end
  end

  context ".add_dice" do
    it { is_expected.to respond_to(:add_dice) }

    it "has 1 dice" do
      dice = Dice.new
      expect { player.add_dice(dice) }.to change { player.dices.count }.by (1)
    end
  end

  context "can roll a dice" do
    it "return any number between 1 to 6" do
      first_dice = player.dices.first
      expect(%w(1 2 3 4 5 6)).to include(player.dices.first.roll)
    end
  end

  context ".remove_dice" do
    it { is_expected.to respond_to(:remove_dice) }

    it "will have zero dice" do
      player.remove_dice(player.dices.first)

      expect(player.dices.count).to eq(0)
    end
  end
end
