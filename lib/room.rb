# frozen_string_literal: true

# room is single unit of the world
class Room
  attr_accessor :lat, :long, :world, :type, :completed

  class Empty
    def info
      UI.empty_room_info
    end
  end

  def initialize(world:, lat:, long:, completed: false)
    @completed = completed
    @world = world
    @lat = lat
    @long = long
    @type = get_type
  end

  def enemy
    @type if @type.instance_of? Enemy
  end

  def event
    @type if @type.instance_of? Event
  end

  def mark_complete
    world.visit(lat, long)
    self.completed = true
    self.type = Empty.new
  end

  def location_info
    UI.room_location_info(lat, long)
  end

  def info
    @type.info
  end

  def get_type
    return Empty.new if completed
    return Enemy.new({ boss: true }) if world.last_room?

    [Enemy, Event, Enemy].sample.new
  end
end
