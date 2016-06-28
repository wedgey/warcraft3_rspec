class Barracks
  attr_reader :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
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

  # def damage(enemy)
  #   @health_points -= enemy.class == Footman ? (enemy.attack_power / 2).ceil : enemy.attack_power
  # end
  def dead?
    self.health_points <= 0 ? true : false
  end

  def damage(amount)
    self.dead? ? false : @health_points -= amount
  end

  def build_siege
    if self.lumber < 60 or self.gold < 200 or self.food < 3
      false
    else
      @gold -= 200
      @lumber -= 60
      @food -= 3
      SiegeEngine.new
    end
  end
end
