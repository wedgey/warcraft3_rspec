require_relative 'spec_helper'

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  describe "initialization" do

    it "creates a new SiegeEngine with AP:50, HP:400" do
      expect(@siege_engine).to be_an_instance_of(SiegeEngine)
      expect(@siege_engine.attack_power).to eq(50)
      expect(@siege_engine.health_points).to eq(400)
    end

  end

  describe "#attack" do

    it "should not attack other units" do
      unit = Unit.new(100,3)
      attack = @siege_engine.attack!(unit)

      expect(attack).to be false
      expect(unit.health_points).to eq(100)
    end

    it "should not attack other peasants" do
      unit = Peasant.new
      attack = @siege_engine.attack!(unit)

      expect(attack).to be false
      expect(unit.health_points).to eq(35)
    end

    it "should not attack other footmen" do
      unit = Footman.new
      attack = @siege_engine.attack!(unit)

      expect(attack).to be false
      expect(unit.health_points).to eq(60)
    end

    it "should do double damage to barracks" do
      barracks = Barracks.new
      # expect(barracks).to receive(:damage).at_least(10).times
      attack = @siege_engine.attack!(barracks)

      expect(barracks.health_points).to eq(400)
    end

    it "should be able to attack other SiegeEngines" do
      enemy = SiegeEngine.new
      # allow(enemy).to receive(:damage).at_least(2).times
      attack = @siege_engine.attack!(enemy)

      expect(enemy.health_points).to eq(350)
    end
  end
end