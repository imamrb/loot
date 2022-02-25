class Player
  attr_accessor :lat, :long, :name, :world

  def initialize(name:, lat:, long:, world:)
    @name = name
    @lat = lat
    @long = long
    @world = world
  end

  def current_pos
    [lat, long]
  end

  def move(direction)
    case direction
    when 'up'
      self.lat -= 1
    when 'down'
      self.lat += 1
    when 'right'
      self.long += 1
    when 'left'
      self.long -= 1
    end

    revisit = true

    unless world.visited?(lat, long)
      world.visit(lat, long)
      revisit = false
    end

    Room.new({ lat: lat, long: long, revisit: revisit, world: world })
  end
end
