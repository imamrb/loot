class Room
  attr_accessor :lat, :long, :world, :type, :completed

  class Empty
    def info
      puts 'Theres nothing new here.'
      puts 'Move on to a new cell using navigation commands. (up/down/left/right) '
    end
  end

  def initialize(world:, lat:, long:, completed: false)
    @completed = completed
    @world = world
    @lat = lat
    @long = long
    @type = get_type
  end

  def interact(player)
    @type.interact(player)
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

  def info
    puts "You are now in room: #{lat}, #{long}"
    @type.info
  end

  def get_type
    return Empty.new if completed
    return Enemy({ is_boss: true }).new if world.last_room?

    [Enemy, Event, Enemy].sample.new
  end
end
