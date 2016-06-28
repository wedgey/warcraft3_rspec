class Unit
  attr_reader :health_points, :attack_power

  def initialize(health, attack_power)
    @health_points = health
    @attack_power = attack_power
  end

  def damage(amount)
    self.dead? ? false : @health_points -= amount
  end

  def attack!(enemy)
    self.dead? ? false : enemy.damage(self.attack_power)
  end

  def dead?
    self.health_points <= 0 ? true : false
  end

end