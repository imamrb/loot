class Player
  attr_accessor :lat, :long, :name, :world, :health, :power

  MAX_HEALTH = 100
  MAX_POWER = 10

  def initialize(lat:, long:, world:, name: 'player')
    @name = name
    @lat = lat
    @long = long
    @world = world
    @health = MAX_HEALTH
    @power = MAX_POWER

    world.visit(lat, long)
  end

  def current_pos
    [lat, long]
  end

  def alive?
    health.positive?
  end

  def hit(hp)
    self.health -= hp
  end

  def power_up(power)
    self.power += power
  end

  def heal(hp)
    self.health += hp
  end

  def hit_power
    (1..power).to_a.sample
  end

  def can_move?(direction)
    n_lat, n_long = world.move_location(direction, lat, long)
    world.valid_location?(n_lat, n_long)
  end

  def move(direction)
    self.lat, self.long = world.move_location(direction, lat, long)

    completed = true
    unless world.visited?(lat, long)
      world.visit(lat, long)
      completed = false
    end

    Room.new({ lat: lat, long: long, completed: completed, world: world })
  end

  def status
    puts '-' * 50
    puts "--- PLAYER NAME : #{name} ---"
    puts "--- HP : #{health} / #{MAX_HEALTH} ---"
    puts "--- POWER : #{power} ---"
    puts '-' * 50
  end
end
