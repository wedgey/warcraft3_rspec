class Unit
  attr_reader :health_points, :attack_power

  def initialize(health, attack_power)
    @health_points = health
    @attack_power = attack_power
  end

  def damage(amount)
    @health_points -= amount
  end

  def attack!(enemy)
    enemy.damage(self.attack_power)
  end

end