# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  attr_reader :health_points, :attack_power

  def initialize
    @health_points = 60
    @attack_power = 10
  end

  def attack!(enemy)
    if self.dead?
      false
    else
      if enemy.class == Barracks
        enemy.damage((self.attack_power / 2).ceil)
      else
        enemy.damage(self.attack_power)
      end
    end
  end

  # def damage(amount)
  #   @health_points -= amount
  # end

end
