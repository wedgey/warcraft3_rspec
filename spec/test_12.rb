require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(200, 10)
  end

  describe "#dead?" do
    it "should return false if the unit is not dead" do
      expect(@unit.dead?).to be false
    end

    it "should return false if the unit is dead" do
      @unit.damage(200)

      expect(@unit.dead?).to be true
    end
  end

  describe "#attack!" do
    it "should not deal any damage if the target is dead" do
      enemy_unit = Unit.new(0, 10)
      damage = @unit.attack!(enemy_unit)
      expect(damage).to be false
      expect(enemy_unit.health_points).to eq(0)
    end

    it "should not be able to deal any damage if the unit is dead" do
      enemy_unit = Unit.new(100, 10)
      @unit.damage(200)
      damage = @unit.attack!(enemy_unit)
      expect(damage).to be false
      expect(enemy_unit.health_points).to eq(100)
    end
  end

end