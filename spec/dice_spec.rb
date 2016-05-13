require 'dice'

describe Dice do
  dice = Dice.new

  it "has 6 faces" do
    expect(dice.faces.count).to eql(6)
  end

  describe ".roll" do
    it "return any number between 1 to 6" do
      last_roll = dice.roll
      expect(%w(1 2 3 4 5 6)).to include(last_roll)
    end

    it "has last roll recorded" do
      last_roll = dice.roll
      expect(dice.last_roll).to eq(last_roll)
    end
  end
end
