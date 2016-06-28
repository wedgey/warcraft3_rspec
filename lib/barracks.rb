class Barracks
  attr_reader :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def train_footman
    if self.can_train_footman?
      @gold -= 135
      @food -= 2
      return Footman.new
    else 
      return nil
    end
  end

  def can_train_footman?
    self.food >= 2 and self.gold >= 135 ? true : false
  end

  def train_peasant
    if self.can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_train_peasant?
    self.food >= 5 and self.gold >= 90 ? true : false
  end
end
