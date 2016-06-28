# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  attr_reader :health_points, :attack_power

  def initialize
    @health_points = 60
    @attack_power = 10
  end

  # def attack!(enemy)
  #   enemy.damage(10)
  # end

  # def damage(amount)
  #   @health_points -= amount
  # end

end
