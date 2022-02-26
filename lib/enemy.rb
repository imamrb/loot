class Enemy
  attr_accessor :name, :power, :health

  NAMES = %w[HULK IMP GIANT LAVA HOUND]

  def initialize(is_boss: false)
    @power = is_boss ? 8 : rand(1..5)
    @name = NAMES.sample
    @health = is_boss ? 50 : rand(10..30)
  end

  def alive?
    health.positive?
  end

  def hit(hp)
    self.health -= hp
  end

  def info
    status
    puts "You are facing enemy #{name}! What do you do? (fight/run)"
  end

  def hit_power
    (1..power).to_a.sample
  end

  def status
    puts '-' * 50
    puts "--- ENEMY NAME : #{name} ---"
    puts "--- HP : #{health} ---"
    puts "--- POWER : #{power} ---"
    puts '-' * 50
  end
end
