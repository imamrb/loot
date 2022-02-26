class Enemy
  attr_reader :name, :power, :health

  NAMES = %w(HULK IMP GIANT LAVA HOUND)

  def initialize
    @power = rand(1..100)
    @name = NAMES.sample
    @health = rand(1..100)
  end

  def info
    "You are facing enemy #{name}! What do you do? (fight/run)"
  end
end
