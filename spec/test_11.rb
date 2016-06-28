require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 health points" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the barracks health_points by unit specified's attack" do
      enemy = Unit.new(40, 5)
      enemy.attack!(@barracks)

      expect(@barracks.health_points).to eq(495)
    end

    it "should reduce the barracks health_points by half damage if attacked by footmen" do
      enemy = Footman.new()
      enemy.attack!(@barracks)

      expect(@barracks.health_points).to eq(495)
    end
  end

end