class Room
  attr_reader :lat, :long, :world, :type, :revisit

  class Empty
    def info
      puts 'Theres nothing new here.'
    end
  end

  def initialize(world:, lat:, long:, revisit:)
    @world = world
    @lat = lat
    @long = long
    @revisit = revisit
    @type = get_type
  end

  def interact(player)
    @type.interact(player)
  end

  def info
    puts "You are now in cell #{lat}, #{long}"
    @type.info
  end

  def get_type
    return Empty.new if revisit
    return Enemy({ is_boss: true }).new if world.last_room?

    [Enemy, Event, Enemy].sample.new
  end
end
