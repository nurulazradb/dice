require 'dice'

describe Dice do
  dice = Dice.new

  it "has 6 faces" do
    expect(dice.faces.count).to eql(6)
  end

  describe "#roll" do
    it "return any number between 1 to 6" do
      expect(%w(1 2 3 4 5 6)).to include(dice.roll)
    end
  end
end
