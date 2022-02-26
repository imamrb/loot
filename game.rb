Dir['lib/*.rb'].each { |file| require_relative file }

class Game
  attr_accessor :running, :world, :player, :room

  MAP_ROWS = 3
  MAP_COLUMNS = 3
  INITIAL_LATITUDE = MAP_ROWS / 2
  INITIAL_LONGITUDE = MAP_COLUMNS / 2

  def initialize
    @running = true
    @world = World.new({ rows: MAP_ROWS, columns: MAP_COLUMNS })
    @player = Player.new({ lat: INITIAL_LATITUDE, long: INITIAL_LONGITUDE, world: world })
    @room = Room.new({ lat: INITIAL_LATITUDE, long: INITIAL_LONGITUDE, world: world })
  end

  def self.play
    new.play
  end

  def play
    name = UI.ask("What's your name? ")
    player.name = name

    UI.welcome(player.name)

    while running
      cmd = UI.get_cmd
      execute_cmd(cmd)

      abort UI.player_dead if player.dead?
    end
  end

  private

  def error_handler
    yield
  rescue StandardError => e
    puts e.to_s
  end

  def execute_cmd(cmd)
    error_handler do
      case cmd
      when 'map', 'm'
        world.show_map
        room.info
      when 'exit', 'quit', 'q', 'e'
        UI.exit
        self.running = false
      when 'help', 'h'
        UI.help(room)
      when 'status'
        player.status
      when 'fight', 'run', 'f', 'r'
        PlayerAction.call(cmd, room, player)
      when 'yes', 'no'
        EventHandler.call(cmd, room, player)
      when 'up', 'down', 'left', 'right'
        do_move
      else
        UI.invalid_action
      end
    end
  end

  def do_move
    if room.completed
      if player.can_move?(cmd)
        self.room = player.move(cmd)
        puts room.info
      else
        UI.area_out_of_bounds
      end
    else
      UI.clear_this_room_first
    end
  end
end

Game.play
