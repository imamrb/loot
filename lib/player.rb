# frozen_string_literal: true

# Defines a Player Class
class Player < Character
  attr_accessor :lat, :long, :world

  MAX_HEALTH = 100
  MAX_POWER = 10

  def initialize(lat:, long:, world:, name: 'player')
    health = MAX_HEALTH
    power = MAX_POWER
    type = 'player'
    super(type, name, health, power)

    @lat = lat
    @long = long
    @world = world

    world.visit(lat, long)
  end

  def current_pos
    [lat, long]
  end

  def power_up(power)
    self.power += power
  end

  def heal(hp)
    self.health += hp
  end

  def can_move?(direction)
    n_lat, n_long = world.move_location(direction, lat, long)
    world.valid_location?(n_lat, n_long)
  end

  def move(direction)
    self.lat, self.long = world.move_location(direction, lat, long)

    [lat, long]
  end
end
