require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its 500 lumber resource" do
    expect(@barracks.lumber).to eq(500)
  end

  describe "#build_siege" do
    it "should not build a siege or reduce resources and return false if it does not have enough lumber" do
      allow(@barracks).to receive(:lumber).and_return(10)
      build = @barracks.build_siege
      expect(build).to be false
      expect(@barracks.gold).to be(1000)
      expect(@barracks.food).to be(80)
      expect(@barracks.lumber).to be(10)
    end

    it "should not build a siege or reduce resources and return false if it does not have enough gold" do
      allow(@barracks).to receive(:gold).and_return(10)
      build = @barracks.build_siege
      expect(build).to be false
      expect(@barracks.gold).to be(10)
      expect(@barracks.food).to be(80)
      expect(@barracks.lumber).to be(500)
    end

    it "should not build a siege or reduce resources and return false if it does not have enough food" do
      allow(@barracks).to receive(:food).and_return(1)
      build = @barracks.build_siege
      expect(build).to be false
      expect(@barracks.gold).to be(1000)
      expect(@barracks.food).to be(1)
      expect(@barracks.lumber).to be(500)
    end

    it "should build a siege engine and reduce resources if given enough resources" do
      build = @barracks.build_siege
      expect(build).to be_an_instance_of(SiegeEngine)
      expect(@barracks.gold).to be(800)
      expect(@barracks.food).to be(77)
      expect(@barracks.lumber).to be(440)
    end
  end
end